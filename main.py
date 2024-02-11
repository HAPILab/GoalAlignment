from goal_state import *
from fluent_prob import *
from useful import *
import pandas as pd 
import numpy as np
import copy

#HAGL('downward/DomainR.pddl', 'downward/pfileR.pddl', 'tea-made', 'downward/plan_H')

def HAGL(Domain_fileR, Problem_fileR, 
         Domain_fileH, Problem_fileH, 
         GoalforR, plan_fileH): 
  
    count = 0 
    if len(GoalforR) == 1: #solver limitation
        GoalforR1 = GoalforR.union({'dummy'})
        GoalforR_list = set_tolist_format(GoalforR1)
    else : 
        GoalforR_list = set_tolist_format(GoalforR)
    
    if not solvable_specifgoal(Domain_fileR, Problem_fileR, GoalforR_list)[0]: #no need to go further
        return('No plan exists',)
    costi = solvable_specifgoal(Domain_fileR, Problem_fileR, GoalforR_list)[1]
   
    
    GoalStateH, cost_H = goal_state(Domain_fileH, Problem_fileH, plan_fileH)
    GoalStateH_list = set_tolist_format(GoalStateH)
    
    if solvable_specifgoal(Domain_fileR, Problem_fileR, GoalStateH_list, verbose=True)[0]: #solvable with goal state (best case)
        print('Solvable given the goal state\n')
        cost1 = solvable_specifgoal(Domain_fileR, Problem_fileR, GoalStateH_list, verbose=False)[1]
        length = len(GoalStateH)
        output = length, count, cost1, costi
        return(output)
    
    
    solver(Domain_fileR, Problem_fileR)
    GoalStateR, _ = goal_state(Domain_fileR, Problem_fileR, 'sas_plan')  #'sas_plan' created from solver
    
    #create dataframes with probabilities of each fluent
    df = fluent_prob(GoalforR, GoalStateH, cost_H, Domain_fileH, Problem_fileH) #human
    df1 = fluent_prob(GoalforR, GoalStateH, cost_H, Domain_fileR, Problem_fileR) #robot
    
    F_hat = F_hat_(df1, GoalStateH) #to be computer before removing the goal

    GoalStateH.difference_update(GoalforR)
    length = len(GoalStateH)
    
    Q = {'fluent' : [] , 'VQ' : [] }
    for f in GoalStateH:
        Q['fluent'].append(f)
        Q['VQ'].append(VQ(f, df, F_hat)) 
    dataQ = pd.DataFrame(Q)
    dataQ.sample(frac=1).sort_values('VQ', ascending=True, inplace=True)
    print(dataQ.VQ)
    
    Q = list(dataQ.fluent)
    C = set()
    G = extractgoal(Domain_fileH, Problem_fileH)
    
    #print('F_hat= ', F_hat)
    
    while Q : 
        
        f = Q.pop()
        print('pop ',f)
        
        count = count + 1
        if O_H(f, G) == 1:
         
            C.add(f)
            GoalforR1 = GoalforR.union(C)
            G_list = set_tolist_format(GoalforR1)
            
            if not solvable_specifgoal(Domain_fileR, Problem_fileR, G_list)[0]:
                return('No plan exists',)
           
        else:
           
            G_hat = GoalforR.union(C , set(Q))
            G_list = set_tolist_format(G_hat) 
            
            if solvable_specifgoal(Domain_fileR, Problem_fileR, G_list, verbose=True)[0]:
                cost1 = solvable_specifgoal(Domain_fileR, Problem_fileR, G_list, verbose=False)[1]
                output = length, count, cost1, costi
                return (output)
        
    GoalforR1 = copy.deepcopy(GoalforR)
    GoalforR1.union(C)
    G_list = set_tolist_format(GoalforR1)
    
    if solvable_specifgoal(Domain_fileR, Problem_fileR, G_list, verbose=True)[0]:
        cost1 = solvable_specifgoal(Domain_fileR, Problem_fileR, G_list, verbose=False)[1]
        output = length, count, cost1, costi
        return(output)
    else:
        return('No plan exists',) 
 
        
