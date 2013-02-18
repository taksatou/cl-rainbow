#|
  This file is a part of cl-rainbow project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-rainbow
  (:use :cl)
  (:export *enabled* color colour background foreground
           reset bright italic underline blink inverse hide))

(in-package :cl-rainbow)

(defparameter *enabled* t)
(defparameter +term-colors+ '(:black 0
                              :red 1
                              :green 2
                              :yellow 3
                              :blue 4
                              :magenta 5
                              :cyan 6
                              :white 7
                              :default 9))
(defparameter +term-effects+ '(:reset 0
                               :bright 1
                               :italic 3
                               :underline 4
                               :blink 5
                               :inverse 7
                               :hide 8))

(defun wrap-with-code (code str)
  (if *enabled* (format nil "~c[~am~a~c[0m" (code-char #o33) code str (code-char #o33)) str))

(defun code-from-rgb (style red green blue)
  (let* ((ansi-domain (mapcar #'(lambda (x) (floor (* 6 (/ x 256.0)))) (list red green blue)))
         (index (+ 16
                   (* 36 (car ansi-domain))
                   (* 6 (cadr ansi-domain))
                   (caddr ansi-domain))))
    (format nil "~d;5;~d" (if (eql style :foreground) 38 48) index)))

(defmethod ansi-color-code (style (color symbol))
  (let ((col (getf +term-colors+ (intern (symbol-name color) 'keyword)))
        (ground (if (eql style :foreground) 30 40)))
    (if col (+ col ground) 0)))

;; (defmethod ansi-color-code (style (color string))
;;   (ansi-color-code style (intern (string-upcase color) 'keyword)))

(defmethod ansi-color-code (style (color integer))
  (code-from-rgb style
                 (floor (/ color #x010000))
                 (floor (mod color #x010000) #x0100)
                 (mod color #x000100)))

(defmethod ansi-color-code (style (color list))
  (code-from-rgb style
                 (car color)
                 (cadr color)
                 (caddr color)))

(defun background (color str)
  (wrap-with-code (ansi-color-code :background color) str))

(defun foreground (color str)
  (wrap-with-code (ansi-color-code :foreground color) str))

;; alias functions
(setf (symbol-function 'color) #'foreground)
(setf (symbol-function 'colour) #'foreground)

(defmacro define-term-effect-function (name)
  (let ((str (gensym)))
    `(defun ,name (,str) (wrap-with-code (getf +term-effects+ (intern (symbol-name ',name) 'keyword)) ,str))))

(define-term-effect-function reset)
(define-term-effect-function bright)
(define-term-effect-function italic)
(define-term-effect-function underline)
(define-term-effect-function blink)
(define-term-effect-function inverse)
(define-term-effect-function hide)
