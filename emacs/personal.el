;;; personal.el --- Personal configuration (over Prelude)

;;; Commentary:
;; This file sets my personal configuration for emacs.

;;; Code:
;; line numbers
;; (global-linum-mode t)
;; (setq linum-format "%d  ")

;; evil-mode
;; surround
(global-evil-surround-mode 1)

;; Org-mode
(setq org-agenda-files '("~/org"))
;; end evil-mode

;; Solarized-theme
(load-theme 'solarized-light t)

;; Move between split windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

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
