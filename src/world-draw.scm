(module world-draw (draw-world)
  (import scheme (chicken base)
          consts view-parse world-logic raylib)

  (define (draw-world)
    (clear-background white)
    (draw-texture (view-texture current-view) 0 0 white)
    (draw-fps 10 10)))
  

