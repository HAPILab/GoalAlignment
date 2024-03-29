
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain test_domain)
    (:requirements :typing :equality)
    (:types
        location - object
        locatable - object
        driver - locatable
        truck - locatable
        obj - locatable
    )

    (:constants
        
    )

    (:predicates
        (at ?x1 - locatable ?x2 - location)
        (in ?x1 - obj ?x2 - truck)
        (driving ?x1 - driver ?x2 - truck)
        (link ?x1 - location ?x2 - location)
        (path ?x1 - location ?x2 - location)
        (empty ?x1 - truck)
    )

    (:functions
        
    )

    

    
    (:action LOAD-TRUCK
     :parameters (?obj - obj ?truck - truck ?loc - location)
     :precondition (and (at ?truck ?loc) (at ?obj ?loc))
     :effect (and
        (in ?obj ?truck)
        (not (at ?obj ?loc)))
    )


    (:action UNLOAD-TRUCK
     :parameters (?obj - obj ?truck - truck ?loc - location)
     :precondition (and (at ?truck ?loc) (in ?obj ?truck))
     :effect (and
        (at ?obj ?loc)
        (not (in ?obj ?truck)))
    )


    (:action BOARD-TRUCK
     :parameters (?driver - driver ?truck - truck ?loc - location)
     :precondition (and (at ?truck ?loc) (at ?driver ?loc) (empty ?truck))
     :effect (and
        (driving ?driver ?truck)
        (not (at ?driver ?loc))
        (not (empty ?truck)))
    )


    (:action DISEMBARK-TRUCK
     :parameters (?driver - driver ?truck - truck ?loc - location)
     :precondition (and (at ?truck ?loc) (driving ?driver ?truck))
     :effect (and
        (at ?driver ?loc)
        (empty ?truck)
        (not (driving ?driver ?truck)))
    )


    (:action DRIVE-TRUCK
     :parameters (?truck - truck ?loc-from - location ?loc-to - location ?driver - driver)
     :precondition (and (at ?truck ?loc-from) (driving ?driver ?truck) (link ?loc-from ?loc-to))
     :effect (and
        (at ?truck ?loc-to)
        (not (at ?truck ?loc-from)))
    )


    (:action WALK
     :parameters (?driver - driver ?loc-from - location ?loc-to - location)
     :precondition (at ?driver ?loc-from)
     :effect (and
        (at ?driver ?loc-to)
        (not (at ?driver ?loc-from)))
    )

)