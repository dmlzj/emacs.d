;;; Commentary:
;;;packages --- Summary
;;; code:
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
		      go-complete
		      company
		      company-php
		      company-go
		      tide
		      docker
		      ;; --- Themes ---
		      monokai-theme
		      ;; --- Better Editor ---
		      ;; hungry-delete ;; 不需要，用来处理TAB转空格的，本来就是要转为空格
		      ag
		      swiper
		      counsel
		      smartparens
		      neotree
		      window-numbering
		      quickrun
		      undo-tree
		      magit
		      super-save
		      projectile
		      ggtags
		      use-package
		      multi-term
		      reveal-in-osx-finder
		      
		      powerline
		      dashboard
		      page-break-lines
		      all-the-icons
		      ;; --- Lang Mode ---
		      
		      rjsx-mode
		      multi-web-mode
		      js2-mode
		      web-mode
		      go-mode
		      
		      vue-mode
		      tern
		      company-tern
		      mmm-mode
		      
		      nginx-mode
		      tss
		      emmet-mode
		      ;; --- Major Mode ---
		      flycheck
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      popwin
		      ;; 可以使我们更方便的选中一个区域
		      expand-region
		      ;; iedit 是一个可以同时编辑多个区域的插件
		      iedit
		      ;; 快速搜索
		      helm-ag
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

;; github 插件设置
;; (add-to-list 'load-path "~/.emacs.d/github/neotree")
;; (require 'neotree)
;; ac-php
(unless (package-installed-p 'ac-php)
  (package-refresh-contents)
  (package-install 'ac-php))

(provide 'init-packages)

;;; init-packages.el ends here
