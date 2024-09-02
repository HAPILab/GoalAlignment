from Parser.parser_new import parse_model
from Parser.writer_new import ModelWriter

def goal_state(domain_file, problem_file, plan_file):
    
    G = set()
    
    model_dict = parse_model(domain_file, problem_file)
    plan = open(plan_file).readlines()
    
    
    if plan[-1][0] == ';':
        
        actions_to_goal = [ plan[i][1:len(plan[i])-2].split(' ') for i in range(len(plan)-1)]
        actions_to_goal = helper(actions_to_goal)
        cost = cost_(plan)
    
    else :
        actions_to_goal = [ plan[i][1:len(plan[i])-2].split(' ') for i in range(len(plan))]
        actions_to_goal = helper(actions_to_goal)
        cost = len(plan)
    
    
    Iset = I_to_set(model_dict['instance']['init']['pred'])
    ADDS = actions_to_set('adds', actions_to_goal, model_dict)
    G = Iset.union(ADDS)
    DELS = actions_to_set('dels', actions_to_goal, model_dict)
    G = G.difference(DELS)
    
    return G, cost
    

def cost_(plan):
    
    for c in plan[-1].split(' '):
        
        isInt = True
        try:
            int(c)
        except ValueError:
            isInt = False
        if isInt:
            cost = int(c)
            return cost
        
def helper(lista):
    
    lista_new = []
    for e in lista:
        aux1 = []
        aux1.append(e[0])
        
        if e[1] == '':
            aux1.append([])
        else :
            aux = []
            for i in range(len(e)-1):
                aux.append(e[i+1])
            aux1.append(aux)
        lista_new.append(aux1)
                
    return lista_new

def I_to_set(I):
    
    Iset = set()
    for x in I:
        if len(x[1]) == 0:
            Iset.add(x[0]) 
        else :
            aux = x[0]
            for i in range(len(x[1])):
                aux = aux + ' ' + x[1][i]
            Iset.add(aux)
          
    return Iset
    
def actions_to_set(specif, list_actions, model_dict):
    
    S = set()
    for action in list_actions:
      
        try :
            action_specif = model_dict['domain'][action[0]][specif]
        except KeyError : 
            action[0] = action[0].upper()
            action_specif = model_dict['domain'][action[0]][specif]
        
        for x in action_specif:
            if len(x[1]) == 0: 
                S.add(x[0])
            else:
                aux = ''
                for k in range(len(x[1])):
                    if x[1][k][0] == '?':
                        var = x[1][k][1:]
                        l = 0
                        for i in model_dict['domain'][action[0]]['params']:
                            if (i[0] == var):
                                break
                            l+=1
                        aux = aux + action[1][l] + ' '
                S.add(x[0] + ' ' + aux[:-1])

    return S       