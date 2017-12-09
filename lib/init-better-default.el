; 开启全局 Company 补全
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

;;用空格代替tab
(setq-default indent-tabs-mode nil);

;;设置tab为四个空格
(setq default-tab-width 4)

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

;;在括号里面高亮括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;;设置缩进大小
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;;隐藏换行符
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;;启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
(require 'dired-x)


;;把emmetmode绑定到js3-mode 和 web-mode上面去
(require 'emmet-mode)
(add-hook 'js3-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'jsx-mode-hook 'emmet-mode)

;;用yn代替yes no
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-better-default)
