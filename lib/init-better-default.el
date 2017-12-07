;; 开启全局 Company 补全
(global-company-mode 1)

;; 关闭默认备份
(setq make-backup-files nil)

;;使emcas支持选中替换的模式
(delete-selection-mode 1)
;;自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;饥饿删除(删除多余空格字符)
(require 'hungry-delete)
(global-hungry-delete-mode)

(provide 'init-better-default)
