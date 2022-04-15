(use-package flycheck 
  :hook (lsp-mode . flycheck-mode))

(use-package flycheck-credo 
  :straight t)
