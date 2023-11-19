;;; edef-light-theme.el --- Almost default light Emacs theme -*- lexical-binding: t; -*-

;; Author: Maxim Kim <habamax@gmail.com>
;; URL: https://github.com/habamax/edef-light-theme XXX: non-published!
;; Package-Requires: ((emacs "24.1"))
;; Package-Version: 0.7

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Default emacs light syntax colors, different chrome.

;;; Code:

(deftheme edef-light
  "Almost default light Emacs theme.")

(let ((fg "#000000")(bg "#ffffff")
      (darkgrey "#7f7f7f")
      (darkergrey "#5f5f5f")
      (red "#af0000")
      (green "#006f00")
      (yellow "#af5f00")
      (blue "#0078c7")
      (non-text "#878787")
      (match-paren "#ff00af")
      (mode-line-active "#d0d0d0")
      (mode-line-inactive "#e4e4e4")
      (header-line "#d7d7d7")
      (code-block "#f7f7f7"))

  (custom-theme-set-faces
   'edef-light

   ;; standard faces
   `(default
     ((t (:background ,bg :foreground ,fg))))
   `(shadow
     ((t (:foreground ,non-text))))
   `(region
     ((t (:background ,bg :foreground ,blue :inverse-video t))))
   `(trailing-whitespace
     ((t (:foreground ,red :inverse-video t))))
   `(vertical-border
     ((t (:background ,mode-line-inactive :foreground ,non-text))))
   `(mode-line
     ((t (:background ,mode-line-active :foreground ,fg
                      :box (:style released-button)))))
   `(mode-line-inactive
     ((t (:background ,mode-line-inactive :foreground ,darkgrey
                      :box (:line-width 1 :color ,mode-line-active)))))
   `(mode-line-highlight
     ((t (:background ,bg
                      :box (:line-width 1 :color ,non-text)))))
   `(mode-line-emphasis
     ((t (:weight bold))))
   `(mode-line-buffer-id
     ((t (:weight bold))))
   `(header-line
     ((t (:background ,header-line :foreground ,fg :extend t
                      :box (:line-width 1 :color ,darkgrey)))))
   `(cursor
     ((t (:background ,fg))))
   `(tab-bar
     ((t (:background ,header-line :foreground ,fg))))
   `(tab-bar-tab
     ((t (:background ,mode-line-inactive :foreground ,fg :weight bold
                      :box (:style released-button)))))
   `(tab-bar-tab-inactive
     ((t (:background ,header-line :foreground ,darkergrey
                      :box (:style released-button)))))

   `(show-paren-match
     ((t :foreground ,match-paren :weight bold)))
   `(show-paren-mismatch
     ((t :background ,match-paren :foreground ,fg :weight bold)))

   `(shortdoc-heading
     ((t (:inherit default :weight bold :height 1.3))))
   `(shortdoc-section
     ((t (:inherit default))))

   `(whitespace-space
     ((t (:background unspecified :foreground ,non-text))))
   `(whitespace-line
     ((t nil)))
   `(whitespace-trailing
     ((t (:inherit 'trailing-whitespace))))
   `(whitespace-indentation
     ((t (:inherit 'whitespace-space))))
   `(whitespace-tab
     ((t (:inherit 'whitespace-space))))
   `(whitespace-empty
     ((t (:background ,yellow))))

   `(org-block
     ((t (:background ,code-block :extend t))))
   `(org-code
     ((t (:background ,code-block :extend t))))
   `(org-verbatim
     ((t (:background ,code-block :extend t))))
   `(org-date
     ((t (:foreground ,darkgrey))))
   `(org-block-begin-line
     ((t (:foreground ,darkgrey))))
   `(org-block-end-line
     ((t (:inherit org-block-begin-line))))

   `(erc-prompt-face
     ((t (:background unspecified :foreground unspecified :inverse-video t :weight bold))))
   `(erc-notice-face
     ((t (:foreground ,darkgrey))))
   `(erc-button
     ((t (:inherit link))))
   `(erc-timestamp-face
     ((t (:foreground ,darkgrey :weight unspecified))))
   `(erc-my-nick-face
     ((t (:foreground ,red :weight bold))))
   `(erc-current-nick-face
     ((t (:inherit erc-my-nick-face))))
   `(erc-input-face
     ((t (:foreground ,red))))


   `(gnus-summary-selected
     ((t (:inverse-video t :underline nil))))
   `(gnus-summary-normal-unread
     ((t (:foreground ,fg :weight bold))))
   `(gnus-summary-normal-read
     ((t (:foreground ,fg))))
   `(gnus-summary-normal-ticked
     ((t (:foreground ,yellow))))
   `(gnus-summary-normal-ancient
     ((t (:foreground ,darkgrey))))
   `(gnus-summary-cancelled
     ((t (:background unspecified :foreground ,red))))
   `(gnus-header
     ((t (:inherit default))))
   `(gnus-header-name
     ((t (:foreground ,green :weight bold))))
   `(gnus-header-from
     ((t (:foreground ,red :weight bold))))
   `(gnus-header-content
     ((t (:foreground ,fg :weight normal :slant normal))))
   `(gnus-header-subject
     ((t (:foreground ,fg :weight bold))))
   `(gnus-header-newsgroups
     ((t (:foreground ,fg :weight bold))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'edef-light)
;;; edef-light-theme.el ends here