(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable toolbar
(tooltip-mode -1)       ; Disable tooltips
(set-fringe-mode 10)    ; Add fringe space to the left and right of the buffer

(menu-bar-mode 1)       ; Enable the menu bar

(setq visible-bell nil) ; If true, replaces sound bell for visual cue when performing action that can't be done
                        ;   (e.g. backspacing on the first line of the document, down arrow on last line, etc)
                        ; On MacOS, this makes a large caution triangle which can be very annoying, so perhaps disable if using Mac

(set-face-attribute 'default nil :font "PragmataPro Mono Liga" :height 180)

(load-theme 'tango-dark)

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
(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
