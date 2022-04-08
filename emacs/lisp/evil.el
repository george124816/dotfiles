;;; evil mode
(use-package evil
  :demand t
  :init
  (setq evil-want-C-u-scroll t) 
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-tree) 
  :config
  (evil-mode 1))

(use-package undo-tree
  :init (global-undo-tree-mode 1))

;; fix underline and underscore
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t))

;;; Commentary package
(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))


(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
