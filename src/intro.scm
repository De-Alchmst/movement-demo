(module intro (show-intro)
  (import scheme (chicken base)
          consts raylib) 

  (define text-pos (make-vector2 10 10))
  (define font-size 30)
  (define font-spacing 0)

  (define (show-intro)
    (draw
      (clear-background raywhite)
      (draw-text-ex fira-code
                    "Ahoj, Světe!"
                    text-pos font-size font-spacing
                    black))

    (cond
      ((window-should-close?)
       #f)
      ((or (is-key-pressed? key-return)
           (is-key-pressed? key-space))
       #T)
      (else
       (show-intro)))))
      
