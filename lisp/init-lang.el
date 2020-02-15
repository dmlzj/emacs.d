;;; Commentary:
;;;company --- Summary

;;; code:
(global-company-mode t)
(setq-default company-tooltip-limit 20)                      ; bigger popup window
(setq-default company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq-default company-echo-delay 0)                          ; remove annoying blinking
(setq-default company-begin-commands '(self-insert-command)) ; start autocompletion only after typin

(dolist (hook (list
               'js2-mode-hook
               'rjsx-mode-hook
               'typescript-mode-hook
               ))
  (add-hook hook (lambda ()
                   ;; 初始化 tide
                   (tide-setup)
                   ;; 当 tsserver 服务没有启动时自动重新启动
                   (unless (tide-current-server)
                     (tide-restart-server))
                   )))
;; html自动完成
(add-to-list 'load-path "~/.emacs.d/package/zencoding/")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;;Auto-start on any markup modes

;; 语法检测
(global-flycheck-mode)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))
(add-hook 'js2-mode-hook 'hs-minor-mode)

;; php
(require 'php-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

;;; web-mode
(add-hook 'web-mode-hook 'hs-minor-mode)
;; 用于在两个空格和四个空格之间进行切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

;; golang

(require 'go-mode)
(autoload 'go-mode "go-mode" nil t)

;;(add-hook 'go-mode-hook 'company-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'hs-minor-mode)
(add-hook 'go-mode-hook (
			 lambda ()
			 (set (make-local-variable 'company-backends) '(company-go))
			 (company-mode)
			 )
	  )
;; autocomplete-mode
;; 设置为t表示忽略大小写，设置为nil表示区分大小写
;; 默认情况下为smart，表示如果输入的字符串不含有大写字符才会忽略大小写
(require 'auto-complete-config)
(ac-config-default)

(setq ac-ignore-case t)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


;; (add-hook 'go-mode-hook
;;           '(lambda ()
;;              ;; Enable auto-complete-mode
;; 	     (require 'go-mode)
;; 	     (autoload 'go-mode "go-mode" nil t)
;; 	     (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
;; 	     (auto-complete-mode t)
;; 	     (require 'go-autocomplete)
;; 	     (require 'auto-complete-config)
;; 	     (ac-config-default)

;; 	     ;; 设置为t表示忽略大小写，设置为nil表示区分大小写
;; 	     ;; 默认情况下为smart，表示如果输入的字符串不含有大写字符才会忽略大小写
;; 	     (setq ac-ignore-case t)
;; 	     (setq ac-use-menu-map t)
;; 	     (define-key ac-menu-map "\C-n" 'ac-next)
;; 	     (define-key ac-menu-map "\C-p" 'ac-previous)

;; 	     ))


(provide 'init-lang)

;;; init-lang.el ends here

