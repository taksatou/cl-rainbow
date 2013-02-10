#|
  This file is a part of cl-rainbow project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

#|
  Author: Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-rainbow-asd
  (:use :cl :asdf))
(in-package :cl-rainbow-asd)

(defsystem cl-rainbow
  :version "0.1"
  :author "Takayuki Sato"
  :license "LLGPL"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cl-rainbow"))))
  :description "Common Lisp port of rubygem's rainbow."
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op cl-rainbow-test))))
