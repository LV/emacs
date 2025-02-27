;; Evil: Vim keybindings for Emacs
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-tree)
  (setq evil-mode-line-format nil) ; disable evil state in modeline (using doom-modeline instead)
  :custom
  (evil-undo-system 'undo-tree)
  :config
  (evil-mode 1) ; turn on Evil mode
  ; (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) ; I think this is the same as just hitting escape when you're not in insert mode
  ; (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)

  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (define-key evil-visual-state-map (kbd "/") 'swiper))

(use-package evil-collection
  :ensure t
  :after (evil magit)
  :config
  (evil-collection-init))


;; General: setup keybindings with a leader key
(use-package general
  :ensure (:wait t)
  :demand t
  :config
  (general-evil-setup t)

  (general-create-definer lv/leader-keys
    :states '(normal visual)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC"))
