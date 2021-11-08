(use-package 
  lsp-mode 
  :straight t 
  :commands lsp 
  :custom (lsp-enable-file-watchers nil) 
  :hook (elixir-mode . lsp) 
  :bind (:map lsp-mode-map
	      ("TAB" . completion-at-point)) 
  :custom (lsp-headerline-breadcrumb-enable nil))

(leader-key-def "l" 
  '(:ignore t 
	    :which-key "lsp")
  "ld" 'xref-find-definitions "lr" 'xref-find-references "ln" 'lsp-ui-find-next-reference "lp"
  'lsp-ui-find-prev-reference "ls" 'counsel-imenu "le" 'lsp-ui-flycheck-list "lS"
  'lsp-execute-code-action "lf" 'lsp-format-buffer)

(use-package 
  lsp-ui 
  :straight t 
  :hook (lsp-mode . lsp-ui-mode) 
  :config (setq lsp-ui-sideline-enable t) 
  (setq lsp-ui-doc-position 'bottom))

(use-package 
  dap-mode 
  :straight t 
  :custom (lsp-enable-dap-auto-configure nil) 
  :config (dap-ui-mode 1) 
  (dap-tooltip-mode 1) 
  (require 'dap-node) 
  (dap-node-setup))
