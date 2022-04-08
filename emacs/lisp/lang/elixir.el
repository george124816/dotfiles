(use-package elixir-mode
  :after tree-sitter-langs
  :config
 (add-hook 'elixir-mode-hook 'tree-sitter-hl-mode)
 (add-hook 'elixir-mode-hook 'lsp)
 (require 'elixir-mode))
