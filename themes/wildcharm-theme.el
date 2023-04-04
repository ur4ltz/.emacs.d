;;; wildcharm-theme.el -- port of my vim-wildcharm colorscheme
;;; Author: Maxim Kim <habamax@gmail.com>


(deftheme wildcharm "Vibrant and playful.")

(let ((class256 '((class color) (min-colors 256)))
      (classTTY '((type tty) (min-colors 16)))
      (fg "#d0d0d0")(bg "#1c1f26")
      (color00 "#000000")(color08 "#767676")
      (color01 "#d75f5f")(color09 "#ff5f87")
      (color02 "#00af5f")(color10 "#00d75f")
      (color03 "#d78700")(color11 "#ffaf00")
      (color04 "#0087d7")(color12 "#00afff")
      (color05 "#d787d7")(color13 "#ff87ff")
      (color06 "#00afaf")(color14 "#00d7d7")
      (color07 "#d0d0d0")(color15 "#ffffff")
      (color-match-paren "#ff00af")(color-non-text "#585858")
      (color-mode-line-active-1 "#404348")(color-mode-line-inactive-1 "#303338")
      (color-mode-line-active-2 "#444444")(color-mode-line-inactive-2 "#303030")
      (color-fringe "#12161a")(color-header-line "#32363a")
      (color-special "#875fff")(color-hl-line "#3a3d42")
      (color-match "#3a3632"))

  (custom-theme-set-faces
   'wildcharm

   ;;; standard faces
   `(default ((,classTTY (:background nil, :foreground nil))
              (t (:background ,bg :foreground ,fg))))
   `(shadow ((,class256 (:foreground ,color-non-text))))
   `(link ((,class256 (:foreground ,fg :underline t))))
   `(link-visited ((,class256 (:foreground ,color08 :underline t))))
   `(highlight ((,class256 (:foreground ,color00 :background ,color12))))
   `(region ((,class256 (:background ,color04 :foreground ,bg))))
   `(secondary-selection ((,class256 (:background ,color06 :foreground ,bg))))
   `(trailing-whitespace ((,class256 (:foreground ,color01 :weight bold))))
   `(line-number ((,class256 (:foreground ,color-non-text))))
   `(line-number-current-line ((,class256 (:foreground ,color03 :weight bold))))
   ;; -line-number-major-tick
   ;; -line-number-minor-tick
   ;; -fill-column-indicator
   `(escape-glyph ((,class256 (:foreground ,color-special))))
   `(homoglyph ((,class256 (:inherit 'escape-glyph))))
   `(nobreak-space ((,class256 (:foreground ,color-special :underline t))))
   `(nobreak-hyphen ((,class256 (:inherit 'escape-glyph))))
   `(mode-line ((,class256 (:background ,color-mode-line-active-1 :foreground ,color07 :box (:line-width 1 :color ,color-non-text)))
                (,classTTY (:background ,color-mode-line-active-2 :foreground ,color07))))
   `(mode-line-inactive ((,class256 (:background ,color-mode-line-inactive-1 :foreground ,color08 :box (:line-width 1 :color ,color00)))
                         (,classTTY (:background ,color-mode-line-inactive-2 :foreground ,color08))))
   `(mode-line-highlight ((,class256 (:background ,color00 :box (:line-width 1 :color ,color-non-text)))))
   `(mode-line-emphasis ((,class256 (:weight bold))))
   `(mode-line-buffer-id ((,class256 (:weight bold))))
   `(header-line ((,class256 (:foreground ,fg :background ,color-header-line :extend t  :box (:line-width 1 :color ,color00)))))
   `(vertical-border ((,classTTY (:background ,color-mode-line-inactive-2 :foreground ,color-mode-line-inactive-2))
                      (,class256 (:foreground ,color-non-text))))
   ;; -window-divider '((t :foreground "gray60"))
   ;; -window-divider-first-pixel
   ;; -window-divider-last-pixel
   ;; -internal-border
   ;; -child-frame-border
   `(minibuffer-prompt ((,class256 (:foreground ,color11 :weight bold))))
   `(fringe ((,classTTY (:foreground ,color02 :background ,color01))
             (,class256 (:background ,color-fringe))))
   ;; -scroll-bar
   `(cursor ((t (:background "#ffffff"))))
   ;; -tool-bar
   `(tab-bar ((,classTTY (:background ,color-mode-line-inactive-2 :foreground ,color08))
              (,class256 (:background ,color-mode-line-inactive-1 :foreground ,color08))))
   `(tab-bar-tab ((,classTTY (:background ,color-mode-line-active-2 :foreground ,color15 :weight bold))
                  (,class256 (:background ,bg :foreground ,color15 :weight bold))))   
   `(tab-bar-tab-inactive ((,classTTY (:background ,color-mode-line-inactive-2 :foreground ,color07))
                           (,class256 (:background ,color-mode-line-active-1 :foreground ,color07))))
   ;; -menu
   `(help-key-binding ((,class256 (:foreground ,color06 :background nil :box (:line-width (1 . -1) :color ,color06)))))
   `(error ((,class256 (:foreground ,color09 :weight bold))))
   `(warning ((,class256 (:foreground ,color03 :weight bold))))
   `(success ((,class256 (:foreground ,color10 :weight bold))))
   ;; -tty-menu-enabled-face
   ;; -tty-menu-disabled-face
   ;; -tty-menu-selected-face
   `(show-paren-match ((,class256 :foreground ,color-match-paren :weight bold)))
   `(show-paren-mismatch ((,class256 :foreground ,color15 :background ,color-match-paren :weight bold)))
   
   ;;; font-lock
   `(font-lock-string-face ((,class256 (:foreground ,color10))))
   `(font-lock-comment-face ((,class256 (:foreground ,color08))))
   `(font-lock-keyword-face ((,class256 (:foreground ,color12))))
   `(font-lock-preprocessor-face ((,class256 (:foreground ,color14))))
   `(font-lock-builtin-face ((,class256 (:foreground ,color05))))
   `(font-lock-type-face ((,class256 (:foreground ,color11))))
   `(font-lock-function-name-face ((,class256 (:foreground ,color13))))
   `(font-lock-variable-name-face ((,class256 (:foreground ,color06))))
   `(font-lock-constant-face ((,class256 (:foreground ,color09))))
   `(font-lock-warning-face ((,class256 (:foreground ,color03 :weight bold))))

   ;;; isearch
   `(isearch ((,class256 (:background ,color11 :foreground ,color00))))
   `(lazy-highlight ((,class256 (:background ,color10 :foreground ,color00))))
   `(isearch-fail ((,class256 (:background ,color09 :foreground ,color00))))

   ;;; replace.el
   `(match ((,class256 (:background ,color-match))))

   ;;; global-hl-line-mode
   `(hl-line ((,class256 (:foreground nil :background ,color-hl-line))))

   ;;; widget
   `(widget-field ((,class256 (:foreground ,fg :background ,color-header-line :extend t))))
   
   ;;; dired
   `(dired-header ((,class256 (:foreground ,color15 :weight bold))))
   `(dired-directory ((,class256 (:inherit font-lock-keyword-face :weight bold))))
   `(dired-symlink ((,class256 (:foreground ,color14 :weight bold :inherit nil))))
   `(dired-broken-symlink ((,class256 (:foreground ,color15 :background ,color01))))
   `(dired-special ((,class256 (:foreground ,color05 :inherit nil))))
   `(dired-perm-write ((,class256 (:foreground ,color03 :inherit nil))))

   ;;; completion
   `(icomplete-first-match ((,class256 (:foreground ,color10 :weight bold))))
   `(icomplete-selected-match ((,class256 (:background ,color-hl-line))))
   `(completions-common-part ((,class256 (:foreground ,color12 :weight bold))))
   `(completions-first-difference ((,class256 (:foreground ,color13))))

   ;;; ido
   `(ido-first-match ((,class256 (:foreground ,color10 :weight bold))))
   `(ido-only-match ((,class256 (:inherit 'ido-first-match))))
   `(ido-virtual ((,class256 (:foreground ,color08))))
   `(ido-subdir ((,class256 (:foreground ,color15 :weight bold))))
   ;; check how good it is
   `(ido-indicator ((,class256 (:background ,color01 :foreground ,color11))))

   ;;; compilation
   `(compilation-mode-line-fail ((,class256 (:foreground ,color01 :weight bold))))
   `(compilation-mode-line-exit ((,class256 (:foreground ,color02 :weight bold))))
   `(compilation-line-number ((,class256 (:foreground ,color08))))
   `(compilation-line-number ((,class256 (:foreground ,color08))))

   ;;; whitespace
   `(whitespace-space ((,class256 (:background nil :foreground ,color-non-text))))
   `(whitespace-line ((,class256 nil)))
   `(whitespace-trailing ((,class256 (:inherit 'trailing-whitespace))))
   `(whitespace-indentation ((,class256 (:inherit 'whitespace-space))))
   `(whitespace-tab ((,class256 (:inherit 'whitespace-space))))
   `(whitespace-empty ((,class256 (:background ,color03))))

   ;;; vc
   `(log-view-message ((,class256 (:foreground ,color08))))
   `(log-view-commit-body ((,class256 (:foreground ,fg))))
   
   ;;; message
   `(message-header-name ((,class256 (:foreground ,color05))))
   `(message-header-subject ((,class256 (:foreground ,color15 :weight bold))))
   `(message-header-to ((,class256 (:foreground ,color15))))
   `(message-header-other ((,class256 (:foreground ,color08))))
   
   ;;; markdown
   `(markdown-header-face ((,class256 (:foreground ,color15 :weight bold))))
   `(markdown-header-delimiter-face ((,class256 (:foreground ,color12 :weight bold))))
   `(markdown-header-rule-face ((,class256 (:foreground ,color12 :weight bold))))
   `(markdown-code-face ((,class256 (:foreground ,fg))))
   `(markdown-list-face ((,class256 (:foreground ,color11))))
   `(markdown-markup-face ((,class256 (:foreground ,color08))))
   `(markdown-inline-code-face ((,class256 (:foreground ,color02))))
   `(markdown-language-keyword-face ((,class256 (:foreground ,color06))))
   `(markdown-gfm-checkbox-face ((,class256 (:foreground ,color08))))

   ;;; diff
   `(diff-header ((,class256 (:foreground ,color12 :weight bold))))
   `(diff-file-header ((,class256 (:foreground ,color15))))
   `(diff-hunk-header ((,class256 (:foreground ,color11 :weight bold))))

   ;;; vc
   `(vc-edited-state ((,class256 (:foreground ,color03))))
   `(vc-conflict-state ((,class256 (:foreground ,color01))))
   `(vc-locally-added-state ((,class256 (:foreground ,color06))))
   `(vc-locked-state ((,class256 (:foreground ,color04))))
   `(vc-missing-state ((,class256 (:foreground ,color05))))
   `(vc-needs-update-state ((,class256 (:foreground ,color02))))
   `(vc-removed-state ((,class256 (:foreground ,color09))))
   
   ;;; git-commit
   `(git-commit-summary ((,class256 (:foreground ,color15 :weight bold))))
   `(git-commit-nonempty-second-line ((,class256 (:foreground ,color09 :weight bold))))

   ;;; magit
   `(magit-section-heading ((,class256 (:foreground ,color11 :weight bold))))
   `(magit-section-heading-selection ((,class256 (:foreground ,color03))))
   `(magit-section-highlight ((,class256 (:background ,color-hl-line))))
   `(magit-branch-local ((,class256 (:foreground ,color12))))
   `(magit-branch-remote ((,class256 (:foreground ,color10))))
   `(magit-cherry-equivalent ((,class256 (:foreground ,color13))))
   `(magit-cherry-unmatched ((,class256 (:foreground ,color14))))
   `(magit-bisect-bad ((,class256 (:foreground ,color01))))
   `(magit-bisect-good ((,class256 (:foreground ,color02))))
   `(magit-bisect-skip ((,class256 (:foreground ,color03))))
   
   ;;; erc
   `(erc-timestamp-face ((,class256 (:foreground ,color08))))
   `(erc-notice-face ((,class256 (:foreground ,color08))))
   `(erc-nick-default-face ((,class256 (:foreground ,color04))))
   `(erc-current-nick-face ((,class256 (:foreground ,color09))))
   `(erc-nick-msg-face ((,class256 (:foreground ,color11))))
   `(erc-input-face ((,class256 (:foreground ,color10))))
   `(erc-error-face ((,class256 (:foreground ,color01))))
   `(erc-dangerous-host-face ((,class256 (:foreground ,color01))))
   `(erc-direct-msg-face ((,class256 (:foreground ,color03))))
   `(erc-button ((,class256 (:foreground nil :background nil :underline t))))
   `(erc-prompt-face ((,class256 (:foreground ,color13 :background nil :weight bold))))
   `(erc-action-face ((,class256 (:foreground ,color06 :background nil :weight bold))))
   `(fg:erc-color-face0 ((,class256 (:foreground ,color00))))
   `(fg:erc-color-face1 ((,class256 (:foreground ,color01))))
   `(fg:erc-color-face2 ((,class256 (:foreground ,color02))))
   `(fg:erc-color-face3 ((,class256 (:foreground ,color03))))
   `(fg:erc-color-face4 ((,class256 (:foreground ,color04))))
   `(fg:erc-color-face5 ((,class256 (:foreground ,color05))))
   `(fg:erc-color-face6 ((,class256 (:foreground ,color06))))
   `(fg:erc-color-face7 ((,class256 (:foreground ,color07))))
   `(fg:erc-color-face8 ((,class256 (:foreground ,color08))))
   `(fg:erc-color-face9 ((,class256 (:foreground ,color09))))
   `(fg:erc-color-face10 ((,class256 (:foreground ,color10))))
   `(fg:erc-color-face11 ((,class256 (:foreground ,color11))))
   `(fg:erc-color-face12 ((,class256 (:foreground ,color12))))
   `(fg:erc-color-face13 ((,class256 (:foreground ,color13))))
   `(fg:erc-color-face14 ((,class256 (:foreground ,color14))))
   `(fg:erc-color-face15 ((,class256 (:foreground ,color15))))

   ;;; elfeed
   `(elfeed-log-date-face ((,class256 (:foreground ,color03))))
   `(elfeed-log-error-level-face ((,class256 (:foreground ,color01))))
   `(elfeed-log-warn-level-face ((,class256 (:foreground ,color03))))
   `(elfeed-log-info-level-face ((,class256 (:foreground ,color04))))
   `(elfeed-log-debug-level-face ((,class256 (:foreground ,color05))))
   `(elfeed-search-date-face ((,class256 (:foreground ,color08))))
   `(elfeed-search-title-face ((,class256 (:foreground ,color07))))
   `(elfeed-search-unread-title-face ((,class256 (:foreground ,color15 :weight bold))))
   `(elfeed-search-feed-face ((,class256 (:foreground ,color02))))
   `(elfeed-search-tag-face ((,class256 (:foreground ,color11))))
   `(elfeed-search-unread-count-face ((,class256 (:foreground ,color12))))

   ;;; eshell
   `(eshell-prompt ((,class256 (:foreground ,color13 :weight bold))))
   `(eshell-ls-directory ((,class256 (:foreground ,color12 :weight bold))))
   `(eshell-ls-symlink ((,class256 (:foreground ,color14 :weight bold))))
   `(eshell-ls-executable ((,class256 (:foreground ,color10 :weight bold))))
   `(eshell-ls-clutter ((,class256 (:foreground ,color01))))
   `(eshell-ls-archive ((,class256 (:foreground ,color03))))
   `(eshell-ls-backup ((,class256 (:foreground ,color08))))
   `(eshell-ls-unreadable ((,class256 (:foreground ,color-non-text))))
   `(eshell-ls-missing ((,class256 (:foreground ,color15 :background ,color01))))
   `(eshell-ls-product ((,class256 (:foreground ,color15))))
   `(eshell-ls-readonly ((,class256 (:foreground ,color08))))
   `(eshell-ls-special ((,class256 (:foreground ,color05))))
   
   
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'wildcharm)
