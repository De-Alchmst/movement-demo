(module view-parse (get-view load-views
                    default-view view-texture
                    has-directional-view? get-directional-view
                    get-positional-view-selection
                    get-overlays)
  (import scheme (chicken base)
          matchable
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
  (define (has-directional-view? view dir)
    (not (null? (from-map view dir))))
  

  (define (get-directional-view view dir)
    (get-view (to-val (from-map view dir))))


  (define (to-val v) ; WARNING: may also catch C pointers, eg. textures
    (if (procedure? v) (v) v))


  ; test if mouse inside positional from list of positionals
  ; if so, return it's contents, else return #f
  (define (test-positional l mx my)
    (if (null? l)
      #f
      (match-let ([((lx ly) (lw lh) contents) (car l)])
        (if (and (>= mx lx) (<= mx (+ lx lw))
                 (>= my ly) (<= my (+ ly lh)))
          contents
          (test-positional (cdr l) mx my)))))


  (define (get-positional-view-selection view mx my)
    (let ((v (test-positional
               (to-val (from-map view 'positional-views)) mx my)))
      (if v
        (cons 'view v)
        (let ((e (test-positional
                   (to-val (from-map view 'positional-events)) mx my)))
          (if e
            (cons 'event e)
            '())))))


  (define (get-overlays view)
    (to-val (from-map view 'overlays))))
