;;; astro-zombies-theme.el --- An Emacs theme made while listening to the Misfits.

;; Copyright (C) 2021-2022 Nahuel J. Sacchetti

;; Author: Nahuel J. Sacchetti <me@nsacchetti.com>
;; URL: http://github.com/elnawe/astro-zombies-theme
;; Version: 1.0 Beta

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

;; An Emacs theme I made while listening to the whole discography of the Misfits, one of
;; my favorite bands.
;; This theme mixes a violet/blueish tones with some extra coloring. It's low contrast for
;; the most part, but adding some contrast on specific parts where there's a lot of text
;; involved (except for `emacs-lisp-mode')

;;; Credits:

;; The Misfits - One of my favorite bands.
;; HiroHi @ lospec <https://lospec.com/palette-list/gothic-bit> - Initial color palette

;;; Code:

(deftheme astro-zombies "A theme based on the Misfits music")

(defgroup astro-zombies-theme nil
  "Astro Zombies Theme."
  :group 'faces
  :prefix "astro-zombies-"
  :link '(url-link :tag "GitHub" "http://github.com/elnawe/astro-zombies-theme")
  :tag "Astro Zombies Theme")

;;; Color Palette

(defvar astro-zombies-colors-alist
  '(("color0"  . "#0e0e12")
    ("color1"  . "#1a1a24")
    ("color2"  . "#333346")
    ("color3"  . "#535373")
    ("color4"  . "#8080a4")
    ("color5"  . "#a6a6bf")
    ("color6"  . "#c1c1d2")
    ("color7"  . "#e6e6ec")
    ("color8"  . "#6cb9c9")
    ("color9"  . "#6e5181")
    ("color10" . "#b03a48")
    ("color11" . "#38786f"))
  "List of Astro Zombies colors.
Each element has the form (NAME . HEX).")

(defmacro with-astro-zombies-theme-colors (&rest body)
  "`let' bind all colors defined in `astro-zombies-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   astro-zombies-colors-alist))
     ,@body))

;;; Theme Faces

(with-astro-zombies-theme-colors
  (custom-theme-set-faces
   'astro-zombies
   '(button ((t (:underline t))))
   `(aw-background-face ((t (:background ,color0 :foreground ,color3 :inverse-video nil))))
   `(aw-leading-char-face ((t (:foreground ,color8 :weight bold :height 2.0))))
   `(consult-narrow-indicator ((t (:foreground ,color8 :weight bold))))
   `(cursor ((t (:foreground ,color7 :background ,color8))))
   `(default ((t (:background ,color0 :foreground ,color5))))
   `(diff-added ((t (:background ,color11 :foreground ,color7))))
   `(diff-file-header ((t (:inherit diff-header :weight bold))))
   `(diff-header ((t (:background ,color2 :extend t :foreground ,color6))))
   `(diff-indicator-added ((t (:background ,color11 :foreground ,color7))))
   `(diff-indicator-removed ((t (:background ,color10 :foreground ,color7))))
   `(diff-removed ((t (:background ,color10 :foreground ,color7))))
   `(dired-directory ((t :foreground ,color5 :weight bold)))
   `(dired-flag ((t :foreground ,color10 :weight bold)))
   `(dired-header ((t :foreground, color9 :height 1.5)))
   `(dired-marked ((t :foreground ,color8 :weight bold)))
   `(doom-modeline-bar  ((t (:background ,color4 :box nil))))
   `(doom-modeline-buffer-file ((t (:foreground ,color0 :weight bold))))
   `(doom-modeline-buffer-modified ((t (:foreground ,color10 :weight bold))))
   `(doom-modeline-debug  ((t (:foreground ,color0))))
   `(doom-modeline-highlight ((t (:foreground ,color2 :weight bold))))
   `(doom-modeline-inactive-bar  ((t (:background nil))))
   `(doom-modeline-info ((t (:foreground ,color0))))
   `(escape-glyph ((t (:foreground ,color10 :weight bold))))
   `(fill-column-indicator ((t (:foreground ,color2 :weight semilight))))
   `(flycheck-error ((t (:underline (:style wave :color ,color10) :inherit unspecified))))
   `(flycheck-fringe-error ((t (:foreground ,color10 :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,color8 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,color7 :weight bold))))
   `(flycheck-info ((t (:underline (:style wave :color ,color8) :inherit unspecified))))
   `(flycheck-warning ((t (:underline (:style wave :color ,color7) :inherit unspecified))))
   `(font-lock-builtin-face ((t (:foreground ,color4 :underline t))))
   `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-comment-face ((t (:foreground ,color3))))
   `(font-lock-constant-face ((t (:foreground ,color5))))
   `(font-lock-doc-face ((t (:foreground ,color4))))
   `(font-lock-fixme-face ((t (:foreground ,color10 :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,color4))))
   `(font-lock-important-face ((t (:foreground ,color8 :weight bold))))
   `(font-lock-keyword-face ((t (:foreground ,color9))))
   `(font-lock-negation-char-face ((t (:foreground ,color10 :weight bold))))
   `(font-lock-note-face ((t (:inherit default :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,color5))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,color5 :weight bold))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,color6 :weight bold))))
   `(font-lock-string-face ((t (:foreground ,color3))))
   `(font-lock-type-face ((t (:foreground ,color8))))
   `(font-lock-variable-name-face ((t (:foreground ,color5))))
   `(font-lock-warning-face ((t (:foreground ,color10 :weight bold))))
   `(fringe ((t (:background ,color0 :foreground ,color5))))
   `(gnus-button ((t (:foreground ,color6 :weight bold :height 1.2))))
   `(gnus-header-content ((t (:foreground ,color5))))
   `(gnus-header-from ((t (:foreground ,color8 :weight bold))))
   `(gnus-header-name ((t (:foreground ,color9))))
   `(gnus-header-subject ((t (:foreground ,color8 :weight bold))))
   `(header-line ((t (:foreground ,color6 :background ,color1 :extend t))))
   `(highlight ((t (:background ,color2 :foreground ,color7))))
   `(hl-line ((t (:background ,color2))))
   `(hl-line-face ((t (:background ,color2))))
   `(isearch ((t (:background ,color2 :foreground ,color8 :weight bold))))
   `(isearch-fail ((t (:background ,color10 :foreground ,color0 :weight normal))))
   `(js2-error ((t (:underline (:style wave :color ,color10)))))
   `(js2-function-call ((t (:inherit default))))
   `(js2-function-param ((t (:inherit font-lock-type-face))))
   `(lazy-highlight ((t (:background ,color2 :foreground ,color5))))
   `(line-number ((t (:background ,color0 :foreground ,color5))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,color8 :weight bold))))
   `(link ((t (:foreground ,color8 :underline t :weight normal))))
   `(link-visited ((t (:foreground ,color8 :underline t :weight normal))))
   `(linum ((t (:inherit line-number))))
   `(log-edit-header ((t (:foreground ,color9 :weight bold))))
   `(marginalia-documentation ((t (:foreground ,color4 :slant italic))))
   `(menu ((t (:background ,color0 :foreground ,color5))))
   `(message-cited-text-4 ((t (:background nil :foreground ,color6))))
   `(message-header-name ((t (:foreground ,color9 :weight bold))))
   `(message-header-other ((t (:foreground ,color5))))
   `(message-header-subject ((t (:foreground ,color8))))
   `(message-header-to ((t (:foreground ,color11 :weight bold))))
   `(message-separator ((t (:background ,color2 :foreground ,color4))))
   `(minibuffer-prompt ((t (:foreground ,color8))))
   `(mode-line ((t (:background ,color4 :box nil :foreground ,color0))))
   `(mode-line-buffer-id ((t (:foreground ,color0))))
   `(mode-line-emphasis ((t (:foreground ,color0))))
   `(mode-line-inactive ((t (:background ,color1 :box nil :foreground ,color5))))
   `(mu4e-header-highlight-face ((t (:background ,color2 :foreground ,color5))))
   `(mu4e-header-key-face ((t (:foreground ,color8 :weight bold :height 1.0))))
   `(mu4e-header-title-face ((t (:inherit default))))
   `(mu4e-highlight-face ((t (:background ,color2 :foreground ,color5))))
   `(mu4e-replied-face ((t (:foreground ,color3 :slant italic))))
   `(mu4e-title-face ((t (:foreground ,color9 :weight bold :height 1.2))))
   `(mu4e-unread-face ((t (:foreground ,color8 :weight bold))))
   `(orderless-match-face-0 ((t (:foreground ,color8 :weight bold))))
   `(orderless-match-face-1 ((t (:foreground ,color10 :weight bold))))
   `(orderless-match-face-2 ((t (:foreground ,color11 :weight bold))))
   `(orderless-match-face-3 ((t (:foreground ,color7 :weight bold))))
   `(org-agenda-current-time ((t (:foreground ,color11))))
   `(org-agenda-date ((t (:foreground ,color5))))
   `(org-agenda-date-today ((t (:foreground ,color5 :slant italic :weight bold))) t)
   `(org-agenda-date-weekend ((t (:foreground ,color3))))
   `(org-agenda-structure ((t (:foreground ,color9 :height 1.3))))
   `(org-block ((t (:background ,color1 :extend t))))
   `(org-block-background ((t (:background ,color2))))
   `(org-block-begin-line ((t (:foreground ,color3))))
   `(org-block-end-line ((t (:foreground ,color3))))
   `(org-checkbox ((t (:background ,color1 :foreground ,color7 :box nil))))
   `(org-checkbox-statistics-done ((t (:background ,color1 :foreground ,color11 :box nil))))
   `(org-checkbox-statistics-todo ((t (:background ,color1 :foreground ,color6 :box nil))))
   `(org-column ((t (:background ,color1))))
   `(org-column-title ((t (:background ,color1 :underline t :weight bold))))
   `(org-date ((t (:foreground ,color8 :underline t))))
   `(org-document-info ((t (:foreground ,color4))))
   `(org-document-info-keyword ((t (:foreground ,color4))))
   `(org-document-title ((t (:foreground ,color7 :weight bold))))
   `(org-done ((t (:foreground ,color11 :weight bold))))
   `(org-ellipsis ((t (:foreground ,color8 :height 1.2))))
   `(org-footnote ((t (:foreground ,color8 :underline t))))
   `(org-formula ((t (:foreground ,color3))))
   `(org-headline-done ((t (:foreground ,color3 :weight normal))))
   `(org-hide ((t (:foreground ,color0))))
   `(org-imminent-deadline ((t (:foreground ,color10))))
   `(org-level-1 ((t (:foreground ,color9 :height 1.0 :weight bold))))
   `(org-level-2 ((t (:foreground ,color4 :height 1.0 :weight bold))))
   `(org-level-3 ((t (:foreground ,color5 :height 1.0 :weight bold))))
   `(org-level-4 ((t (:foreground ,color4 :height 1.0 :weight bold))))
   `(org-level-5 ((t (:foreground ,color5 :height 1.0 :weight bold))))
   `(org-level-6 ((t (:foreground ,color4 :height 1.0 :weight bold))))
   `(org-link ((t (:inherit link))))
   `(org-meta-line ((t :foreground ,color4)))
   `(org-mode-line-clock ((t (:foreground ,color0 :weight normal))))
   `(org-mode-line-clock-overrun ((t (:foreground ,color10 :weight bold))))
   `(org-quote ((t (:background ,color1 :extend t))))
   `(org-scheduled ((t (:foreground ,color5))))
   `(org-scheduled-previously ((t (:foreground ,color10))))
   `(org-scheduled-today ((t (:foreground ,color7))))
   `(org-sexp-date ((t (:foreground ,color8 :underline t))))
   `(org-table ((t (:background ,color1 :foreground ,color5))))
   `(org-tag ((t (:foreground ,color9 :weight normal))))
   `(org-time-grid ((t (:foreground ,color3))))
   `(org-todo ((t (:foreground ,color10 :weight bold))))
   `(org-upcoming-deadline ((t (:foreground ,color8))))
   `(org-upcoming-distant-deadline ((t (:inherit default))))
   `(org-verbatim ((t (:background ,color2 :box t :foreground ,color5))))
   `(region ((t (:background ,color2 :distant-foreground ,color7 :extend t))))
   `(rjsx-attr ((t (:inherit font-lock-function-name-face))))
   `(rjsx-tag ((t (:inherit font-lock-keyword-face))))
   `(rjsx-text ((t (:foreground ,color6))))
   `(secondary-selection ((t (:background ,color2))))
   `(show-paren-match ((t (:inherit default :background ,color2 :weight bold))))
   `(show-paren-mismatch ((t (:background ,color2 :foreground ,color10 :weight bold))))
   `(success ((t (:foreground ,color11 :weight bold))))
   `(tooltip ((t (:foreground ,color5 :background ,color1))))
   `(trailing-whitespace ((t (:background ,color1))))
   `(vertical-border ((t (:foreground ,color5))))
   `(warning ((t (:foreground ,color10 :weight bold))))
   `(widget-field ((t (:foreground ,color5 :background ,color1))))))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'astro-zombies)
