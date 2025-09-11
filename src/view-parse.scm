(module view-parse (get-view load-views
                    default-view view-texture
                    get-left-view get-right-view)
  (import scheme (chicken base)
          view-data)


  (define (load-views)
    (load-textures))


  (define (default-view)
    (car view-maps))


  (define (get-view name)
    (get-maps-view view-maps name))


  (define (get-maps-view maps name)
    (cond
      ((null? maps) '())
      ((equal? (from-map (car maps) 'name) name) (car maps))
      (#t (get-maps-view (cdr maps) name))))


  (define (from-map m key)
    (cond
      ((null? m) '())
      ((atom? (car m)) (from-map (cdr m) key))
      ((equal? (caar m) key) (cadar m))
      (#t (from-map (cdr m) key))))


  (define (view-texture view)
    ((from-map view 'background)))


  (define (get-left-view view)
    (get-view (from-map view 'left)))


  (define (get-right-view view)
    (get-view (from-map view 'right))))
