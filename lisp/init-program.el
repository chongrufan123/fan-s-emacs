;;; init-prgrame --- Summer
;;; Commentary:

;;; Code:

;; 自动转变函数名
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/insert-translated-name/"))
(require 'insert-translated-name)
(use-package insert-translated-name
  :load-path "/home/fan/.emacs.d/site-lisp/insert-translated-name"
  :bind (:map leader-key
	      ("c n i" . #'insert-translated-name-insert)
	      ("c n r" . #'insert-translated-name-replace))
  :config
  (which-key-add-prefix-title
    "M-SPC c n" "插入翻译名字"))



(provide 'init-programe)
;;; init-program.el ends here
