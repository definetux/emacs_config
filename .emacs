(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(speedbar-default-position (quote left-right))
 '(sr-speedbar-max-width 10)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load melpa repository
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; set light green color theme
(package-initialize)
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-bharadwaj-slate)

; use C-j as global jump key
(global-unset-key "\C-j")
(define-key lisp-interaction-mode-map "\C-j" nil)
(define-key lisp-interaction-mode-map "" 'eval-print-last-sexp)
(define-key emacs-lisp-mode-map "\C-j" nil)
(add-hook 'lisp-interaction-mode-hook (lambda () (define-key lisp-interaction-mode-map "\C-j" nil)))
(add-hook 'emacs-lisp-mode-hook (lambda () (define-key lisp-interaction-mode-map "\C-j" nil)))
(add-hook 'org-mode-hook (lambda () (define-key org-mode-map "\C-j" nil)))
(add-hook 'python-mode-hook (lambda () (define-key py-mode-map "\C-j" nil))) 

;; keyboard definition
(global-unset-key (kbd "C-k"))
(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-i"))

(global-set-key (kbd "C-j") 'backward-char)
(global-set-key (kbd "C-l") 'forward-char)
(global-set-key (kbd "C-i") 'previous-line)
(global-set-key (kbd "C-k") 'next-line)
(global-set-key (kbd "M-j") 'backward-word)
(global-set-key (kbd "M-l") 'forward-word)
(global-set-key (kbd "M-n") 'other-window)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-s") 'save-buffer)
 
;; base settings
(setq show-parent-style 'expression)
(show-paren-mode 2)
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)


;; plugins
(add-to-list 'load-path "/home/mgoncharuk/.emacs.d/plugins")
(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'bs)
(setq bs-configurations '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
(global-set-key (kbd "<f2>") 'bs-show)

(add-to-list 'load-path "/home/mgoncharuk/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "/home/mgoncharuk/.emacs.d/plugins/auto-complete/dict")

(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)
(custom-set-variables
 '(speedbar-show-unknown-files t)
 )

;; Skip over nodes with C-up / C-down
(define-key speedbar-file-key-map (kbd "<C-up>") 'speedbar-restricted-prev)
(define-key speedbar-file-key-map (kbd "<C-down>") 'speedbar-restricted-next)
;; Hooks
(add-hook 'speedbar-mode-hook
(lambda ()
(setq case-fold-search t) ; Enable case-insensitive search
(speedbar-disable-update)))
;; Speedbar parameters. I like the speedbar to be a little wider
(setq speedbar-frame-parameters
`(
(minibuffer)
(width . 30)
(border-width . 0)
(menu-bar-lines . 0)
(tool-bar-lines . 0)
(unsplittable . t)
(left-fringe . 0)))

;;(add-to-list 'load-path "/home/mgoncharuk/.emacs.d/plugins/yasnippet")
;;(require 'yasnippet)
;;(yas-global-mode 1)
;;(yas/load-directory "/home/mgoncharuk/.emacs.d/plugins/yasnippet/snippets")
