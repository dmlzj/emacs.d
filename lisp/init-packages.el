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
		      company-tabnine
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
		      google-translate
		      
		      powerline
		      dashboard
		      page-break-lines
		      all-the-icons
		      ;; --- Lang Mode ---
		      cmake-ide
		      rtags
		      rjsx-mode
		      multi-web-mode
		      js2-mode
		      web-mode
		      go-mode
		      meghanada
		      quelpa-use-package
		      
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

;; java码提示
(require 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (flycheck-mode +1)
            (setq c-basic-offset 2)
            ;; use code format
            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
(cond
 ((eq system-type 'windows-nt)
  (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
  (setq meghanada-maven-path "mvn.cmd"))
 (t
  (setq meghanada-java-path "java")
  (setq meghanada-maven-path "mvn")))
;; (require 'quelpa-use-package)

;; (use-package rainbow-fart
;;   :quelpa (rainbow-fart :fetcher "github" :repo "stardiviner/emacs-rainbow-fart")
;;   :hook (prog-mode . rainbow-fart-mode))
(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)
(provide 'init-packages)

;;; init-packages.el ends here
