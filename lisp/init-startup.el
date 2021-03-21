;;; init-startup --- Summary:
;;; Commentary:

;;; Code:
;; 设置系统编码,防止乱码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; 设置垃圾回收阈值
(setq gc-cons-threshold most-positive-fixnum)

;; 隐藏工具栏
(tool-bar-mode -1)

;; 隐藏滚动条
(scroll-bar-mode -1)

;; 隐藏菜单栏
(menu-bar-mode -1)




;; 设置字体
;;; (set-default-font "-GOOG-Noto Mono-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1")

;; 设置开启后的窗口位置
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 取消自动生成备份文件
(setq make-backup-files nil)

;; 选中一部分文字时, 再次输入会替换掉
(delete-selection-mode 1)

;; 设置可以找到函数,变量和快捷键
(global-set-key (kbd "\C-h\ \C-f") 'find-function)
(global-set-key (kbd "\C-h\ \C-v") 'find-variable)
(global-set-key (kbd "\C-h \C-k") 'find-function-on-key)

;; 在org里面也享受语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 加入最近打开的文件
(require 'recentf)
(setq recentf-max-menu-items 25)


;; 设置最近打开文件缓存路径
(setq recentf-save-file "~/.emacs.d/var/recentf/recentf")
;; 设置eshell的历史记录
(setq eshell-history-file-name "~/.emacs.d/var/eshell/history")

;; 括号匹配高亮
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(show-paren-mode 1)

;; 设置tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 高亮显示当前行
 (global-hl-line-mode t)
;; (global-hl-line-mode -1)


;; 快速打开emacs笔记
(global-set-key (kbd "C-x /") (lambda() (interactive)(find-file "~/document/study/git/notes/other/emacs.org")))
(global-set-key (kbd "M-SPC o t") (lambda() (interactive)(find-file "~/document/org/today-task/task.org")))
(global-set-key (kbd "M-SPC o p") (lambda() (interactive)(find-file "~/document/org/today-task/plan.org")))
;; 设置bookmark
(use-package bookmark
  :ensure nil
  :bind (("C-x r m" . bookmark-set)
     ("C-x r d" . bookmark-delete)
     ("C-x r j" . bookmark-jump)))


(provide 'init-startup)
;;; init-startup ends here
