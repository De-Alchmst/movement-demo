(module view-data (view-maps parameters load-textures)
  (import scheme (chicken base)
          consts raylib)

  (define (data/ str)
    (string-append data-dir "/" str))


  ; load-texture must run after init-window
  (define textures '())
  (define (load-textures)
    (set! textures
      `[(room-1 ,(load-texture (data/ "room-1.jpg")))
        (room-2 ,(load-texture (data/ "room-2.jpg")))
        (room-3 ,(load-texture (data/ "room-3.jpg")))
        (room-4 ,(load-texture (data/ "room-4.jpg")))]))


  ; could use from-map, but I want it defined in map-parse.scm...
  (define (get-texture textures name)
    (cond
      ((null? textures) '())
      ((equal? (caar textures) name) (cadar textures))
      (#t (get-texture (cdr textures) name))))


  (define-syntax img
    (syntax-rules ()
      [(img name)
       (lambda () (get-texture textures (quote name)))]))


  (define parameters
    '())


  (define view-maps
    `([(name  room-1)
       (left  room-4)
       (right room-2)
       (background ,(img room-1))]

      [(name  room-2)
       (left  room-1)
       (right room-3)
       (background ,(img room-2))]

      [(name  room-3)
       (left  room-2)
       (right room-4)
       (background ,(img room-3))]

      [(name  room-4)
       (left  room-3)
       (right room-1)
       (background ,(img room-4))])))
