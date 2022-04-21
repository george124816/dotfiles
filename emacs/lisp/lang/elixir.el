(use-package elixir-mode
  :after tree-sitter-langs
  :config
 (add-hook 'elixir-mode-hook 'tree-sitter-hl-mode)
 (add-hook 'elixir-mode-hook 'lsp)
 (add-hook 'elixir-mode-hook 'flycheck-mode)
 (require 'elixir-mode))

(use-package exunit)

(defun mix-quality ()
  (interactive)
  (setq default-directory (projectile-project-root))
  (exunit-do-compile "mix format && mix credo && mix dialyzer && mix test"))

(defun mix-migrate ()
  (interactive)
  (setq default-directory (projectile-project-root))
  (exunit-do-compile "MIX_ENV=test mix do ecto.drop, ecto.create, ecto.migrate"))

(global-definer
  "tp" 'mix-quality
  "tm" 'mix-migrate)
