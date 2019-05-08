(package-initialize)

;; The package setup stuff out of the way early
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (gnus-mock sicp geiser elpy lenlen-theme solarized-theme elm-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; mac switch meta key
(defun mac-switch-meta nil 
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
	(setq mac-option-modifier 'meta)
	(setq mac-command-modifier 'hyper)
	)
    (progn 
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      (setq mac-option-modifier 'hyper)
      )
    )
  )

(mac-switch-meta)

;; Some editing keys that I keep forgetting to use
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)

(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)

;; Quick movement keys
(global-set-key [(hyper h)] 'windmove-left)
(global-set-key [(hyper l)] 'windmove-right)
(global-set-key [(hyper k)] 'windmove-up)
(global-set-key [(hyper j)] 'windmove-down)

;; Show recently edited files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; Currency macros: euro -> €; and pound -> £
;; Use M-x euro, or M-x pound to insert symbol
(fset 'euro
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 35 120 50 48 65 67 return] 0 "%d")) arg)))

(fset 'pound
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 35 120 0 0 65 51 return] 0 "%d")) arg)))


;; Don't show scrollbars
(toggle-scroll-bar -1)

(load-theme 'misterioso t)
;; (elpy-enable)

;; Geiser scheme mode
;; Doesn't find scheme, so specify it manually
(setq geiser-guile-binary "/usr/local/bin/guile")
(setq geiser-active-implementations '(guile))


;; Neato org-mode stuff
(with-eval-after-load 'org
  (setq org-startup-indented t))

(setq org-todo-keywords
      '((sequence "TODO"
		  "IN PROGRESS"
		  "BLOCKED"
		  "|"
		  "DONE"
		  "DEFERRED"
		  "CANCELLED")))
