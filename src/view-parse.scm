(module view-parse (get-view load-views
                    default-view view-texture
                    has-dir-view? get-dir-view)
  (import scheme (chicken base)
          view-data)


  (define (load-views)
    (load-textures))


  (define (default-view)
    (cadar views-map))


  (define (from-map m key)
    (let ((i (assoc key m)))
      (if i (cadr i) '())))


  (define (get-view name)
    (from-map views-map name))


  (define (view-texture view)
    ((from-map view 'background)))


  ; left right front back
  (define (has-dir-view? view dir)
    (not (null? (from-map view dir))))
  

  (define (get-dir-view view dir)
    (get-view (from-map view dir))))
