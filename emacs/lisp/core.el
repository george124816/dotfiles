(setq-default tab-width 4)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-log-io nil)

(setq sml/no-confirm-load-theme t)
(setq custom-safe-themes t)

;; Start server.
(require 'server)
(unless (server-running-p)
  (server-start))
