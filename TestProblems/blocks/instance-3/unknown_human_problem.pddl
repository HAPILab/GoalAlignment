
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
        (clear a)
        (clear c)
        (clear d)
        (ontable b)
        (ontable a)
        (ontable d)
        (on c b)
        (handempty )
    )

    (:goal
        (and (on b c) (on a b) (on c d))
    )

    
    
    
)

