;;; Commentary:
;;;company --- Summary

;;; code:

;; 自动提示
(global-company-mode t)
(setq-default company-tooltip-limit 20)                      ; bigger popup window
(setq-default company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq-default company-echo-delay 0)                          ; remove annoying blinking
(setq-default company-begin-commands '(self-insert-command)) ; start autocompletion only after typin
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; html自动完成
(add-to-list 'load-path "~/.emacs.d/package/zencoding/")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;;Auto-start on any markup modes
(add-hook 'web-mode-hook 'zencoding-mode) ;;Auto-start on any markup modes
;; (add-hook 'web-mode-hook 'emmet-mode) ;;Auto-start on any markup modes
(add-hook 'rjsx-mode-hook 'zencoding-mode) ;;Auto-start on any markup modes

;; 代码片段
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))
(yas-global-mode 1)

;; 语法检测
(global-flycheck-mode)

;; ;; config js2-mode for js files
;; (setq auto-mode-alist
;;       (append
;;        '(("\\.js\\'" . js2-mode))
;;        '(("\\.html\\'" . web-mode))
;;        '(("\\.vue\\'" . web-mode))

;;        auto-mode-alist))
;; (add-hook 'js2-mode-hook 'hs-minor-mode)

;; (setq web-mode-content-types-alist
;;       '(("vue" . "\\.vue\\'")))

;; (defun my/web-vue-setup()
;;   (setq web-mode-style-padding 0
;;         web-mode-script-padding 0))

;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (cond ((equal web-mode-content-type "vue")
;;                    (my/web-vue-setup)))))

;;php
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
;; (add-hook 'web-mode-hook 'hs-minor-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags 
;;   '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;     (js-mode  "<script[^>]*>" "</script>")
;;     (css-mode "<style[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "vue"))
;; (multi-web-global-mode 1)


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
;; (require 'auto-complete-config)
;; (ac-config-default)

;; (setq ac-ignore-case t)
;; (setq ac-use-menu-map t)
;; (define-key ac-menu-map "\C-n" 'ac-next)
;; (define-key ac-menu-map "\C-p" 'ac-previous)


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
;; (add-to-list 'company-backends #'company-tabnine)

(provide 'init-lang)

;;; init-lang.el ends here
