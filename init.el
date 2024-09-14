(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable toolbar
(tooltip-mode -1)       ; Disable tooltips
(set-fringe-mode 10)    ; Add fringe space to the left and right of the buffer

(menu-bar-mode 1)       ; Enable the menu bar

(setq visible-bell nil) ; If true, replaces sound bell for visual cue when performing action that can't be done
                        ;   (e.g. backspacing on the first line of the document, down arrow on last line, etc)
                        ; On MacOS, this makes a large caution triangle which can be very annoying, so perhaps disable if using Mac
