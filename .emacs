(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Misc formatting
(setq-default indent-tabs-mode nil) ; Disable tabs
(show-paren-mode 1) ; Highlight matching parens
(setq show-paren-delay 0)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq truncate-partial-width-windows t)

;; Backups
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; CMake mode
; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))
(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)

;; C++ mode
(defconst my-cc-style
  '("bsd"
    (c-offsets-alist . ((innamespace . [0])))
    (c-offsets-alist . ((member-init-intro . [0])))
    (c-offsets-alist . ((member-init-cont . [0])))))
(c-add-style "my-cc-style" my-cc-style)
(setq c-default-style "my-cc-style"
      c-basic-offset 4)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
