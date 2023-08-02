(setq inhibit-startup-message t)    ; Disabale st artup page

(scroll-bar-mode -1)                ; Disable visible scrollbar
(tool-bar-mode -1)                  ; Disable tooltips
(tooltip-mode -1)                   ; Disable tooltips
(set-fringe-mode 10)                ; Create breathing room (???)

(setq visible-bell t)               ; Set up the visible bell

(let ((font "Inconsolata")
      (alternate-font "Courier New"))
  (if (find-font (font-spec :name font))
    (set-face-attribute 'default nil :font font :height 200)
    (set-face-attribute 'default nil :family alternate-font :height 128 :weight 'normal :width 'normal)))

(load-theme 'misterioso)

;; Initalize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
             ("org" . "https://orgmode.org/elpa/")
             ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Initalize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-modd-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
     ("C-x b" . counsel-ibuffer)
     ("C-x C-f" . counsel-find-file)
     :map minibuffer-local-map
     ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

;; Ivy is a completion framework
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
     :map ivy-minibuffer-map
     ("TAB" . ivy-alt-done)
     ("C-l" . ivy-alt-done)
     ("C-j" . ivy-next-line)
     ("C-k" . ivy-previous-line)
     :map ivy-switch-buffer-map
     ("C-k" . ivy-previous-line)
     ("C-l" . ivy-done)
     ("C-d" . ivy-switch-buffer-kill)
     :map ivy-reverse-i-search-map
     ("C-k" . ivy-previous-line)
     ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

;; Rainbow brackets and parenthesis for better visibility
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-modeline use-package evil counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
