
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance1)
    (:domain test_domain)

    (:objects
        f0 f1 f2 f3 f4 f5 - floor
        p0 p1 p2 - passenger
    )

    (:init
        (above f1 f4)
        (above f2 f4)
        (above f0 f2)
        (above f0 f5)
        (above f1 f2)
        (above f3 f5)
        (above f1 f5)
        (above f2 f5)
        (above f0 f1)
        (above f4 f5)
        (above f0 f3)
        (above f1 f3)
        (above f2 f3)
        (above f0 f4)
        (origin p1 f5)
        (origin p2 f4)
        (origin p0 f2)
        (destin p2 f1)
        (destin p0 f5)
        (destin p1 f2)
        (lift-at f0)
    )

    (:goal
        (and (served p1) (served p0) (served p2))
    )

    
    
    
)

