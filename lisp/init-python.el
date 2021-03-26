;;; init-python --- Summry
;;; Commentary:
;;; Code:

(add-to-list 'load-path  "~/.emacs.d/site-lisp/lsp-python-ms")
(require 'lsp-python-ms)
(require 'lsp-python-ms)

(use-package lsp-python-ms
  :defer t
  :demand
  ; :ensure nil
  ; :hook (python-mode . lsp)
  :config
  (setq lsp-python-ms-dir
        (expand-file-name "~/.local/lib/pls/output/bin/Release"))
  (setq lsp-python-ms-executable
        "~/.local/lib/pls/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))

(use-package pipenv
  ; :hook (python-mode . pipenv-mode)
  :hook (python-mode . (lambda () (pipenv-mode) (pipenv-activate) (lsp)))
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))
;(use-package lsp-python-ms
;  :ensure t
;  :init (setq lsp-python-ms-auto-install-server t)
;  :hook (python-mode . (lambda ()
;                          (require 'lsp-python-ms)
;                          (lsp))))  ; or lsp-deferred


(provide 'init-python)
;;; init-python ends here
