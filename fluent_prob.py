import pandas as pd
import numpy as np
from Parser.parser_new import parse_model
from Parser.writer_new import ModelWriter
import os
import subprocess
from goal_state import cost_
import copy

def fluent_prob(main_G, goal_S, cost_H, domain_file, problem_file):
    

    df = {'fluent': [], 'cost' : [] }
    goal_S1 = copy.deepcopy(goal_S)
    goal_S1.difference_update(main_G)
    model_dict = parse_model(domain_file, problem_file)
    
    for fluent in goal_S1 :
        
        Set1 = copy.deepcopy(main_G)
        Set1.add(fluent)
        fluent_tolist = set_tolist_format(Set1)
       
        model_dict1 = copy.deepcopy(model_dict)
        model_dict1['instance']['goal'] = fluent_tolist
        new_model = ModelWriter(model_dict1)
        new_model.write_files('domain_new.pddl','problem_new.pddl')
        os.system('python3.6 downward/fast-downward.py domain_new.pddl problem_new.pddl --search "astar(lmcut())"');
        try:
            with open('sas_plan') as f:
                plan = f.readlines()
                try :
                    cost = cost_(plan)
                except:
                    cost = len(plan)
                    
                df['fluent'].append(fluent)
                df['cost'].append(cost)
                os.remove('sas_plan')
        except FileNotFoundError:
            
            cost = float('inf')
            df['fluent'].append(fluent)
            df['cost'].append(cost)
        
    data = pd.DataFrame(df)
    data['prob'] = np.exp(- abs(data['cost'] - cost_H))
    return data

def set_tolist_format(S):
    
    fluent_list = []
    
    for f in list(S):
        aux = f.split(' ')
        aux_list = []
        aux_list.append(aux[0]) 
        
        if len(aux) == 1:
            aux_list.append([])
            fluent_list.append(aux_list)
        else : 
            L = []
            for i in range(len(aux)-1):
                L.append(aux[i+1])
            aux_list.append(L)
            fluent_list.append(aux_list)

    return fluent_list
