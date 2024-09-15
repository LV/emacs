(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable toolbar
(tooltip-mode -1)       ; Disable tooltips
(set-fringe-mode 10)    ; Add fringe space to the left and right of the buffer

(menu-bar-mode 1)       ; Enable the menu bar

(setq visible-bell nil) ; If true, replaces sound bell for visual cue when performing action that can't be done
                        ;   (e.g. backspacing on the first line of the document, down arrow on last line, etc)
                        ; On MacOS, this makes a large caution triangle which can be very annoying, so perhaps disable if using Mac

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)  ; Enable line numbers
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "PragmataPro Mono Liga" :height 180)

(load-theme 'tango-dark)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)  ; Make ESC quit prompts
(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)    ; Prompt menu to switch buffer

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

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))

(use-package counsel
  :after ivy
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

(use-package doom-themes
  :init (load-theme 'doom-Iosvkem t))

;; Colorizes parenthesis and braces
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Shows which keys to press for commands
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3)) ; seconds

;; Alternative help screen
(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; NOTE: The first time you load this config onto a new machine, you'll need to run the following:
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer rune/leader-keys
			  :keymaps '(normal insert visual emacs)
			  :prefix "SPC"
			  :global-prefix "C-SPC"))
(rune/leader-keys
 "s"  '(swiper :which-key "swiper")
 "t"  '(:ignore t :which-key "toggles")
 "tt" '(counsel-load-theme :which-key "choose theme"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" default))
 '(package-selected-packages
   '(general doom-themes helpful counsel swiper rainbow-delimiters doom-modeline ivy evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
