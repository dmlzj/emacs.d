;; 快捷键绑定

;; 快速打开配置文件
(global-set-key (kbd "<f7>") 'open-init-file)

;; 搜索文件
(global-set-key "\C-s" 'swiper)

;; 文件搜索、文件内搜索快捷键
;; 当前目录搜索
(global-set-key (kbd "C-c s") 'ag-regexp)
;; 当前项目中搜索
(global-set-key (kbd "C-c h") 'ag-regexp-project-at-point)


(global-set-key (kbd "M-x") 'counsel-M-x)

;; 查找文件
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-h f") 'counsel-describe-function)

(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 显示打开的历史文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "C-x b") 'list-buffers)

;; 搜索文件
(global-set-key (kbd "C-c p f") 'counsel-git)

;; org mode 设置
(global-set-key (kbd "C-c a") 'org-agenda)

;; 展开侧边栏
(global-set-key [f6] 'neotree-toggle)
;; 自定义缩进
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 扩展选择区域
(global-set-key (kbd "C-=") 'er/expand-region)

;; 同时编辑多个区域
(global-set-key (kbd "M-s e") 'iedit-mode)

;; 快速搜索
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; 刷新buffer
(global-set-key [(control f5)] 'refresh-file)

;;运行当前文件quickrun
(global-set-key [(control f9)] 'quickrun)

;; 放大平分的窗口
(global-set-key [f4] 'maximize-window)
;; 缩小平分的窗口
(global-set-key [(control f4)] 'minimize-window)
;; 平分窗口一样大小
(global-set-key [(s f4)] 'balance-windows)

;;; buffer
;;shift-tab切换buffer
(global-set-key (kbd "<backtab>") #'(lambda ()
				      (interactive)
				      (switch-to-buffer (other-buffer (current-buffer) 1))))
;; Buffer 之间跳转的快捷键
(global-set-key (kbd "M-p") 'switch-to-prev-buffer)
(global-set-key (kbd "M-n") 'switch-to-next-buffer)

;;; magit配置
;; 快速切换分支
(global-set-key (kbd "C-c g c") 'magit-checkout)
;; 快速切换并创建分支
(global-set-key (kbd "C-c g n") 'magit-branch-and-checkout)
;; 快速commit
(global-set-key (kbd "C-c g a") 'magit-commit)
;; 快速push
(global-set-key (kbd "C-c g g") 'magit-push)
;; 快速pull
(global-set-key (kbd "C-c g p") 'magit-pull)
;; 快速merge
(global-set-key (kbd "C-c g e") 'magit-merge)
;; 快速查看log
(global-set-key (kbd "C-c g o") 'magit-log)
;; 快速查看所有的log-all
(global-set-key (kbd "C-c g O") 'magit-log-all)
;; 快速查看diff
(global-set-key (kbd "C-c g d") 'magit-diff)

;;;;;;;;编程语言设置;;;;;;;;;;;
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)

;; web-mode 切换缩进
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(provide 'init-keybindings)
