import pandas as pd
from main import HAGL
from useful import *
import time 

results = {}
Problems = ['blocks', 'driverlog', 'elevator', 'logistics', 'rover']
Instances = ['instance-1', 'instance-2', 'instance-3', 'instance-4', 'instance-5']

columns = ['Problem', 'Length', 'No-queries', 'Cost-before', ' Cost-after', 'Time']
data = pd.DataFrame(columns=columns)

for p in Problems:
    for i in Instances:
    
        DomainR = 'TestProblems_new/' + p + '/' + i + '/' + 'robot_domain.pddl'
        ProblemR = 'TestProblems_new/' + p + '/' + i + '/' + 'robot_problem.pddl'
        DomainH = 'TestProblems_new/' + p + '/' + i + '/' + 'known_human_domain.pddl'
        ProblemH = 'TestProblems_new/' + p + '/' + i + '/' + 'unknown_human_problem.pddl'
        GoalforR = extractgoal(DomainH, 'TestProblems_new/' + p + '/' + i + '/' + 'known_human_problem.pddl')
        planH = 'TestProblems_new/' + p + '/' + i + '/' + 'human_plan'
        start_time = time.time()
     
        output  = HAGL(DomainR, ProblemR, DomainH, ProblemH, 
                         GoalforR, planH)

        print('length = ',  output[0])
        print('No queries = ', output[1])
        print('Cost before = ', output[3])
        print('Cost after = ', output[2])

        print("--- %s seconds ---" % (time.time() - start_time))
        result = [p + '-' + i, output[0], output[1], output[3], output[2], time.time() - start_time]
        data = pd.concat([data, pd.DataFrame([result], columns=columns)], ignore_index=True)

print('--------------------------------------\n',data)                       