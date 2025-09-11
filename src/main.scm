(module main ()
  (import scheme (chicken base)
          consts world-logic world-draw view-parse raylib)

  (define (init)
    (init-window window-width window-height "a thing")
    (load-views)
    (set-target-fps 60))


  (define (deinit)
    (close-window))


  (define (main)
    (update-world)
    (draw
      (draw-world))

    (if (not (window-should-close?))
      (main)))

  (init)
  (main)
  (deinit))
