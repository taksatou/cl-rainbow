#|
  This file is a part of cl-rainbow project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-rainbow-test
  (:use :cl
        :cl-rainbow
        :cl-test-more))
(in-package :cl-rainbow-test)

(plan 5)

(setf *enabled* t)
(is (color 'red "<original string>") "[31m<original string>[0m")
(is (color :red "<original string>") "[31m<original string>[0m")
(is (colour :red "<original string>") "[31m<original string>[0m")
(is (foreground :red "<original string>") "[31m<original string>[0m")
(is (color #x123456 "<original string>") "[38;5;24m<original string>[0m")

(finalize)
