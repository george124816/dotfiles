(setq-default tab-width 4)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-log-io nil)

(setq sml/no-confirm-load-theme t)
(setq custom-safe-themes t)

;; display relative line
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)


(use-package vterm
  :ensure t)
