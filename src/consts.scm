(module consts *
  (import scheme (chicken base) (chicken process-context)
          (chicken pathname) (chicken file)
          raylib)

  (define exec-dir
    (pathname-directory (executable-pathname)))
  (define data-dir
    (if (directory-exists? (make-pathname exec-dir "data"))
      (make-pathname exec-dir "data")
      (make-pathname (pathname-directory exec-dir) "data")))

  (define fira-code '())
  (define (load-consts)
    (set! fira-code
      (load-font-e (make-pathname data-dir "FiraCode-Regular.ttf") 30)))

  (define window-width  816)
  (define window-height 612)
  (define side-margin   60)


  (define white (make-color 255 255 255 255))
  (define raywhite (make-color 245 245 245 255))
  (define black (make-color 0 0 0 255))
  (define highlight-color (make-color 255 255 255 100))


  (define mouse-left   0)
  (define mouse-right  1)
  (define mouse-middle 2)


  (define key-return 257)
  (define key-space  32)


  (define cursor-default 0)
  (define cursor-hand    4))
