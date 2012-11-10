#|
  This file is a part of cl-rainbow project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-rainbow-test-asd
  (:use :cl :asdf))
(in-package :cl-rainbow-test-asd)

(defsystem cl-rainbow-test
  :author "Takayuki Sato"
  :license "LLGPL"
  :depends-on (:cl-rainbow
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "cl-rainbow"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
