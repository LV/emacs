(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable toolbar
(tooltip-mode -1)       ; Disable tooltips
(set-fringe-mode 10)    ; Add fringe space to the left and right of the buffer

(menu-bar-mode 1)       ; Enable the menu bar

(setq visible-bell nil) ; If true, replaces sound bell for visual cue when performing action that can't be done
                        ;   (e.g. backspacing on the first line of the document, down arrow on last line, etc)
                        ; On MacOS, this makes a large caution triangle which can be very annoying, so perhaps disable if using Mac

(global-display-line-numbers-mode t)  ; Enable line numbers
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "PragmataPro Mono Liga" :height 180)

(load-theme 'tango-dark)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)  ; Make ESC quit prompts

;; Initialize package sources
(require 'package)    ; Brings in the package management functions into the environment

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)  ; Initialize the package system and prepares it to be used
(unless package-archive-contents  ; refresh contents only if packages don't exist
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Vim Mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Completion framework
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         (:map ivy-minibuffer-map
	       ("TAB" . ivy-alt-done)
               ("C-l" . ivy-alt-done)
               ("C-j" . ivy-next-line)
               ("C-k" . ivy-previous-line))
         (:map ivy-switch-buffer-map
               ("C-k" . ivy-previous-line)
               ("C-l" . ivy-done)
               ("C-d" . ivy-switch-buffer-kill))
         (:map ivy-reverse-i-search-map
               ("C-k" . ivy-previous-line)
               ("C-d" . ivy-reverse-i-search-kill)))
  :config
  (ivy-mode 1))

;; Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3)) ; seconds

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-modeline ivy evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
