
;;; package --- Summer
;;; Commentary:

;;; Code:

(defalias 'yes-or-no-p 'y-or-n-p)

(define-prefix-command 'leader-key)

(which-key-add-key-based-replacements
  "M-SPC b" "音乐"
  "M-SPC e" "窗口配置"
  "M-SPC o" "每日任务"
  "M-SPC o p" "plan"
  "M-SPC o t" "task"
  "M-SPC o c" "command"
  "M-SPC o l" "link"
  "M-SPC z" "注释"
;;  "M-SPC o" "开启"
;;  "M-SPC t" "切换"
 "M-SPC w" "窗口")
;;  "M-SPC c" "代码"
;;  "M-SPC w P" "交换窗口-上"
;;  "M-SPC w N" "交换窗口-下"
;;  "M-SPC w F" "交换窗口-右"
;;  "M-SPC w B" "交换窗口-左")
;; (bind-key "t T" #'+even/toggle-transparency leader-key)
(global-set-key (kbd "M-SPC") 'leader-key)
(global-set-key (kbd "C-(") 'backward-sexp)
(global-set-key (kbd "C-)") 'forward-sexp)
(global-set-key (kbd "M-SPC z") 'comment-line)
;; 按键映射

(provide 'init-kbd)

;;; init-kbd ends here
