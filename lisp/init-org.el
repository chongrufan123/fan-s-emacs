;;; init-org.el --- Summary:

;;; Commentary:

;;; Code:

(use-package
  org
  :defer 2
  :ensure t
  :bind
  ("C-c c" . 'org-capture)
  ("C-c a" . 'org-agenda)
  ("M-H" . 'org-shiftmetaleft)
  ("M-L" . 'org-shiftmetaright)
  :custom
  (org-todo-keywords '((sequence "[TODO](t)" "|" "[done](d@/!)" n"[cancel](c@/!)")))
  :config
  (setq org-todo-keyword-faces '(("[学习]" . (:foreground "white" :background "#2ECC71" :weight bold))
								 ("[工作]" . (:foreground "white" :background "#F1C40F" :weight bold))
								 ("[生活]" . (:foreground "white" :background "#3498DB" :weight bold))
								 ("[想法]" . (:foreground "black" :background "snow " :weight bold))
								 ("[其他]" . (:foreground "white" :background "#566573" :weight bold)))))




;; org中可以运行代码
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (C . t)
   (emacs-lisp . t)
   (js . t)
   (ledger . t)
   (ditaa . t)))


;; 时间函数
(defun get-year-and-month ()
  (list (format-time-string "%Y年") (format-time-string "%m月")))

;; 默认不分割标题
(setq org-M-RET-may-split-line '((headline . nil)))

(defun find-month-tree ()
  (let* ((path (get-year-and-month))
         (level 1)
         end)
    (unless (derived-mode-p 'org-mode)
      (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
    (goto-char (point-min))             ;移动到 buffer 的开始位置
    ;; 先定位表示年份的 headline，再定位表示月份的 headline
    (dolist (heading path)
      (let ((re (format org-complex-heading-regexp-format
                        (regexp-quote heading)))
            (cnt 0))
        (if (re-search-forward re end t)
            (goto-char (point-at-bol))  ;如果找到了 headline 就移动到对应的位置
          (progn                        ;否则就新建一个 headline
            (or (bolp) (insert "\n"))
            (if (/= (point) (point-min)) (org-end-of-subtree t t))
            (insert (make-string level ?*) " " heading "\n"))))
      (setq level (1+ level))
      (setq end (save-excursion (org-end-of-subtree t t))))
    (org-end-of-subtree)))

;; 语法高亮
(setq org-src-fontify-natively t)

;; 不自动空行
(setq org-blank-before-new-entry
      '((heading . nil)
        (plain-list-item . nil)))

;; 设置agenda路径


;;(use-package org-capture
;;  :after org
;;  :config
    ;; org-capture
(setq org-capture-templates nil)
  ;; (push "~/Documents/org/capture/task.org" org-agenda-files)
  ;; (setq org-time-stamp-formats '("<%Y-%m-%d 周%u %H:%M>"))
(add-to-list 'org-capture-templates '("o" "记录"))
(add-to-list 'org-capture-templates '("e" "每日"))
(add-to-list 'org-capture-templates '("m" "理财"))
  ;; 命令捕获
  (push '("oc" "命令" plain (file "~/document/study/git/notes/system/command.org")  " | %U | %^{命令} | %^{描述} | %^{类别} |") org-capture-templates)
  ;; 想法捕获
  (push '("i" "想法" plain (file+headline "~/document/org/today-task/plan.org" "INBOX（收集箱）") "***** %U %?\n") org-capture-templates)
  ;; link模板
  (push '("ol" "链接" plain (file+headline "~/document/org/link.org" "Links") "***** %U [[%^{链接}][%^{名称}]]") org-capture-templates)
  ;; 密码
  (push '("op" "密码" plain (file "~/document/org/passwords.org.cpt") "* %U - %^{title} %^G\n\n  - 用户名: %^{用户名}\n  - 密码: %^{密码}" :kill-buffer t) org-capture-templates)
  ;; 笔记本
  (push '("on" "笔记" plain (file "~/document/org/notes.org") "***** %U %?\n") org-capture-templates)
  ;; 去做
(push '("ot" "TODO" plain (file+headline "~/document/org/today-task/plan.org" ",TODO") "***** [TODO] %?\n") org-capture-templates)
  (push '("od" "Countdown" plain (file+headline "~/document/org/today-task/plan.org" "Countdown") "***** [TODO] %?\n") org-capture-templates)

  ;; 跑步
(push '("er" "跑步" plain(file+function "~/document/org/running.org" find-month-tree)" | %u | %^{地点} | %^{里程} | %^{时间} | =$4/$3;T |" :kill-buffer t) org-capture-templates)

;;体重
(push '("ew" "体重" plain(file+function "~/document/org/weight.org" find-month-tree)" | %u | %^{体重} |" :kill-buffer t) org-capture-templates)

;; 好句
(push '("os" "好句" plain (file "~/document/org/good_sentence.org") "***** %u %^{句子} \t %^g") org-capture-templates)

;; 金额方面的capture
(push '("mp" "支出" plain(file "~/document/org/billing.ledger") "%<%Y-%m-%d> %^{类别} \n Expenses:%^{种类(Food, Entertainment, Education, Clothes, work} \t %^{金额} CNY\n Assets:Checking:%^G \n\n") org-capture-templates)
(push '("mi" "收入" plain(file "~/document/org/billing.ledger") "%<%Y-%m-%d> %^{类别} \n Income:%^{种类} \t %^{金额} CNY\n Assets:Checking%^G \n\n") org-capture-templates)
(push '("mz" "转账" plain(file "~/document/org/billing.ledger") "%<%Y-%m-%d>  转账 \n Assets:%^G%^G \n Assets:%^G%^G \t %^{金额} CNY \n\n") org-capture-templates)

;; 事情做完的capture
(push '("d" "has_done" plain(file+function "~/document/org/today-task/has_done.org" find-month-tree)" | %u | %^{事物} | %^{耗费时间（番茄数）} | %^{备注} | " :kill-buffer t) org-capture-templates)

;; org美化
(use-package org-superstar
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode))

(setq org-agenda-files (list "~/document/org/today-task/plan.org"
                             "~/document/org/today-task/task.org"
                             "~/document/org/today-task/金额.org"))

; (setq org-image-actual-width nil)

;; Latex相关的配置
(use-package auctex
  :ensure t)
(setq  TeX-engine 'xetex)

(provide 'init-org)
;;; init-org.el ends here
