;;; init-C.el --- Summery

;;; Commentary:

;;; Code:

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd-9"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)


(provide 'init-C)
;;; init-C.el ends here
