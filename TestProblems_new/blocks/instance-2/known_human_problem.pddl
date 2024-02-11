
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance1)
    (:domain test_domain)

    (:objects
        a b c d - block
    )

    (:init
        (clear b)
        (ontable d)
        (on a d)
        (on b c)
        (on c a)
        (handempty )
    )

    (:goal
        (and (on a b) (on c a))
    )

    
    
    
)
