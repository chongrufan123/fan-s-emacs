;;; init-elpa --- Summary:
;;; Commentary:

;;; Code:
;; 更新软件源
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; 安装包管理器
(setq package-check-signature nil)

(require 'package)

(unless (bound-and-true-p package-initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;(eval-and-compile
;;  (defun ess-site-load-path ()
;;    (shell-command "find ~ /home/fan/.emacs.d/site-package")))

;; 自动配置use-package
(setq use-package-always-ensure t)
(setq use-package-always-demand nil)
(setq use-package-always-defer t)
(setq use-package-expand-minimally t)
(setq use-package-verbose t)
;; (setq user-emacs-directory "~/.emacs.d/site-lisp/")
;; (setq load-path t)
(require 'use-package)


(provide 'init-elpa)
;;; init-elpa ends here
