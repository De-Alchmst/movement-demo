(module raylib * ; not all //needs// to be exported, but exporting structures
  (import scheme (chicken base) (chicken foreign) ; is pain...
          foreigners)

  ;; FFI mechanism preparation

  (foreign-declare "#include <raylib.h>")

  (define-syntax dfl
    (syntax-rules ()
      [(dfl name arg ...)
       (define name (foreign-lambda arg ...))]))


  (define-syntax dfl*
    (syntax-rules ()
      [(dfl* name arg ...)
       (define name (foreign-lambda* arg ...))]))


  ;; foreign datatypes

  (define-foreign-type color-p (c-pointer "Color"))
  (define-foreign-record-type (<color> "Color")
    (constructor:  construct-color)
    (destructor:   destroy-color)
    (unsigned-byte r color-r set-color-r!)
    (unsigned-byte g color-g set-color-g!)
    (unsigned-byte b color-b set-color-b!)
    (unsigned-byte a color-a set-color-a!))

  (define (make-color r g b a)
    (let ((color (construct-color)))
      (set-color-r! color r)
      (set-color-g! color g)
      (set-color-b! color b)
      (set-color-a! color a)
      color))


  (define-foreign-type vector2-p (c-pointer "Vector2"))
  (define-foreign-record-type (<vector2> "Vector2")
    (constructor: construct-vector2)
    (destructor:  destory-vector2)
    (float        x vector2-x set-vector2-x!)
    (float        y vector2-y set-vector2-y!))

  (define (make-vector2 x y)
    (let ((vect (construct-vector2)))
      (set-vector2-x! vect x)
      (set-vector2-y! vect y)
      vect))


  (define-foreign-type texture2d-p (c-pointer "Texture2D"))
  (define-foreign-record-type (<texture2d> "Texture2D")
    (constructor: construct-texture2d)
    (destructor:  destroy-texture2d)
    (unsigned-int id texture2d-id set-texture2d-id!)
    (int          width texture2d-width set-texture2d-width!)
    (int          height texture2d-height set-texture2d-height!)
    (int          mipmaps texture2d-mipmaps set-texture2d-mipmaps!)
    (int          format texture2d-format set-texture2d-format!))


  ;; foreign functions

  (dfl init-window          void "InitWindow" int int c-string)
  (dfl close-window         void "CloseWindow")
  (dfl begin-drawing        void "BeginDrawing")
  (dfl end-drawing          void "EndDrawing")
  (dfl set-target-fps       void "SetTargetFPS" int)
  (dfl draw-fps             void "DrawFPS" int int)
  (dfl window-should-close? bool "WindowShouldClose")

  (dfl* draw-rectangle void ((int x) (int y) (int w) (int h) (color-p ptr))
    "Color c = *ptr;"
    "DrawRectangle(x, y, w, h, c);")

  (dfl* draw-rectangle-lines void
    ((int x) (int y) (int w) (int h) (color-p ptr))
    "Color c = *ptr;"
    "DrawRectangleLines(x, y, w, h, c);")
    
  (dfl* clear-background void ((color-p ptr))
    "Color c = *ptr;"
    "ClearBackground(c);")

  (dfl* load-texture texture2d-p ((c-string str))
    "Texture2D* t = malloc(sizeof(Texture2D));"
    "printf(\"%s\\n\", str);"
    "LoadTexture(str);"
    "C_return(t);")


  ;; extra fancy macros to make your life easier

  (define-syntax draw
      (syntax-rules ()
        [(draw x ...)
         (begin
           (begin-drawing)
           x ...
           (end-drawing))])))
       

