(defun hook/tree-sitter-common () 
  (unless font-lock-defaults 
    (setq font-lock-defaults '(nil))) 
  (setq tree-sitter-hl-use-font-lock-keywords nil) 
  (setq tree-sitter-hl-face:function.call 't) 
  (tree-sitter-mode +1) 
  (tree-sitter-hl-mode +1))

(use-package 
  tree-sitter 
  :ensure t 
  :hook ((elixir-mode . hook/elixir-tree-sitter)) 
  :config (setq tree-sitter-debug-highlight-jump-region t) 
  (setq tree-sitter-debug-jump-buttons t))

(use-package 
  tree-sitter-langs 
  :straight t 
  :after tree-sitter)

(provide 'init-tree-sitter)
