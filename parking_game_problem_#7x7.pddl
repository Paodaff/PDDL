(define (problem board2)
    (:domain Parking-game)
    (:requirements :negative-preconditions)
    (:objects   red pink gray - car2
                yellow  blue green - car3 
                brown black - car4
p11 p12 p13 p14 p15 p16 p17  
p21 p22 p23 p24 p25 p26 p27
p31 p32 p33 p34 p35 p36 p37
p41 p42 p43 p44 p45 p46 p47
p51 p52 p53 p54 p55 p56 p57
p61 p62 p63 p64 p65 p66 p67
p71 p72 p73 p74 p75 p76 p77
 - position
    )
(:init 
(= (total-cost) 0)
(right-to p11 p12) (right-to p12 p13) (right-to p13 p14) (right-to p14 p15) (right-to p15 p16) (right-to p16 p17)
(right-to p21 p22) (right-to p22 p23) (right-to p23 p24) (right-to p24 p25) (right-to p25 p26) (right-to p36 p27)
(right-to p31 p32) (right-to p32 p33) (right-to p33 p34) (right-to p34 p35) (right-to p35 p36) (right-to p36 p37)
(right-to p41 p42) (right-to p42 p43) (right-to p43 p44) (right-to p44 p45) (right-to p45 p46) (right-to p46 p47)
(right-to p51 p52) (right-to p52 p53) (right-to p53 p54) (right-to p54 p55) (right-to p55 p56) (right-to p56 p57)
(right-to p61 p62) (right-to p62 p63) (right-to p63 p64) (right-to p64 p65) (right-to p65 p66) (right-to p66 p67)
(right-to p71 p72) (right-to p72 p73) (right-to p73 p74) (right-to p74 p75) (right-to p75 p76) (right-to p76 p77)

(down-to p11 p21) (down-to p12 p22) (down-to p13 p23) (down-to p14 p24) (down-to p15 p25) (down-to p16 p26) (down-to p17 p27)
(down-to p21 p31) (down-to p22 p32) (down-to p23 p33) (down-to p24 p34) (down-to p25 p35) (down-to p26 p36) (down-to p27 p37)
(down-to p31 p41) (down-to p32 p42) (down-to p33 p43) (down-to p34 p44) (down-to p35 p45) (down-to p36 p46) (down-to p37 p47)
(down-to p41 p51) (down-to p42 p52) (down-to p43 p53) (down-to p44 p54) (down-to p45 p55) (down-to p46 p56) (down-to p47 p57)
(down-to p51 p61) (down-to p52 p62) (down-to p53 p63) (down-to p54 p64) (down-to p55 p65) (down-to p56 p66) (down-to p57 p67)
(down-to p61 p71) (down-to p62 p72) (down-to p63 p73) (down-to p64 p74) (down-to p65 p75) (down-to p66 p76) (down-to p67 p77)


                                                            (empty p16)
(empty p21) (empty p22)                                     (empty p26)              
(empty p31) (empty p32) (empty p33)             (empty p35) (empty p36)
(empty p41) (empty p42) (empty p43)                                     
(empty p51) (empty p52) (empty p53) (empty p54) (empty p55) (empty p56) 
(empty p61) (empty p62) (empty p63) (empty p64) (empty p65) (empty p66) 
;(empty p71) (empty p72) (empty p73) (empty p74) (empty p75) (empty p76)
             

(car-pos red p15 p25)
(car-pos pink p57 p67)
(car-pos gray p13 p23)
(car-pos brown p74 p77)
(car-pos blue p71 p73)
(car-pos black p14 p44)
(car-pos yellow p17 p37)
(car-pos green p45 p47)

;(horizontal pink)
(horizontal green)
(horizontal blue)
(horizontal brown)

)
(:goal (car-pos red p64 p74))
(:metric minimize (total-cost)) 
)