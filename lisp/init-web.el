;;; Commentary:
;;;web --- Summary

;;; code:
;; 用于在两个空格和四个空格之间进行切换
(setq-default js-indent-level 4)
(setq-default js2-basic-offset 4)
(setq-default css-indent-offset 4)
(setq-default typescript-indent-level 2)

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

;; web-mode配置
(use-package web-mode
  :mode ("\\.html\\'" . web-mode)
  :mode ("\\.vue\\'" . web-mode)
  :config
  (progn
    (setq web-mode-markup-indent-offset 2
	  web-mode-css-indent-offset 2
	  web-mode-code-indent-offset 2
	  web-mode-enable-auto-closing t
	  web-mode-enable-auto-pairing t
	  web-mode-enable-current-element-higlight t)))

(use-package css-mode
  :mode ("\\.css\\'" . css-mode))

(use-package scss-mode
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(use-package less-css-mode
  :mode ("\\.less\\'" . less-css-mode))

(use-package typescript-mode
  :mode (
	 ("\\.ts\\'" . typescript-mode)
	 ("\\.tsx\\'" . typescript-mode)
	 )
  )
(use-package rjsx-mode
  :mode (
	 ("\\.tsx\\'" . rjsx-mode)
	 )
  )

(use-package js2-mode
  :mode "\\.js$")

;; 下面这几个都开启tide
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
(provide 'init-web)
;;; init-web.el ends here
