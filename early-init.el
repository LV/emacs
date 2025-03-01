;; Completely disable package signature checking
(setq package-check-signature nil)

;; Disable GPG entirely for package management
(setq package-gnupghome-dir 'emacs)  ;; Use a dummy directory to avoid GPG

;; Prevent package.el from activating packages early
(setq package-enable-at-startup nil)
