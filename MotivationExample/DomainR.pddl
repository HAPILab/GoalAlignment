(define 
    (domain tea-making-r)
    (:requirements :typing)
    (:types
       tealeavesquality - object  
       ;;goodqualitytealeaves normalqualitytealeaves  - tealeavesquality
        )
    (:predicates
          (extendedarm) (tea-made) (tea-made-with ?x - tealeavesquality) (on-upper-shelf ?x - tealeavesquality) 
          (on-lower-shelf ?x - tealeavesquality) (in-kitchen) (has-tealeaves ?x - tealeavesquality) 
          (can_climb) (ladder-next-pantry) (ladder-used) (dummy)
        )
        
    (:action bring_ladder
        :parameters ()
        :precondition (and 
             (in-kitchen) )
        :effect
            (ladder-next-pantry) 
          )
    
    (:action grab_tealeaves
        :parameters ( ?n - tealeavesquality)   
        :precondition (and 
            (on-lower-shelf ?n) (in-kitchen))
        :effect 
            (has-tealeaves ?n)
    )
    
    (:action reach_tealeaves_extend_arm
        :parameters ( ?g - tealeavesquality)   
        :precondition (and 
            (on-upper-shelf ?g) (in-kitchen))
        :effect (and
            (extendedarm) (has-tealeaves ?g))
        )
    
    (:action reach_tealeaves_ladder
        :parameters ( ?g - tealeavesquality)   
        :precondition (and 
           (ladder-next-pantry) (on-upper-shelf ?g) (can_climb))
        :effect (and 
            (has-tealeaves ?g) (ladder-used))
        )
    (:action make_tea
        :parameters ( ?t - tealeavesquality)
        :precondition
            (has-tealeaves ?t) 
        :effect(and
            (tea-made) (tea-made-with ?t))
        )
    )
