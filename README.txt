This README describes the files and folders in PDDL-parser:

MotivationExample : PDDL files of the motivation example
TestProblems : standard IPC benchmark problems (Blocksworld, Driverlog, Elevators, Rover and Logistics).
TestProblems_new : modified version of TestProblem.
goal_state.py : function that generates all possible fluents after running the optimal plan to achieve a certain goal, this file contains also useful functions.
fluent_prob.py : function that creates a dataframe containing the probabilities of each fluent in the final goal state.
main.py : function of the proposed algorithm.
script_new : function that generates new modified versions of pddl files.
test.py : function that runs the proposed algorithm over the nmodified IPC benchmark problems.
test_MotivationExample.py : function that runs the proposed algorithm on the motivation example.
useful.py : this file contains most of the useful functions in this work.
Test.ipynb : jupyter notebook to test the results of both the motivation example and the remaining problems used for evaluation.
Data : Folder containing all data extracted from running the evaluation problems 10 times. 
out.csv : csv file for running the evaluation problems 1 time.

To generate all of ours plans we used Fastdownward planner and the PDDL parser (https://github.com/karthikv792/PDDL-parser).