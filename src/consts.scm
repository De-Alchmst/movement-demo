(module consts *
  (import scheme (chicken base) (chicken process-context) (chicken pathname)
          raylib)

  (define exec-dir
    (pathname-directory (executable-pathname)))
  (define data-dir
    (make-pathname (pathname-directory exec-dir) "data"))

  (define window-width  600)
  (define window-height 600)
  (define grid-columns  15)
  (define grid-rows     15)

  (define white (make-color 255 255 255 255))
  (define black (make-color 0 0 0 255)))
