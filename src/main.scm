(module main ()
  (import scheme (chicken base)
          consts game-draw map-parse raylib)

  (define (init)
    (init-window window-width window-height "a thing")
    (load-map)
    (set-target-fps 60))


  (define (deinit)
    (close-window))


  (define (main)
    (print (get-view 'room-1))
    (draw
      (draw-game))

    (if (not (window-should-close?))
      (main)))

  (init)
  (main)
  (deinit))
