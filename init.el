;;; init.el --- some init configs

;;; Commentary:
;;; Code:
(add-to-list 'load-path
	     "/home/fan/.emacs.d/lisp")
(add-to-list 'load-path
	     "/home/fan/.emacs.d/site-lisp/")
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/theme/")
(add-to-list 'load-path
             "~/.emacs.d/elpa/")
;;(defun add-subdirs-to-load-path(dir)
 ;;   (let ((default-directory (file-name-as-directory dir)))
;;  (add-to-list 'load-path dir)
  ;;  (normal-top-level-add-subdirs-to-load-path)))
;; (add-subdirs-to-load-path "~/.emacs.d/site-lisp/")
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-const)
(require 'init-elpa)
(require 'init-kbd)
(require 'init-startup)
(require 'init-package)
(require 'init-ui)
(require 'init-tool)
(require 'init-org)
(require 'init-vision)

;;; init.el ends here


