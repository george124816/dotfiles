(use-package 
  elixir-mode 
  :ensure t 
  :after tree-sitter-langs 
  :init (add-to-list 'exec-path "~/.elixir-ls/") 
  :config (add-to-list 'tree-sitter-major-mode-language-alist '(elixir-mode . elixir)))

(defun hook/elixir-tree-sitter () 
  (setq tree-sitter-hl-default-patterns (read (concat "[" (s-replace "#match?" ".match?"
								     (f-read-text (expand-file-name
										   "~/Sources/tree-sitter-elixir/queries/highlights.scm")))
						      "]"))) 
  (hook/tree-sitter-common))

(use-package 
  flycheck-credo 
  :straight t)

(use-package 
  elixir-yasnippets 
  :straight t)

(use-package 
  exunit 
  :straight t
  :config (leader-key-def "," 'exunit-mode-keymap))
