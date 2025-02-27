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
