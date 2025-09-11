(module map-data (view-maps parameters)
  (import scheme (chicken base)
          consts raylib)

  (define (data/ str)
    (string-append data-dir "/" str))


  (define parameters
    '())


  (define view-maps
    `([(name  room-1)
       (left  room-4)
       (right room-2)
       (background ,(load-texture (data/ "room-1.jpg")))]

      [(name  room-2)
       (left  room-1)
       (right room-3)
       (background ,(load-texture (data/ "room-2.jpg")))]

      [(name  room-3)
       (left  room-2)
       (right room-4)
       (background ,(load-texture (data/ "room-3.jpg")))]

      [(name  room-4)
       (left  room-3)
       (right room-1)
       (background ,(load-texture (data/ "room-4.jpg")))])))
    
      
      
                       
