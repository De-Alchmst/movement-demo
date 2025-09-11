(module map-parse (get-view)
  (import scheme (chicken base)
          map-data)


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
      (#t (from-map (cdr m) key)))))
