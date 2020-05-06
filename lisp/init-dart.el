(unless (package-installed-p 'dart-mode)
  (package-refresh-contents)
  (package-install 'dart-mode))
(setq dart-format-on-save t)

(unless (package-installed-p 'flutter)
  (package-refresh-contents)
  (package-install 'flutter))

(unless (package-installed-p 'flutter-l10n-flycheck)
  (package-refresh-contents)
  (package-install 'flutter-l10n-flycheck))

;; Assuming usage with dart-mode
(use-package dart-mode
  ;; :ensure-system-package (dart_language_server . "pub global activate dart_language_server")
  :custom
  (dart-format-on-save t)
  (dart-sdk-path "~/www/flutter/source/bin/cache/dart-sdk/"))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :custom
  (flutter-sdk-path "~/www/flutter/source/"))

;; Optional
(use-package flutter-l10n-flycheck
  :after flutter
  :config
  (flutter-l10n-flycheck-setup))
(provide 'init-dart)

;;; init-dart.el ends here
