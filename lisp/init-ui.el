;;; 视觉层配置

;; 设置主题
(add-to-list 'my/packages 'monokai-theme)
(load-theme 'monokai 1)
;; (require 'powerline)
(powerline-default-theme)
;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 更改字体大小14pt
(set-face-attribute 'default nil :height 140)
;; 当前行高亮
(global-hl-line-mode 1)

(provide 'init-ui)
