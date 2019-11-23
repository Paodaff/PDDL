; Domain: Parking Game
; Author: Mira Gleizer

(define (domain Parking-game)
        (:requirements :strips :typing :adl   )

(:types 
        car2 car3 car4 car2x2 - car
        position  
       ; plat2x2 plat4x4 - plat
        )

(:predicates 
        (empty ?xy - position)
        (right-to ?x - position ?y - position )
        (down-to ?x - position ?y - position )
        (car-pos ?car - car  ?xy - position ?xy2 - position)
        (horizontal ?car - car) 
        ;(plat-posU ?obj - car2x2 ?xy1  ?xy2  - position)
        ;(plat-posD ?obj - car2x2 ?xy1  ?xy2  - position)
        ;(under-plat ?xy - position )
        )

;; moving car

(:action move_right
  :parameters (?start ?end ?start_next ?end_next - position ?car - car )
  :precondition (and 
        (horizontal ?car)
		(empty ?end_next) 
		(car-pos ?car ??start ?end) 
        (right-to ?end ?end_next) 
        (right-to ?start ?start_next) 
        )    	
  :effect (and  
		(empty ??start)
        (car-pos ?car ?start_next ?end_next) 
		(not (empty ?end_next))
		(not (car-pos ?car ??start ?end) )            
		)
)
(:action move_left
  :parameters (?start ?end ?start_next ?end_next - position ?car - car )
  :precondition (and 
		(empty ?start_next) 
        (horizontal ?car)
		(car-pos ?car ?start ?end) 
        (right-to ?end_next ?end) 
        (right-to ?start_next ?start ) 
    	)
  :effect (and  
		(empty ?end)
        (car-pos ?car ?start_next ?end_next) 
		(not (empty ?end_next))
		(not (car-pos ?car ?start ?end) )
        )
)

(:action move_down
  :parameters (?start ?end ?start_next ?end_next - position ?car - car )
  :precondition (and 
        (not (horizontal ?car))   
		(empty ?end_next) 
		(car-pos ?car ?start ?end) 
        (down-to ?end ?end_next) 
        (down-to ?start ?start_next) 
        )
    	
  :effect (and  
		(empty ?start)
        (car-pos ?car ?start_next ?end_next) 
		(not (empty ?end_next))
		(not (car-pos ?car ?start ?end) )             
		)
)
(:action move_up
  :parameters (?start ?end ?start_next ?end_next - position ?car - car )
  :precondition (and 
        (not (horizontal ?car))
		(empty ?end_next) 
		(car-pos ?car ?start ?end) 
        (down-to ?end_next ?end ) 
        (down-to  ?start_next ?start) 
        )    	
  :effect (and  
		(empty ?start)
        (car-pos ?car ?start_next ?end_next) 
		(not (empty ?end_next))
		(not (car-pos ?car ?start ?end) )             
		)
)

;========================
;====== speen car2 ======
;========================

(:action speen-rigth1-car2
    :parameters (?start ?end ?end_next ?rigth_to_end - position ?car - car2)
    :precondition (and 
                (not(horizontal ?car))
	       	    (empty ?end_next) 
                (empty ?rigth_to_end) 
		        (car-pos ?car  ?start  ?end) 
                (right-to ?start  ?end_next) 
                (right-to ?end  ?rigth_to_end) 
                )
     :effect (and  
		     (empty ?end)
             (not (empty ?end_next))
             (car-pos ?car ?start ?end_next)
             (not (car-pos ?car ?start ?end))  
             (horizontal ?car)
		    )
)
(:action speen-rigth2-car2
    :parameters (?start ?end ?start_next ?rigth_to_end - position ?car - car2)
    :precondition (and 
                (not(horizontal ?car))
	       	    (empty ?start_next) 
                (empty ?rigth_to_end) 
		        (car-pos ?car  ?start  ?end) 
                (right-to ?start ?start_next) 
                (right-to ?end  ?rigth_to_end) 
                )
     :effect (and  
		     (empty ?end)
             (not (empty ?start_next))
             (car-pos ?car ?start_next ?start )
             (not (car-pos ?car ?start ?end))  
             (horizontal ?car)
		    )
)
(:action speen-up1-car2  ;Even after turning, the starting point of the car is always the highest and most right
    :parameters (?start ?end ?up_to_start ?up_to_end - position ?car - car2)
    :precondition (and 
                (horizontal ?car)
	       	    (empty ?up_to_start) 
                (empty ?up_to_end) 
		        (car-pos ?car ?start ?end) 
                (down-to ?up_to_start ?start)  
                (down-to ?up_to_end  ?end) 
                )
     :effect (and  
		     (empty ?end)
             (not (empty ?up_to_start))
             (car-pos ?car ?up_to_start ?start)
		     (not (car-pos ?car ?start ?end))  
             (not(horizontal ?car))
		    )
)
(:action speen-up2-car2  ;Even after turning, the starting point of the car is always the highest and most right
    :parameters (?start ?end ?start_next ?up_to_end - position ?car - car2)
    :precondition (and 
                (horizontal ?car)
	       	    (empty ?start_next) 
                (empty ?up_to_end) 
		        (car-pos ?car ?start ?end) 
                (down-to ?start_next ?start)  
                (down-to ?up_to_end  ?end) 
                )
     :effect (and  
		     (empty ?end)
             (not (empty ?start_next))
             (car-pos ?car  ?start ?start_next)
		     (not (car-pos ?car ?start ?end))  
             (not(horizontal ?car))
		    )
)
(:action speen-down1-car2
  :parameters (?start ?end ?end_next ?down_to_end - position ?car - car2 )
  :precondition (and
        (horizontal ?car)
		(empty ?end_next) 
        (empty ?down_to_end)
		(car-pos ?car ?start ?end) 
        (down-to ?start ?end_next)
        (down-to ?end ?down_to_end) 
         )
    	
  :effect (and  
		(empty ?end)
        (car-pos ?car ?start ?end_next ) 
		(not (empty ?end_next))
		(not (car-pos ?car ?start ?end) )
        (not (horizontal ?car))      
		)
)
(:action speen-down2-car2
  :parameters (?start ?end ?start_next ?down_to_end - position ?car - car2 )
  :precondition (and
        (horizontal ?car)
		(empty ?start_next) 
        (empty ?down_to_end)
		(car-pos ?car ?start ?end) 
        (down-to ?start ?start_next)
        (down-to ?end ?down_to_end) 
         )
    	
  :effect (and  
		(empty ?end)
        (car-pos ?car ?start_next ?start ) 
		(not (empty ?start_next))
		(not (car-pos ?car ?start ?end) )
        (not (horizontal ?car))      
		)
)

(:action speen-left1-car2  ;Even after turning, the starting point of the car is always the highest and most right
    :parameters (?start ?end  ?left_to_start ?left_to_end - position ?car - car2)
    :precondition (and 
                 (not (horizontal ?car))
	       	     (empty ?left_to_start) 
                 (empty ?left_to_end) 
		         (car-pos ?car  ?start  ?end) 
                 (right-to ?left_to_start  ?start) 
                 (right-to ?left_to_end  ?end) 
                )
     :effect (and  
		     (empty ?end)
             (not (empty ?left_to_start))
             (car-pos ?car ?left_to_start ?start)
		     (not (car-pos ?car ?start ?end))  
             (horizontal ?car)
		    )
)
(:action speen-left2-car2  ;Even after turning, the starting point of the car is always the highest and most right
    :parameters (?start ?end ?start_next ?left_to_end - position ?car - car2)
    :precondition (and 
                 (not (horizontal ?car))
	       	     (empty ?start_next) 
                 (empty ?left_to_end) 
		         (car-pos ?car ?start ?end) 
                 (right-to ?start_next ?start) 
                 (right-to ?left_to_end ?end) 
                )
     :effect (and  
		     (empty ?end)
             (not (empty ?start_next))
             (car-pos ?car ?start ?start_next )
		     (not (car-pos ?car ?start ?end))  
             (horizontal ?car)
		    )
)

 ;functions of move to plat2x2
;  (:action speen-downl-car3
;  :parameters (?start ?middle ?end ?p1 ?p2 ?p3 ?p4 ?p5 ?p6 - position  ?car - car3 )
;   :precondition (and
;         (horizontal ?car)
; 		(empty ?p1) (empty ?p2) (empty ?p3) (empty ?p4) (empty ?p5) (empty ?p6) 
; 		(car-pos ?car ?start ?end) 
;         (right-to ?start ?middle)
;         (right-to ?middle ?end)
;         (down-to ?start ?p1)
;         (down-to ?middle ?p2)
;         (down-to ?end ?p3)
;         (down-to ?p1 ?p4)
;         (down-to ?p2 ?p5)  
;         (down-to ?p3 ?p6)
;         (right-to ?p2 ?p3) 
;          )
    	
;   :effect (and  
; 		(empty ?end)
;         (empty ?middle)
;         (not (empty ?p1))
;         (not (empty ?p4))
;         (car-pos ?car ?p4 ?start  ) 
; 		(not (car-pos ?car ?start ?end) )
;         (not (horizontal ?car))      
; 		)
; )

; (:action speen-rigth-car3
;  :parameters (?start ?middle ?end ?p1 ?p2 ?p3 ?p4 ?p5 ?p6 - position  ?car - car3 )
;   :precondition (and
;         (not(horizontal ?car))
; 		(empty ?p1) (empty ?p2) (empty ?p3) (empty ?p4) (empty ?p5) (empty ?p6)  
; 		(car-pos ?car ?start ?end) 
;         (down-to ?start ?middle)
;         (down-to ?middle ?end)
;         (right-to ?start ?p1)
;         (right-to ?middle ?p2)
;         (right-to ?end ?p3)
;         (right-to ?p1 ?p4)
;         (right-to ?p2 ?p5)
;         (right-to ?p3 ?p6)
;          )
    	
;   :effect (and  
; 		(empty ?end)
;         (empty ?middle)
;         (not (empty ?p1))
;         (not (empty ?p2))
;         (car-pos ?car ?start ?p4) 
; 		(not (car-pos ?car ?start ?end) )
;         (horizontal ?car)      
; 		)
; )
; (:action speen-up-car3
;  :parameters (?start ?middle ?end ?p1 ?p2 ?p3 ?p4 ?p5 ?p6 - position  ?car - car3 )
;   :precondition (and
;         (horizontal ?car)
; 		(empty ?p1) (empty ?p2) (empty ?p3) (empty ?p4) (empty ?p5) (empty ?p6) 
; 		(car-pos ?car ?start ?end) 
;         (right-to ?start ?middle)
;         (right-to ?middle ?end)
;         (down-to ?p1 ?start )
;         (down-to ?p2 ?middle )
;         (down-to ?p3 ?end )
;         (down-to ?p4 ?p1)
;         (down-to ?p5 ?p2 ) 
;         (down-to ?p6 ?p3 )
;         ;(right-to ?p3 ?p4) 
;          )
    	
;   :effect (and  
; 		(empty ?end)
;         (empty ?middle)
;         (not (empty ?p1))
;         (not (empty ?p3))
;         (car-pos ?car ?start ?p3 ) 
; 		(not (car-pos ?car ?start ?end) )
;         (not (horizontal ?car))      
; 		)
; )

; (:action speen-left-car3
; :parameters (?start ?middle ?end ?p1 ?p2 ?p3 ?p4 ?p5 ?p6 - position  ?car - car3 )
;   :precondition (and
;         (not(horizontal ?car))
; 		(empty ?p1) (empty ?p2) (empty ?p3) (empty ?p4) (empty ?p5) (empty ?p6)  
; 		(car-pos ?car ?start ?end) 
;         (down-to ?start ?middle)
;         (down-to ?middle ?end)
;         (right-to ?p1 ?start)
;         (right-to ?p2 ?middle)
;         (right-to ?p3 ?end)
;         (right-to ?p4 ?p1)
;         (right-to ?p5 ?p2)
;         (right-to ?p6 ?p3)
;          )
    	
;   :effect (and  
; 		(empty ?end)
;         (empty ?middle)
;         (not (empty ?p1))
;         (not (empty ?p2))
;         (car-pos ?car ?start ?p4) 
; 		(not (car-pos ?car ?start ?end) )
;         (horizontal ?car)      
; 		)
; )

)