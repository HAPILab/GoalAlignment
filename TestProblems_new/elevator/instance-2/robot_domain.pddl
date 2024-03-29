
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain test_domain)
    (:requirements :typing :equality)
    (:types
        passenger - object
        floor - object
    )

    (:constants
        
    )

    (:predicates
        (origin ?x1 - passenger ?x2 - floor)
        (destin ?x1 - passenger ?x2 - floor)
        (above ?x1 - floor ?x2 - floor)
        (boarded ?x1 - passenger)
        (not-boarded ?x1 - passenger)
        (served ?x1 - passenger)
        (not-served ?x1 - passenger)
        (lift-at ?x1 - floor)
    )

    (:functions
        
    )

    

    
    (:action board
     :parameters (?f - floor ?p - passenger)
     :precondition (and (lift-at ?f) (origin ?p ?f))
     :effect (and
        (boarded ?p))
    )


    (:action depart
     :parameters (?f - floor ?p - passenger)
     :precondition (and (lift-at ?f) (destin ?p ?f) (boarded ?p))
     :effect (and
        (served ?p)
        (not (boarded ?p)))
    )


    (:action up
     :parameters (?f1 - floor ?f2 - floor)
     :precondition (and (lift-at ?f1) (above ?f1 ?f2))
     :effect (and
        (lift-at ?f2)
        (not (lift-at ?f1)))
    )


    (:action down
     :parameters (?f1 - floor ?f2 - floor)
     :precondition (and (lift-at ?f1) (above ?f2 ?f1))
     :effect (and
        (lift-at ?f2)
        (not (lift-at ?f1)))
    )

)