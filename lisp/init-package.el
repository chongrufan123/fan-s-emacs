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
  :config
  (setq company-dabbrev-code-everywhere t
		        company-dabbrev-code-modes t
		        company-dabbrev-code-other-buffers 'all
		        company-dabbrev-downcase nil
		        company-dabbrev-ignore-case t
		        company-dabbrev-other-buffers 'all
		        company-require-match nil
		        company-minimum-prefix-length 1
		        company-show-numbers t
		        company-tooltip-limit 20
		        company-idle-delay 0
		        company-echo-delay 0
		        company-tooltip-offset-display 'scrollbar
		        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode))
  :bind (:map company-active-map
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("C-n" . 'company-select-next)
	      ("C-p" . 'company-select-previous)))

;; 智能检测补全
(use-package company-tabnine
  :disabled
  :ensure t
  :after 'company-mode 'company-tabnine-mode
  :config
  (add-to-list 'company-backends #'company-tabnine))

;;; lsp配置
;;  :commands lsp)

;; Emacs对语言服务器支持的插件
(use-package lsp-mode
  :ensure t
  :defer 2
  :init (setq lsp-keymap-prefix "s-g")
  :commands (lsp)
  :hook (((java-mode js-mode js2-mode web-mode scss-mode c-mode c++-mode objc-mode python-mode rust-mode) . lsp)
         (lsp-mode . (lambda ()
                       (lsp-enable-which-key-integration))))
  :custom
  (lsp-idle-delay 200)
  (lsp-auto-guess-root nil)
  (lsp-file-watch-threshold 2000)
  (read-process-output-max (* 1024 1240))
  (lsp-eldoc-hook nil)
  (lsp-auto-configure t)
  (lsp-log-io nil)
  (lsp-prefer-flymake nil)
  (lsp-diagnostics-provide :flycheck)
  (lsp-enable-indentation t)
  (lsp-enable-on-type-formatting nil)
  (lsp-response-timeout 3)  
  :bind (:map lsp-mode-map
			  ("C-c C-f" . lsp-format-buffer)
			  ("M-RET" . lsp-ui-sideline-apply-code-actions))
  :config
  (define-key lsp-command-map (kbd "s-g") lsp-command-map)
    (setq lsp-lens-enable t
        lsp-headerline-breadcrumb-enable nil
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-code-actions t
        lsp-modeline-code-actions-enable nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-modeline-diagnostics-enable nil
        lsp-signature-auto-activate nil
        lsp-prefer-capf t
        lsp-signature-render-documentation nil)

  (add-hook 'lsp-ui-imenu-mode-hook (lambda ()
                                      (display-line-numbers-mode -1))))

;; 美化lsp
(use-package 
  lsp-ui
  :ensure t
  :commands (lsp-ui)
  ;; :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq
   ;; sideline
   lsp-ui-sideline-update-mode 'line
   ;; sideline
   lsp-ui-sideline-delay 1
   ;; lsp-ui-imenu列表自动刷新
   lsp-ui-imenu-auto-refresh t
   ;; lsp-ui-imenu列表刷新延迟
   lsp-ui-imenu-auto-refresh-delay 5.0)
  ;; peek
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;; doc
  (setq lsp-ui-doc-enable t
        ;; 文档显示的位置
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable nil
        lsp-signature-render-documentation nil
        ;; 显示文档的延迟
        lsp-ui-doc-delay 2))

;; 补全文档
(use-package company-box
  :ensure t
  :hook ('prog-mode . 'lsp-mode))

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



(provide 'init-package)
;;; init-package ends here
