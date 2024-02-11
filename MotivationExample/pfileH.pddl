(define (problem TEA_MAKING_H)
(:domain tea-making-h)
(:objects
    goodquality normalquality - tealeavesquality 
    )
(:init
    
    (in-kitchen)
    (on-upper-shelf goodquality)
    (on-lower-shelf normalquality)
    (dummy)
    
    )
(:goal

    (and 
    (tea-made-with goodquality) (tea-made) (dummy))
    )
)
