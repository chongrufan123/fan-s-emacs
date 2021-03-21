;;; init-ui.el --- Summary
;;; Commentary:
;;; Code:

;; 添加主题
;;(use-package gruvbox-theme
;; :init (load-theme 'gruvbox-dark-soft t))
;; (color-theme-initialize)
;; (color-theme-monokai-theme)

(load-theme 'monokai-pro t)

;; 隐藏开始的介绍界面
(setq inhibit-startup-screen t)

;; 改变状态栏
 ;;(use-package smart-mode-line
;;  :init
;;  (setq sml/no-confirm-load-theme t
;;
;; sml/theme 'respectful)
;;  (sml/setup))



;; 添加行号
(global-linum-mode 1)
;;(linum-relative-global-mode t)
  
(set-frame-parameter nil 'alpha '(90 .75))
;; 添加透明
(global-set-key [(f8)] 'loop-alpha) 
  
(setq alpha-list '((90 75) (100 100)))  
  
(defun loop-alpha ()  
  (interactive)  
  (let ((h (car alpha-list)))                  
    ((lambda (a ab)  
       (set-frame-parameter (selected-frame) 'alpha (list a ab))  
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))  
       ) (car h) (car (cdr h)))  
    (setq alpha-list (cdr (append alpha-list (list h))))  
    )  
)  
;; 设置光标颜色
(set-cursor-color "green2")
;; 设置光标样式
(setq-default cursor-type 'box)

;; 图标
(use-package all-the-icons
 :ensure t)

;; 添加文件类型图标


(use-package all-the-icons-dired
  :ensure t
  :load-path "/home/fan/.emacs.d/site-lisp/all-the-icons-dired/"
  :hook
  ('dired-mode . 'all-the-icons-dired-mode))

;; dashboark依赖包
(use-package page-break-lines
  :ensure t
  :config
  (page-break-lines-mode t))


 ;; 启动默认界面
(use-package  dashboard
  :ensure t
  :config (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
				    (bookmarks . "book")))
  ;; 设置标题
  (setq dashboard-banner-logo-title "Tommorw is better!!")
  ;; 设置banner
  (setq dashboard-startup-banner "/home/fan/.emacs.d/var/banner/d.png")
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t))
(dashboard-setup-startup-hook)

(use-package doom-modeline
  :ensure t
  :defer t
  :init (doom-modeline-mode 3)
  :config
  (setq doom-modeline-height 5)
  (setq find-file-visit-truename t)
  (setq inhibit-compacting-font-caches t))
  (custom-set-faces
   '(mode-line ((t (:family "Microsoft Yahei Mono" :height 150))))
   '(mode-line-inactive ((t (:family "Microsoft Yahei Mono" :height 150)))))

(use-package posframe
  :ensure t)

;; 彩虹括号
(use-package rainbow-delimiters
  :ensure t
  :config
  (set-face-foreground 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "gold")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "ivory1")

  (set-face-bold 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-bold 'rainbow-delimiters-depth-2-face "gold")
  (set-face-bold 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-bold 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-bold 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-bold 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-bold 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-bold 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-bold 'rainbow-delimiters-depth-9-face "ivory1")
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
(rainbow-delimiters-mode-enable)






(provide 'init-ui)
;;; init-ui ends here
