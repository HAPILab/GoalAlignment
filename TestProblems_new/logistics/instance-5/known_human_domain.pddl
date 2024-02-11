
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain test_domain)
    (:requirements :equality :typing)
    (:types
        physobj - object
        vehicle - physobj
        package - physobj
        airplane - vehicle
        truck - vehicle
        place - object
        location - place
        airport - place
        city - object
    )

    (:constants
        
    )

    (:predicates
        (in-city ?x1 - place ?x2 - city)
        (at ?x1 - physobj ?x2 - place)
        (in ?x1 - package ?x2 - vehicle)
    )

    (:functions
        
    )

    

    
    (:action LOAD-TRUCK
     :parameters (?pkg - package ?truck - truck ?loc - place)
     :precondition (and (at ?truck ?loc) (at ?pkg ?loc))
     :effect (and
        (in ?pkg ?truck)
        (not (at ?pkg ?loc)))
    )


    (:action LOAD-AIRPLANE
     :parameters (?pkg - package ?airplane - airplane ?loc - place)
     :precondition (and )
     :effect (and
        (in ?pkg ?airplane)
        (not (at ?pkg ?loc)))
    )


    (:action UNLOAD-TRUCK
     :parameters (?pkg - package ?truck - truck ?loc - place)
     :precondition (and (at ?truck ?loc) (in ?pkg ?truck))
     :effect (and
        (at ?pkg ?loc)
        (not (in ?pkg ?truck)))
    )


    (:action UNLOAD-AIRPLANE
     :parameters (?pkg - package ?airplane - airplane ?loc - place)
     :precondition (at ?airplane ?loc)
     :effect (and
        (at ?pkg ?loc)
        (not (in ?pkg ?airplane)))
    )


    (:action DRIVE-TRUCK
     :parameters (?truck - truck ?loc-from - place ?loc-to - place ?city - city)
     :precondition (and (at ?truck ?loc-from) (in-city ?loc-from ?city) (in-city ?loc-to ?city))
     :effect (and
        (at ?truck ?loc-to)
        (not (at ?truck ?loc-from)))
    )


    (:action FLY-AIRPLANE
     :parameters (?airplane - airplane ?loc-from - airport ?loc-to - airport)
     :precondition (and )
     :effect (and
        (at ?airplane ?loc-to)
        (not (at ?airplane ?loc-from)))
    )

)