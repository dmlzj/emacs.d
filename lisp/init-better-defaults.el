;;; Commentary:
;;packages --- Summary
;; 增强内置功能
;;; code:

;; 启动页设置
(dashboard-setup-startup-hook)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-footer "Hello dmlzj, good luck for you today!")
  ;; (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
						     ;; :height 1.1
						     ;; :v-adjust -0.05
						     ;; :face 'font-lock-keyword-face))
  )
;; neotree 根据当前文件显示目录
(setq-default neo-smart-open t)
;; 使用ggtags-mode
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'go-mode 'php-mode 'js2-mode)
              (ggtags-mode 1))))

;; 默认全局使用
(projectile-mode +1)

;; 默认打开缓存
(setq-default projectile-enable-caching t)
;; 使用f5键打开默认文件搜索
(global-set-key [f5] 'projectile-find-file)
(define-key projectile-mode-map(kbd "C-c p p") 'projectile-switch-project)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 离开buffer自动保存
(super-save-mode +1)

;; set open multi shell打开eshll
(defun wcy-shell-mode-auto-rename-buffer (text)
  (if (eq major-mode 'shell-mode)
      (rename-buffer  (concat "shell:" default-directory) t)))
(add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)

;;刷新buffer(C-F5)
(defun refresh-file ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t))

;; undo-tree 撤销、反撤销
(global-undo-tree-mode)
(defadvice undo-tree-visualizer-mode (after undo-tree-face activate)
  (buffer-face-mode))

;; hide/show
;; Hide the comments too when you do a 'hs-hide-all'
(setq-default hs-hide-comments nil)
;; Set whether isearch opens folded comments, code, or both
;; where x is code, comments, t (both), or nil (neither)
(setq-default hs-isearch-open 'x)
;; Add more here
(setq-default hs-set-up-overlay 'display-code-line-counts)
;; 同级别代码折叠

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
	 (1+ (current-column))))))
;; 切换折叠和展开
(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
	      (hs-toggle-hiding)
	    (error t))
	  (hs-show-all))
    (toggle-selective-display column)))
(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (overlay-put ov 'help-echo
		 (buffer-substring (overlay-start ov)
				   (overlay-end ov)))))

;; 窗口管理
(window-numbering-mode 1)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;;set transparent effect 设置透明效果
(global-set-key [(f12)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

;; 优化注释功能
(defun qiang-comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;; 在行末或行中位置删除整行
(defadvice kill-ring-save (before slickcopy activate compile)  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
           (line-beginning-position 2)))))  
(defadvice kill-region (before slickcut activate compile)  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
           (line-beginning-position 2)))))

;; 选中文本覆盖
(delete-selection-mode 1)

;; 禁止生成临时文件
(setq make-backup-files nil)

;; 弹窗插件
(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode 1)

;; 自动完成括号
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; lisp模式禁止'自动补全
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)



;; 打开最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(fset 'yes-or-no-p 'y-or-n-p)

;; 自定义缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

(provide 'init-better-defaults)

;;; init-better-defaults.el ends here
