;; 开启全局 Company 补全
(global-company-mode 1)

;; 关闭默认备份
(setq make-backup-files nil)

;;自动加载外部修改过的文件
(global-auto-revert-mode 1)

;;关闭自动保存
(setq auto-save-default nil)

;;将光标自动定位到新窗口
(require 'popwin)
(popwin-mode 1)

;;使emcas支持选中替换的模式
(delete-selection-mode 1)
;;自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;饥饿删除(删除多余空格字符)
(require 'hungry-delete)
(global-hungry-delete-mode)

;;用yn代替yes no
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-better-default)
