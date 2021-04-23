;;; init-package ---- setting for package

;;; Commentary:
;;; Code:

;;; 测试启动耗时
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;;; 删除相关的包
(use-package crux
  :bind ("C-k" . crux-smart-kill-line))

(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward))
  :bind (("C-c C-d" . hungry-delete-forward)))

;;; 可以自由移动行或区块
(use-package drag-stuff
  :bind (("M-n" . drag-stuff-down))
  :bind (("M-p" . drag-stuff-up)))

;;; 强化搜索
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package htmlize
  :ensure t)

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

;;; 自动补全
(use-package company
  :defer 2
  :init
  (setq	 		company-tooltip-align-annotations t
                company-idle-delay 0
                company-echo-delay 0
                company-minimum-prefix-length 2
                company-require-match nil
		        company-show-numbers t)
  :config 
  :hook ((after-init . global-company-mode)))
	      

;; 智能检测补全
(use-package company-tabnine
  :disabled
  :ensure t
  :after 'company-mode 'company-tabnine-mode
  :config
  (add-to-list 'company-backends #'company-tabnine))

;; 美化company
(use-package company-box 
  :ensure t 
  :hook (company-mode . company-box-mode))

;; 代码片段
(use-package yasnippet 
  :ensure t
  :defer 2
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/etc/snippets")))


;;; lsp配置
;;  :commands lsp)

;; Emacs对语言服务器支持的插件

;; 补全文档
;(use-package company-box
;  :ensure t
;  :hook ('prog-mode . 'lsp-mode))

;;; 语法检查
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

;;; crux优化插件
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
	 ("C-x ," . crux-find-user-init-file)
	 ("C-c C-y" . crux-duplicate-current-line-or-region)))

;;; 记忆快捷键
(use-package which-key
   :defer nil
  :config (which-key-mode))

;;; 快速跳转
(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; latex相关

;(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq outline-minor-mode-prefix "^C@")

(provide 'init-package)
;;; init-package ends here
