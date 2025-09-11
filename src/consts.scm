(module consts *
  (import scheme (chicken base) (chicken process-context) (chicken pathname)
          raylib)

  (define exec-dir
    (pathname-directory (executable-pathname)))
  (define data-dir
    (make-pathname (pathname-directory exec-dir) "data"))


  (define window-width  816)
  (define window-height 612)
  (define side-margin   60)


  (define mouse-left   0)
  (define mouse-right  1)
  (define mouse-middle 2)


  (define white (make-color 255 255 255 255))
  (define black (make-color 0 0 0 255))
  (define highlight-color (make-color 255 255 255 100)))
