(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el"
					user-emacs-directory)) 
      (bootstrap-version 5)) 
  (unless (file-exists-p bootstrap-file) 
    (with-current-buffer (url-retrieve-synchronously
			  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el" 'silent 'inhibit-cookies)
(goto-char (point-max))
(eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(setq user-emacs-directory (expand-file-name "~/.cache/emacs/") url-history-file (expand-file-name "url/history" user-emacs-directory))

(use-package
no-littering
)

;; Keep customization settings in a temporary file (thanks Ambrevar!)
(setq custom-file (if (boundp 'server-socket-dir)
(expand-file-name "custom.el" server-socket-dir)
(expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))
(load custom-file t)

(set-default-coding-systems 'utf-8)

(setq make-backup-files nil)

(use-package
exec-path-from-shell
:ensure t
)

(when (memq window-system '(mac nx x))
(exec-path-from-shell-initialize))

(load "~/.emacs.d/lisp/theme.el")
(load "~/.emacs.d/lisp/keybinding.el")
(load "~/.emacs.d/lisp/modeline.el")
(load "~/.emacs.d/lisp/eshell.el")

(load "~/.emacs.d/lisp/lang/dev.el")
(load "~/.emacs.d/lisp/lang/lsp.el")
(load "~/.emacs.d/lisp/lang/tree-sitter.el")
(load "~/.emacs.d/lisp/lang/elisp.el")
(load "~/.emacs.d/lisp/lang/elixir.el")
(load "~/.emacs.d/lisp/lang/markdown.el")
(load "~/.emacs.d/lisp/lang/docker.el")

