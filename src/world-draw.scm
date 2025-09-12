(module world-draw (draw-world)
  (import scheme (chicken base)
          matchable
          consts view-parse world-logic raylib)

  (define (draw-world)
    (clear-background white)
    (draw-texture (view-texture current-view) 0 0 white)
    (draw-overlays)
    (draw-highlight))
    ; (draw-fps 10 10))


  (define (draw-overlays)
    (for-each (lambda (l)
                (match l [((x y) texture) (draw-texture texture x y white)]))
              (get-overlays current-view)))
           

  
  (define (draw-highlight)
    (if (pair? current-selection)
      (set-mouse-cursor cursor-hand)
      (set-mouse-cursor cursor-default))

    (cond
      ((equal? current-selection 'left)
       (draw-rectangle 0 0 side-margin window-height highlight-color))
      ((equal? current-selection 'right)
       (draw-rectangle (- window-width side-margin) 0
                       side-margin window-height highlight-color))
      ((equal? current-selection 'front)
       (draw-rectangle 0 0 window-width side-margin highlight-color))
      ((equal? current-selection 'back)
       (draw-rectangle 0 (- window-height side-margin)
                       window-width side-margin highlight-color)))))
  
