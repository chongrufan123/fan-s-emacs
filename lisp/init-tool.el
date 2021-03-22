;;; package --- Summer
;;; Commentary:

;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
;;应用程序
(use-package eaf
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :init
  (use-package epc :defer t :ensure t)
  (use-package ctable :defer t :ensure t)
  (use-package deferred :defer t :ensure t)
  (use-package s :defer t :ensure t)
  :custom
;;  (eaf-proxy-type "sock5")
;;  (eaf-proxy-host "127.0.0.1")
;;  (eaf-proxy-port "7891")
  (eaf-browser-continue-where-left-off t)
  :config
  (eaf-setq eaf-browser-enable-adblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)
  :bind
  (:map leader-key ("e f" . 'eaf-toggle-fullscreen))
  (:map leader-key ("a" . 'eaf-open)))

;; 自动补全括号
;;(use-package smartparens
;;  :ensure nil
;;  :hook ('prog-mode . 'smartparens-global-mode))

;; 英语帮助插件
(use-package company-english-helper
  :load-path "/home/fan/.emacs.d/site-lisp/company-english-helper/"
  :config
  (define-key leader-key (kbd "t e") 'toggle-company-english-helper))

(use-package telega
  :load-path  "~/.emacs.d/site-lisp/telega.el"
  :commands (telega)
  :defer t)

;; 终端
(use-package vterm
  :ensure t
  :bind
  (:map leader-key
	      ("t" . 'vterm)))
;; 有到词典
(use-package youdao-dictionary
  :defer 2
  :ensure t
  :config
  (setq url-automatic-caching t)
  (which-key-add-key-based-replacements "C-x y" "有到翻译")
  :bind
  (("C-x y t" . 'youdao-dictionary-search-at-point-tooltip)
   ("C-x y p" . 'youdao-dictionary-play-voice-at-point)
   ("C-x y r" . 'youdao-dictionary-search-and-replace)
   ("C-x y i" . 'youdao-dictionary-search-from-input)))

(use-package bongo
  :defer 2
  :config
  (defun bongo-init()
    (interactive)
    (let ((buffer (current-buffer)))
      (bongo)
      (setq bongo-insert-whole-directory-trees "ask")
      (bongo-insert-file "~/音乐/CloudMusic/")
      (bongo-insert-enqueue-region (point-min)
				   (point-max))
      (bongo-play-random)
      (switch-to-buffer buffer)))
  :bind (:map leader-key
              ("b RET" . 'bongo-dwim) 
              ("b i" . 'bongo-init) 
              ("b x" . 'bongo-kill-region) 
              ("b d" . 'bongo-kill-line) 
              ("b _" . 'bongo-undo) 
              ("b SPC" . 'bongo-pause/resume) 
              ("b TAB" . 'bongo-toggle-collapsed) 
              ("b h" . 'bongo-seek-backward-10) 
              ("b l" . 'bongo-seek-forward-10) 
              ("b a" . 'bongo-insert-enqueue) 
              ("b n" . 'bongo-play-next) 
              ("b p" . 'bongo-play-previous) 
              ("b r" . 'bongo-play-random) 
              ("b s" . 'bongo-sprinkle)))

(use-package pdf-tools
  :ensure t
  :hook
  ('doc-view-mode 'pdf-view-mode-hook))

;; 工作区
(use-package perspeen
  :ensure t
  :init
  (setq perspeen-use-tab t)
  (setq perspeen-keymap-prefix [C-tab])
  :config
  (perspeen-mode))
(perspeen-tab-start)
(perspeen-mode)


;; 取消树
;;(use-package undo-tree
;;  :ensure t
;;  :hook (after-init . global-undo-tree-mode)
;;  :init
;;  (setq undo-tree-visualizer-timestamps t
;;	undo-tree-enable-undo-in-region nil
;;	undo-tree-auto-save-history nil)
;;  (with-no-warnings
;;    (make-variable-buffer-local 'undo-tree-visualizer-diff)
;;    (setq-default undo-tree-visualizer-diff t)))
;;(undo-tree-mode)


;; 窗口管理器
(use-package windmove
  :defer 2
  :ensure t 
  :init (windmove-default-keybindings) 
  :config 
  :bind (:map leader-key
              ("w f" . #'windmove-right) 
              ("w b" . #'windmove-left) 
              ("w p" . #'windmove-up) 
              ("w n" . #'windmove-down) 
              ("w F" . #'window-move-right) 
              ("w B" . #'window-move-left) 
              ("w P" . #'window-move-up) 
              ("w N" . #'window-move-down)
              ("w h" . #'enlarge-window-horizontally)
              ("w l" . #'shrink-window-horizontally)
              ("w j" . #'enlarge-window)
              ("w k" . #'shrink-window)))


(provide 'init-tool)
;;; init-tool ends here
