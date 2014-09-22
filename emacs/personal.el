;;; personal.el --- Personal configuration (over Prelude)

;;; Commentary:
;; This file sets my personal configuration for emacs.

;;; Code:
;; line numbers
;; (global-linum-mode t)
;; (setq linum-format "%d  ")

;; evil-surround
(global-evil-surround-mode 1)

;; evil-nerd-commenter
(evilnc-default-hotkeys)

;; escape quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; use C-j / C-k for scrolling
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                    (interactive)
                    (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                        (interactive)
                        (evil-scroll-down nil)))

;; indent when CR
(define-key global-map (kbd "RET") 'newline-and-indent)

;; org-mode
(setq org-agenda-files '("~/org"))
(setq org-todo-keywords '((sequence "TODO" "WAITING" "DONE")))

;; magit
(global-set-key (kbd "C-x G") 'magit-status)

;; solarized-theme
(load-theme 'solarized-light t)

;; projectile
(setq projectile-completion-system 'grizzl)

;; Enable mouse
(require 'mouse)
(xterm-mouse-mode t)
(global-set-key [mouse-4] '(lambda ()
                           (interactive)
                           (scroll-down 1)))
(global-set-key [mouse-5] '(lambda ()
                           (interactive)
                           (scroll-up 1)))
;; Enable trackpad
(defun track-mouse (e))
(setq mouse-sel-mode t)

;; Disable flyspell
(setq prelude-flyspell nil)

;; Remove menus
(custom-set-variables
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

; replace tabs by spaces
(setq-default indent-tabs-mode nil)

; disable alarm bells
(setq visible-bell 1)

;;; personal.el ends here
