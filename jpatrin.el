(add-to-list 'load-path
             "~/.emacs.d/share/emacs/site-lisp");

(setq user-mail-address "jpatrin@lolapps.com"
      ;; See docs
      show-paren-style 'mixed
      ;; Set up my preferred window size and font.
      initial-frame-alist
      `((left . 0) (top . 20)
        (width . 275) (height . 75)
        ;; (font ;;
        ;; . "-apple-Monaco-medium-normal-normal-*-10-*-*-*-m-0-iso10646-1")
        ;; Get list by doing M-x set-face-font RET default RET TAB TAB
        ;; which brings up a Completions buffer.
        (font . "-apple-Terminus-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1"))
      ;; Apply window size and font to all subsequently-created frames.
      default-frame-alist initial-frame-alist
      ;; ERAU QSSI DLRO WEHT
      ;;windmove-wrap-around t
      ;; Use ssh for tramp
      tramp-default-method "ssh"
      ;; Turn off obnoxious bell
      ring-bell-function 'ignore)

;;; Show column number in mode line
(column-number-mode 1)

;;; Show active line
(global-hl-line-mode 1)

;;; When in whitespace-mode, highlight lines longer than 78 columns.
(setq whitespace-line-column 78)

;;; Trim whitespace from end of lines when saving.
;(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;;; Automatically make scripts executable.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;;; Editing Ruby
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-indent-level 4)
             (setq ruby-deep-arglist nil)
             (setq ruby-deep-indent-paren nil)))

;;; Allow command-line clients to open files in GUI Emacs.
(server-start)

;;; Automatically create directory trees for new files as needed.
(defun maybe-make-parent-dirs ()
  (or (file-exists-p (file-name-directory buffer-file-name))
      (make-directory (file-name-directory buffer-file-name) t)))
(if (fboundp 'maybe-make-parent-dirs)
    (add-hook 'before-save-hook 'maybe-make-parent-dirs))

;;; Load SMerge when needed
(defun sm-try-smerge ()
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward "^<<<<<<< " nil t)
      (smerge-mode 1))))
(add-hook 'find-file-hook 'sm-try-smerge t)

(add-to-list 'auto-mode-alist '("\\.json\\'" . javascript-mode))

(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
(global-srecode-minor-mode 1)            ; Enable template insertion
                                    ; menu

(add-to-list 'load-path
             "~/.emacs.d/ecb-2.40")
(require 'ecb)

;;;;; Pretty Colors
;(require 'color-theme)
;(defun color-theme-pdl-light ()
;  "Color theme by Paul Lathrop, created 2010-07-13."
;  (interactive)
;  (color-theme-install
;   '(my-color-theme
;     ((background-color . "White")
;      (background-mode . light)
;      (cursor-color . "red")
;      (foreground-color . "Black"))
;     ((hl-line-face . hl-line)
;      (list-matching-lines-buffer-name-face . underline)
;      (list-matching-lines-face . match)
;      (view-highlight-face . highlight)
;      (widget-mouse-face . highlight))
;     (default ((t (:stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "apple" :family "Monaco"))))
;     (bold ((t (:bold t :weight bold))))
;     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
;     (border ((t (nil))))
;     (buffer-menu-buffer ((t (:bold t :weight bold))))
;     (button ((t (:underline t))))
;     (comint-highlight-input ((t (:bold t :weight bold))))
;     (comint-highlight-prompt ((t (:foreground "dark blue"))))
;     (completions-annotations ((t (:italic t :slant italic))))
;     (completions-common-part ((t (:family "Monaco" :foundry "apple" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "Black" :background "White" :stipple nil :height 100))))
;     (completions-first-difference ((t (:bold t :weight bold))))
;     (cursor ((t (nil))))
;     (eldoc-highlight-function-argument ((t (:bold t :weight bold))))
;     (escape-glyph ((t (:foreground "brown"))))
;     (esk-paren-face ((t (:foreground "grey55"))))
;     (ffap ((t (:background "darkseagreen2"))))
;     (file-name-shadow ((t (:foreground "grey50"))))
;     (fixed-pitch ((t (:family "Monospace"))))
;     (font-lock-builtin-face ((t (:foreground "MediumOrchid4"))))
;     (font-lock-comment-delimiter-face ((t (:foreground "Firebrick"))))
;     (font-lock-comment-face ((t (:foreground "Firebrick"))))
;     (font-lock-constant-face ((t (:foreground "dark cyan"))))
;     (font-lock-doc-face ((t (:foreground "VioletRed4"))))
;     (font-lock-function-name-face ((t (:foreground "Blue1"))))
;     (font-lock-keyword-face ((t (:foreground "Purple"))))
;     (font-lock-negation-char-face ((t (nil))))
;     (font-lock-preprocessor-face ((t (:foreground "MediumOrchid4"))))
;     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
;     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
;     (font-lock-string-face ((t (:foreground "VioletRed4"))))
;     (font-lock-type-face ((t (:foreground "ForestGreen"))))
;     (font-lock-variable-name-face ((t (:foreground "sienna"))))
;     (font-lock-warning-face ((t (:bold t :foreground "Red1" :weight bold))))
;     (fringe ((t (:background "grey95"))))
;     (header-line ((t (:box (:line-width -1 :style released-button) :background "grey90" :foreground "grey20" :box nil))))
;     (help-argument-name ((t (:italic t :slant italic))))
;     (hi-black-b ((t (:bold t :weight bold))))
;     (hi-black-hb ((t (:bold t :family "Sans Serif" :weight bold :height 1.67))))
;     (hi-blue ((t (:background "light blue"))))
;     (hi-blue-b ((t (:bold t :foreground "blue1" :weight bold))))
;     (hi-green ((t (:background "green1"))))
;     (hi-green-b ((t (:bold t :foreground "green1" :weight bold))))
;     (hi-pink ((t (:background "pink"))))
;     (hi-red-b ((t (:bold t :foreground "red1" :weight bold))))
;     (hi-yellow ((t (:background "yellow1"))))
;     (highlight ((t (:background "darkseagreen2"))))
;     (hl-line ((t (:background "darkseagreen2"))))
;     (ido-first-match ((t (:bold t :weight bold))))
;     (ido-incomplete-regexp ((t (:bold t :weight bold :foreground "Red1"))))
;     (ido-indicator ((t (:background "red1" :foreground "yellow1" :width condensed))))
;     (ido-only-match ((t (:foreground "ForestGreen"))))
;     (ido-subdir ((t (:foreground "red1"))))
;     (isearch ((t (:background "magenta3" :foreground "lightskyblue1"))))
;     (isearch-fail ((t (:background "RosyBrown1"))))
;     (italic ((t (:italic t :slant italic))))
;     (lazy-highlight ((t (:background "paleturquoise"))))
;     (link ((t (:foreground "blue1" :underline t))))
;     (link-visited ((t (:underline t :foreground "magenta4"))))
;     (match ((t (:background "yellow1"))))
;     (menu ((t (nil))))
;     (minibuffer-prompt ((t (:foreground "medium blue"))))
;     (mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button)))))
;     (mode-line-buffer-id ((t (:bold t :weight bold))))
;     (mode-line-emphasis ((t (:bold t :weight bold))))
;     (mode-line-highlight ((t (:box (:line-width 2 :color "grey40" :style released-button)))))
;     (mode-line-inactive ((t (:background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75" :style nil) :weight light))))
;     (mouse ((t (nil))))
;     (next-error ((t (:background "ns_selection_color"))))
;     (nobreak-space ((t (:foreground "brown" :underline t))))
;     (ns-working-text-face ((t (:underline t))))
;     (query-replace ((t (:foreground "lightskyblue1" :background "magenta3"))))
;     (region ((t (:background "ns_selection_color"))))
;     (scroll-bar ((t (nil))))
;     (secondary-selection ((t (:background "yellow1"))))
;     (shadow ((t (:foreground "grey50"))))
;     (show-paren-match ((t (:background "turquoise"))))
;     (show-paren-mismatch ((t (:background "purple" :foreground "white"))))
;     (tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button)))))
;     (tooltip ((t (:family "Sans Serif" :background "lightyellow" :foreground "black"))))
;     (trailing-whitespace ((t (:background "red1"))))
;     (underline ((t (:underline t))))
;     (variable-pitch ((t (:family "Sans Serif"))))
;     (vertical-border ((t (:background "white" :foreground "white"))))
;     (widget-button ((t (:bold t :weight bold))))
;     (widget-button-pressed ((t (:foreground "red1"))))
;     (widget-documentation ((t (:foreground "dark green"))))
;     (widget-field ((t (:background "gray85"))))
;     (widget-inactive ((t (:foreground "grey50"))))
;     (widget-single-line-field ((t (:background "gray85")))))))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)

;(require 'auto-complete)
;(global-auto-complete-mode t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;(load-library "init_python")

(load "~/.emacs.d/python-mode/python-mode.el")
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pyflakes-init)))
;(add-hook 'find-file-hook 'flymake-find-file-hook)
(load-library "flymake-cursor")

;(require 'pysmell)
;(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))

(load "~/.emacs.d/mmm-mako.el")

(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)

(setq ropemacs-guess-project t)

(setq ecb-tip-of-the-day nil)

;(ecb-activate)

(global-set-key (kbd "<kp-delete>") 'delete-char)

;(visit-tags-table "~/Documents/lolapps/dane/server/TAGS")
;(find-file "~/Documents/lolapps/dane/server/setup.py")
;(find-file "~/.emacs.d/jpatrin.el")

;(add-to-list 'load-path
;             "~/.emacs.d/flyparse-mode")
;(require 'flyparse-mode)

(require 'actionscript-mode)

(add-hook 'actionscript-mode-hook
          '(lambda ()
             (setq tab-width 4)))

(require 'color-theme-solarized)

(require 'psvn)

(desktop-save-mode 1)

(setq ido-use-filename-at-point nil)
(setq ido-use-url-at-point nil)
