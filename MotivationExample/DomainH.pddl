(define 
    (domain tea-making-h)
    (:requirements :typing)
    (:types
      tealeavesquality - object 
      ;;goodqualitytealeaves normalqualitytealeaves  - tealeavesquality
    )
    
    (:predicates
          (ladder-used) (tea-made) (tea-made-with ?x - tealeavesquality) (ladder-next-pantry)
          (on-upper-shelf ?x - tealeavesquality) (on-lower-shelf ?x - tealeavesquality) (in-kitchen) 
          (has-tealeaves ?x - tealeavesquality) (upper-shelf-reached) (dummy)
        )
    
    (:action bring_ladder
        :parameters () 
        :precondition 
            (in-kitchen)
        :effect
            (ladder-next-pantry) 
          )
    
    (:action grab_tealeaves
        :parameters ( ?n - tealeavesquality)   
        :precondition (and 
            (in-kitchen) (on-lower-shelf ?n))
        :effect 
            (has-tealeaves ?n)
        )
    (:action climb_ladder
        :parameters ()
        :precondition
            (ladder-next-pantry)
        :effect 
            (upper-shelf-reached)
    )
    
    (:action reach_ladder_tealeaves
        :parameters ( ?g - tealeavesquality)   
        :precondition (and 
           (upper-shelf-reached) (on-upper-shelf ?g))
        :effect (and 
            (has-tealeaves ?g) (ladder-used) (not(upper-shelf-reached)) )
        )
    
    
    (:action make_tea
        :parameters ( ?t - tealeavesquality)
        :precondition 
            (has-tealeaves ?t) 
        :effect
            (and (tea-made-with ?t) (tea-made) )
        )
)
    
