
;; 添加melpa作为插件源
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		reveal-in-osx-finder
		hungry-delete
                magit
                jdee
		iedit
		swiper
		expand-region
		counsel
		smartparens
                window-numbering
                session
                projectile
		;; --- Major Mode ---
		js2-mode
		web-mode
		;; --- Minor Mode ---
		nodejs-repl
		js2-refactor
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile window-numbering session magit jsx-mode jdee emmet-mode auto-complete iedit expand-region js2-refactor web-mode reveal-in-osx-finder js3-mode swiper-helm company hungry-delete swiper counsel smartparens js2-mode nodejs-repl exec-path-from-shell monokai-theme)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . jsx-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.ejs\\'" . web-mode))
       auto-mode-alist))

;; 解决mac找不到nodejs可执行文件的问题

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;显示最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)



;;分包
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lib/")
(require 'init-ui)
(require 'init-better-default)
(require 'init-keybind)
(require 'init-auto-save)
(auto-save-enable)
(setq auto-save-slient t)
(put 'dired-find-alternate-file 'disabled nil)
