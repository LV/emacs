(setq inhibit-startup-message t)    ; Disabale st artup page

(scroll-bar-mode -1)                ; Disable visible scrollbar
(tool-bar-mode -1)                  ; Disable tooltips
(tooltip-mode -1)                   ; Disable tooltips
(set-fringe-mode 10)                ; Create breathing room (???)

(setq visible-bell t)               ; Set up the visible bell

(set-face-attribute 'default nil :font "Inconsolata" :height 280)

(load-theme 'tango-dark)

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
