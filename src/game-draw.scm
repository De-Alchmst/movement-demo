(module game-draw (draw-game)
  (import scheme (chicken base)
          consts raylib)

  (define (draw-grid)
    (letrec ((width  (/ window-width  grid-columns))
             (height (/ window-height grid-rows))
             (color black)
             (draw-square (lambda (x y)
                            (cond
                              ((< x width)
                               (draw-rectangle-lines (* width x) (* height y)
                                                     width height color)
                               (draw-square (+ 1 x) y))
                              ((< y (- height 1))
                               (draw-square 0 (+ y 1)))))))
      (draw-square 0 0)))
          
    
    


  (define (draw-game)
    (clear-background white)
    (draw-grid)
    (draw-fps 10 10)))
  

