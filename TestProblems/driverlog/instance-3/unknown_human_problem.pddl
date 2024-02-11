
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance1)
    (:domain test_domain)

    (:objects
        driver1 driver2 - driver
        p0-1 p2-0 p2-1 s0 s1 s2 - location
        package1 package2 package3 package4 - obj
        truck1 truck2 - truck
    )

    (:init
        (at package4 s1)
        (at package2 s0)
        (at package1 s0)
        (at driver1 s1)
        (at truck2 s2)
        (at driver2 s0)
        (at package3 s1)
        (at truck1 s1)
        (empty truck1)
        (empty truck2)
        (path s2 p2-0)
        (path s2 p2-1)
        (path s0 p0-1)
        (path p0-1 s1)
        (path p2-0 s0)
        (path p2-1 s2)
        (path s1 p0-1)
        (path s0 p2-0)
        (path p2-1 s1)
        (path p2-0 s2)
        (path p0-1 s0)
        (path s1 p2-1)
        (link s1 s0)
        (link s0 s2)
        (link s1 s2)
        (link s2 s0)
        (link s0 s1)
        (link s2 s1)
    )

    (:goal
        (and (at package3 s2) (at truck2 s2) (at driver2 s2) (at truck1 s1) (at package2 s1) (at package1 s1))
    )

    
    
    
)

