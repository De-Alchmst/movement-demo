(module world-logic (update-world current-view current-selection)
  (import scheme (chicken base)
          consts view-parse raylib)

  (define current-view (default-view))
  (define current-selection '())


  (define (update-world)
    (handle-select)
    (handle-click))

  
  (define (handle-select)
    (let ((mx (get-mouse-x)))
      (set! current-selection
        (cond
          ((< mx side-margin)
           'left)
          ((> mx (- window-width side-margin))
           'right)
          (#T
           '())))))


  (define (handle-click)
    (if (is-mouse-button-pressed? mouse-left)
      (cond
        ((equal? current-selection 'left)
         (set! current-view (get-left-view current-view)))
        ((equal? current-selection 'right)
         (set! current-view (get-right-view current-view)))))))
