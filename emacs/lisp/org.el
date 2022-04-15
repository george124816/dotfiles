;; (require 'org)

(setq org-agenda-files '("~/Dropbox/org"))
(setq org-todo-keywords '((sequence "TODO" "DOING" "REVIEW" "DONE")))

(setq org-log-done t)

(global-set-key (kbd "C-c a") 'org-agenda)
