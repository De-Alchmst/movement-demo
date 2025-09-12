(module world-logic (update-world current-view current-selection)
  (import scheme (chicken base)
          consts view-parse raylib)

  (define current-view (default-view))
  (define current-selection '())


  (define (update-world)
    (handle-select)
    (handle-click)
    (not (window-should-close?)))

  
  (define (handle-select)
    (let ((mx (get-mouse-x))
          (my (get-mouse-y)))
      (set! current-selection
        (cond
          ((and (< mx side-margin)
                (has-dir-view? current-view 'left))
           'left)

          ((and (> mx (- window-width side-margin))
                (has-dir-view? current-view 'right))
           'right)

          ((and (< my side-margin)
                (has-dir-view? current-view 'front))
           'front)

          ((and (> my (- window-height side-margin))
                (has-dir-view? current-view 'back))
           'back)

          (else
           '())))))


  (define (handle-click)
    (if (is-mouse-button-pressed? mouse-left)
      (cond
        ((symbol? current-selection)
         (set! current-view (get-dir-view current-view current-selection)))))))
