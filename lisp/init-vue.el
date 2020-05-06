(defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/eslint/bin/eslint.js"
                                          root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
(use-package vue-mode
      :config
      ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
        :mode ("\\.vue\\'" . vue-mode)

      (setq mmm-submode-decoration-level 0))
  (require 'vue-mode)
  (add-to-list 'company-backends 'company-tern)
  ;; (add-hook 'js-mode-hook #'tern-mode)
  (add-hook 'js-mode-hook
            '(lambda ()
               (company-mode 1)
               (tern-mode 1)
               (setq company-tooltip-align-annotations t)
               (add-to-list 'company-backends 'company-tern)))
  (add-to-list 'vue-mode-hook #'tern-mode smartparens-mode)
  (setq mmm-js-mode-exit-hook (lambda () (setq tern-mode nil)))
  (setq mmm-js-mode-enter-hook (lambda () (setq tern-mode t)))

(provide 'init-vue)
