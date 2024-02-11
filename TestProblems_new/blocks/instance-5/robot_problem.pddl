
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance1)
    (:domain test_domain)

    (:objects
        a b c d e - block
    )

    (:init
        (clear b)
        (clear e)
        (clear c)
        (ontable e)
        (ontable d)
        (ontable c)
        (on b a)
        (on a d)
        (handempty )
    )

    (:goal
        (and (on d c) (on b a) (on a e))
    )

    
    
    
)

