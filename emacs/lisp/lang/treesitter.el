(use-package tree-sitter)

(use-package tree-sitter-langs
  :straight (tree-sitter-langs :type git :host github :repo "emacs-tree-sitter/tree-sitter-langs"
                      :fork (:host github
								   :repo "george124816/tree-sitter-langs"
								   :branch "master")))
