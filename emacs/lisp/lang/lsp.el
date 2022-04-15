(use-package company-mode
  :ensure company
  :defer t
  :config

  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0) ;; default is 0.2
  (add-hook 'after-init-hook 'global-company-mode))

(use-package lsp-mode
  :init
 (setq lsp-keymap-prefix "C-l")

  :config
  (setq lsp-file-watch-threshold 2000)
  ;; (setq lsp-headerline-breadcrumb-enable nil)
  

  ;;elixir
  (setq lsp-elixir-suggest-specs nil)
  (setq lsp-elixir-fetch-deps nil))


(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode) 
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  )
