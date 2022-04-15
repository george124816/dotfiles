(use-package go-mode
  :config
 (add-hook 'go-mode-hook 'tree-sitter-hl-mode)
 (add-hook 'go-mode-hook 'lsp)
)
