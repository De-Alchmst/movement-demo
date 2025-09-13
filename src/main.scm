(module main ()
  (import scheme (chicken base)
          consts intro world-logic world-draw view-parse raylib)

  (define (init)
    (init-window window-width window-height "DEMÍČKO POHYBU")
    (set-exit-key 0)
    (load-views)
    (load-consts) ; Yes, I know how it sounds, but trust me...
    (set-target-fps 60))


  (define (deinit)
    (close-window))


  (define (main)
    (when (update-world)
      (draw
        (draw-world))

      (main)))

  (init)
  ; (if (show-intro) (main))
  (main)
  (deinit))
