(module view-parse (get-view load-views
                    default-view view-texture
                    has-dir-view? get-dir-view)
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


  ; left right front back
  (define (has-dir-view? view dir)
    (not (null? (from-map view dir))))
  

  (define (get-dir-view view dir)
    (get-view (from-map view dir))))
