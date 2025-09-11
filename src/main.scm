(module main ()
  (import scheme (chicken base)
          consts game-draw raylib)

  (define (init)
    (init-window window-width window-height "a thing")
    (set-target-fps 60))


  (define (deinit)
    (close-window))


  (define (main)
    (draw
      (draw-game))

    (if (not (window-should-close?))
      (main)))

  (init)
  (main)
  (deinit))
