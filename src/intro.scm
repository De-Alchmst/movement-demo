(module intro (show-intro)
  (import scheme (chicken base)
          consts raylib) 

  (define text-pos (make-vector2 10 10))
  (define font-size 30)
  (define font-spacing 0)

  (define intro-text
    "Jsi student ZCU, ale kvůli včerejší pařbě jsi zapoměl
že je neděle, tudíž jsi pařil ještě víc než obvykle.
Dnes jsi v důsledku tohoto omylu zaspal.
Rychle! Obleč se, najdi brýle, pouzdro na ně a batoh
a běž na zastávku, ať chytíš alespoň další tramvaj!")

  (define (show-intro)
    (draw
     (clear-background raywhite)
     (draw-text-ex fira-code intro-text text-pos font-size font-spacing black))

    (cond
      ((window-should-close?)
       #f)
      ((or (is-key-pressed? key-return)
           (is-key-pressed? key-space))
       #T)
      (else
       (show-intro)))))
      
