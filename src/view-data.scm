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
        (room-4 ,(load-texture (data/ "room-4.jpg")))
        (hall-1 ,(load-texture (data/ "hall-1.jpg")))
        (hall-2 ,(load-texture (data/ "hall-2.jpg")))
        (hall-3 ,(load-texture (data/ "hall-3.jpg")))
        (hall-4 ,(load-texture (data/ "hall-4.jpg")))
        (bathroom-1-1 ,(load-texture (data/ "bathroom-1-1.jpg")))
        (bathroom-1-2 ,(load-texture (data/ "bathroom-1-2.jpg")))
        (bathroom-1-3 ,(load-texture (data/ "bathroom-1-3.jpg")))
        (bathroom-1-4 ,(load-texture (data/ "bathroom-1-4.jpg")))
        (bathroom-2-1 ,(load-texture (data/ "bathroom-2-1.jpg")))
        (bathroom-2-2 ,(load-texture (data/ "bathroom-2-2.jpg")))
        (bathroom-2-3 ,(load-texture (data/ "bathroom-2-3.jpg")))
        (bathroom-2-4 ,(load-texture (data/ "bathroom-2-4.jpg")))
        (shower ,(load-texture (data/ "shower.jpg")))]))


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
       (front hall-1)
       (background ,(img room-3))]

      [(name  room-4)
       (left  room-3)
       (right room-1)
       (background ,(img room-4))]

      [(name  hall-1)
       (left  hall-4)
       (right hall-2)
       (background ,(img hall-1))]

      [(name  hall-2)
       (left  hall-1)
       (right hall-3)
       (background ,(img hall-2))]

      [(name  hall-3)
       (left  hall-2)
       (right hall-4)
       (front room-1)
       (background ,(img hall-3))]

      [(name  hall-4)
       (left  hall-3)
       (right hall-1)
       (front bathroom-1-1)
       (background ,(img hall-4))]

      [(name  bathroom-1-1)
       (left  bathroom-1-4)
       (right bathroom-1-2)
       (front bathroom-2-1)
       (background ,(img bathroom-1-1))]

      [(name  bathroom-1-2)
       (left  bathroom-1-1)
       (right bathroom-1-3)
       (background ,(img bathroom-1-2))]

      [(name  bathroom-1-3)
       (left  bathroom-1-2)
       (right bathroom-1-4)
       (front hall-2)
       (background ,(img bathroom-1-3))]

      [(name  bathroom-1-4)
       (left  bathroom-1-3)
       (right bathroom-1-1)
       (background ,(img bathroom-1-4))]

      [(name  bathroom-2-1)
       (left  bathroom-2-4)
       (right bathroom-2-2)
       (background ,(img bathroom-2-1))]

      [(name  bathroom-2-2)
       (left  bathroom-2-1)
       (right bathroom-2-3)
       (front shower)
       (background ,(img bathroom-2-2))]

      [(name  bathroom-2-3)
       (left  bathroom-2-2)
       (right bathroom-2-4)
       (front bathroom-1-3)
       (background ,(img bathroom-2-3))]

      [(name  bathroom-2-4)
       (left  bathroom-2-3)
       (right bathroom-2-1)
       (background ,(img bathroom-2-4))]

      [(name shower)
       (back bathroom-2-2)
       (background ,(img shower))])))
    
