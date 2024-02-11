(define (problem TEA_MAKING_R)
(:domain tea-making-r)
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

    (and (tea-made) (dummy)) 
    )
)
