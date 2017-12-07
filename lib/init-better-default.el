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


;;回车进入新目录不重新建立缓冲
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
(require 'dired-x)


;;用yn代替yes no
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-better-default)
