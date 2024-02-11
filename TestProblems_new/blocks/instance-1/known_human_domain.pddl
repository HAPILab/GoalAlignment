
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain test_domain)
    (:requirements :equality :typing)
    (:types
        block - object
    )

    (:constants
        
    )

    (:predicates
        (on ?x1 - block ?x2 - block)
        (ontable ?x1 - block)
        (clear ?x1 - block)
        (handempty )
        (holding ?x1 - block)
    )

    (:functions
        
    )

    

    
    (:action pick-up
     :parameters (?x - block)
     :precondition (and (clear ?x) (ontable ?x) (handempty ))
     :effect (and
        (holding ?x)
        (not (ontable ?x))
        (not (clear ?x))
        (not (handempty )))
    )


    (:action put-down
     :parameters (?x - block)
     :precondition (holding ?x)
     :effect (and
        (clear ?x)
        (handempty )
        (ontable ?x)
        (not (holding ?x)))
    )


    (:action stack
     :parameters (?x - block ?y - block)
     :precondition (clear ?y)
     :effect (and
        (clear ?x)
        (handempty )
        (on ?x ?y)
        (not (holding ?x))
        (not (clear ?y)))
    )


    (:action unstack
     :parameters (?x - block ?y - block)
     :precondition (on ?x ?y)
     :effect (and
        (holding ?x)
        (clear ?y)
        (not (clear ?x))
        (not (handempty ))
        (not (on ?x ?y)))
    )

)