;; Org 模式相关全部设定
(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))
(setq org-startup-indented t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))

(setq org-log-done 'time)
(setq org-log-done 'note)

(provide 'init-org)
