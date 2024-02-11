from Parser.parser_new import parse_model
from Parser.writer_new import ModelWriter
from goal_state import cost_
import os 
from fluent_prob import set_tolist_format
from goal_state import I_to_set
import copy

def solvable_specifgoal(domain_file, problem_file, goal, verbose = False):
    
    model_dict = parse_model(domain_file, problem_file)
    model_dict1 = copy.deepcopy(model_dict)
        
   
    model_dict1['instance']['goal'] = goal
    
    newmodel = ModelWriter(model_dict1)
    newmodel.write_files('domain_new.pddl','problem_new.pddl')
    os.system('python3.6 downward/fast-downward.py domain_new.pddl problem_new.pddl --search "astar(lmcut())"');
    try:
        with open('sas_plan') as f:
            plan = f.readlines()
            if plan[-1][0] == ';' :
                cost = cost_(plan)
                if verbose:
                    print('Solvable,\nPlan :\n', plan[:-1],'Cost = ', cost)
            else: 
                cost = len(plan)
                if verbose:
                    print('Solvable,\nPlan :\n', plan,'Cost = ', cost)
        os.remove('sas_plan')
        return True, cost
    except FileNotFoundError:
        return False, 

def F_hat_(df, GoalState):
    
    F = set()
    try : 
        L = set(list(df[df['prob'] == 0].fluent))
        F = GoalState.intersection(L)
    except:
        pass
    return F      

def in_(f, goal):
    return f in goal

def VQ(f, df, F):
    
    proba =  df[df['fluent']==f].prob.values[0]
    print(f, proba, V(f,df, True, F), V(f,df, False, F))
    value = proba*V(f,df, True, F) + (1-proba)*V(f,df, False, F)
    
    
    return(value)
    

def V(f, df, in_goal, F_hat):
                
    if in_goal :
                
        try:
            
            if f in F_hat:
                return 1
            else :
                P = 1
                for i in F_hat:
                    if i != f:
                        P = P * df[df['fluent']==i].prob.values[0]
                return P
        except IndexError :
            print('nope')
            
    else :
        F_hat1 = copy.deepcopy(F_hat)
        try:
            F_hat1.remove(f)
        except KeyError:
            pass
        P = 1
        for i in F_hat1:
            P = P * df[df['fluent']==i].prob.values[0]
        
        return P
    
def O_H(f, G):
    if f in G:
        return 1
    
    
def extractgoal(domainfile, problemfile):
    model_dict = parse_model(domainfile, problemfile)
    list1 = model_dict['instance']['goal'] 
    
    return (I_to_set(list1))
    
    
def correctparser(S):
    return S.add('dummy')

def solver(domainfile, problemfile):
    os.system('python3.6 downward/fast-downward.py ' + domainfile + ' ' + problemfile +' --search "astar(lmcut())"');
    