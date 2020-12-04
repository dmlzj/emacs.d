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

;; 设置字体source code pro
;(set-frame-font "SourceCodePro")
;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font 
(set-face-attribute
 'default nil :font "Source Code Pro 16")
;; Chinese Font 配制中文字体
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset
;;                     (font-spec :family "PingFang SC" :size 16)))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset
;;                     (font-spec :family "Source Code Pro" :size 16)))

;; Note: you can chang "PingFang SC" to "Microsoft YaHei" or other fonts

;; 设置neotree icon
(setq inhibit-compacting-font-caches t)
(setq neo-theme 'icons)

;; 更改字体大小14pt
;; (set-face-attribute 'default nil :height 140)

;; 当前行高亮
(global-hl-line-mode 1)

;; 设置行高
(setq-default line-spacing 0.2)

(provide 'init-ui)
