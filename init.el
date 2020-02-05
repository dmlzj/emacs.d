;; 插件设置
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)

;; 显示设置
(require 'init-ui)

;; 增强设置
(require 'init-better-defaults)

;; 编程语言设置

(require 'init-lang)

;; org 设置
(require 'init-org)

;; 快捷键绑定
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
