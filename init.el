(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "pdflatex")
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$") "%(o?)yap %dS -paper a4r -s 0 %d") ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "%(o?)yap %dS -paper a4 %d") ("^dvi$" ("^a5\\(?:comb\\|paper\\)$" "^landscape$") "%(o?)yap %dS -paper a5r -s 0 %d") ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)yap %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)yap %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)yap %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)yap %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)yap %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)yap %dS %d") ("^pdf$" "." "xpdf -remote %s -raise %o %(outpage)") ("^html?$" "." "netscape %o"))))
 '(canlock-password "59a5bf0bb174ee1894a3c620eb2c3431d1f85750")
 '(case-fold-search t)
 '(current-language-environment "Latin-9")
 '(default-input-method "latin-9-prefix")
 '(global-font-lock-mode t nil (font-lock))
 '(reftex-default-bibliography (quote ("y:refrigrefs.bib")))
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :family "adobe-courier"))))
 '(font-latex-title-1-face ((t (:inherit font-latex-title-2-face))))
 '(font-latex-title-2-face ((t (:inherit font-latex-title-3-face))))
 '(font-latex-title-3-face ((t (:inherit font-latex-title-4-face)))))
(setq-default TeX-master "main.tex") 
(autoload 'reftex-mode    "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)


(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
;  (add-hook 'latex-mode-hook 'turn-on-reftex)) ; with Emacs latex mode

(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)

;; To integrate with AUCTeX, use 
(setq reftex-plug-into-AUCTeX t)

;; Lad være med at lave irriterende tildebackups
(setq make-backup-files nil)

;; Der skal bruge yap i stedet for xdvi
(setq-default tex-dvi-view-command "yap")

(setq-default ispell-program-name "aspell")


;; Redo-dims
;;(require 'redo)


;; FANCY Plimmer
; Red Hat Linux default .emacs initialization file
;; with some additions from the .emacs file that has
;; been passed around the BYU ECEn dept. (whose author 
;; is unknown to me) and a few customizations of my own.
;; 
;; put together by Bryan Murdock
;;

;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Turn on font-lock mode for Emacs
(cond ((not running-xemacs)
       (global-font-lock-mode t)
       ))

;; Visual feedback on selections
(setq-default transient-mark-mode t)

;; hitting delete will delete the highlighted region
(pending-delete-mode 1)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)
       ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; end Red Hat defaults ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; these customizations were made from the options menu.  To change 
;; them make use the options menu.  They should be self explanatory
;; (I hope)




;;;;;;;; Don't truncate, wrap, or fold lines of split windows ;;;
(setq truncate-partial-width-windows nil)
(setq truncate-lines nil)

;;;; The MODE Line ;;;;
(load "time") (display-time)
(column-number-mode 1)

;; title bar shows name of current buffer ;;
(setq frame-title-format '("emacs: %*%+ %b"))

;; don't show the startup message every time, I know I'm using emacs
(setq inhibit-startup-message t)

;;;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some custom key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; M-g does goto-line ;;;;
(global-unset-key "\M-g")
(global-set-key "\M-g" 'goto-line)

(global-set-key [f2] 'eval-buffer)	; F2
;; (global-set-key [f4] 'revert-buffer)    ; F4

;;;;;; quick move cursor to top or bottom of screen ;;;;;
(defun point-to-top ()
  "Put point on top line of window."
  (interactive)
  (move-to-window-line 0))

(global-set-key [?\C-,] 'point-to-top)

(defun point-to-bottom ()
  "Put point at beginning of last visible line."
  (interactive)
  (move-to-window-line -1))

(global-set-key [?\C-.] 'point-to-bottom)

;;;;;;;;;;;;;;;;; Use cperl-mode instead of perl-mode ;;;;;;;;;;;;;;
;; though I'm not convinced I like it better than perl-mode...
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

;;;;;;;;;; Some functions for fancy indenting and completing ;;;;;;;;;;
;; These were coded by Brett Williams

;; This is a nice idea but it ends up frustrating me more than helping me...
;;(defun indent-newline-indent()
;;  "Indent a line, newline, and indent for the next line."
;;  (interactive)
;;  (indent-for-tab-command)
;;  (newline-and-indent)
;;  )

(defun indent-or-complete ()
  "Complete if point is at end of a word, otherwise indent line."
  (interactive)
  (if (looking-at "\\>")
      ;;     (and
      ;;      (eq (char-syntax (preceding-char)) ?w)
      ;;      (not (eq (char-syntax (following-char)) ?w))
      ;;      )
      (dabbrev-expand nil)
    (indent-for-tab-command)
    ))

;; indent-or-complete seems to do the job well enough,
;; but a simple global binding to tab is not what we want
;; (if I remember correctly, it messes up the mini-buffer 
;;  where tab is generally bound to minibuffer-complete)
;;(global-set-key [tab] 'indent-or-complete)

;; Another option is to bind tab to indent-or-complete
;; within the mode-map of relevant modes. Something like:
;; (define-key java-mode-map [tab] 'indent-or-complete)
;; or even within the mode's hook such as:
(define-key text-mode-map [tab] 'indent-or-complete)
;;(define-key verilog-mode-map [tab] 'indent-or-complete)
(add-hook 'verilog-mode-hook
	  (function (lambda ()
		      (local-set-key (kbd "") 'indent-or-complete)
		      )))
			     
(add-hook 'java-mode-hook 
	  (function (lambda ()
		      (local-set-key (kbd "") 'indent-or-complete)
		      )))

(add-hook 'c-mode-common-hook 
	  (function (lambda ()
		      (setq c-basic-offset 4)
		      (local-set-key (kbd "") 'indent-or-complete)
		      ;;With tab doing completion, M-tab is free for indent-region
		      (local-set-key [?\C-c tab] 'indent-region)
		      )))

;;;;;;;;;;;;;;; color settings ;;;;;;;;;;;;;;;;;;;;;;
(set-foreground-color "grey100" )
;;(set-background-color "#000044" )
(set-background-color "black")


(set-cursor-color "yellow")
(set-border-color "DarkSlateGray" )

(setq default-frame-alist
      (append default-frame-alist
	      '((foreground-color . "grey100")
		(background-color . "black")
		(cursor-color . "yellow")
	        ;(mouse-color . "DarkSlateGray")
		)))
(set-face-foreground 'font-lock-comment-face       "gray")
(set-face-foreground 'font-lock-string-face        "OrangeRed")
;(set-face-foreground 'font-lock-doc-string-face    "gray")
(set-face-foreground 'font-lock-function-name-face "green")
(set-face-foreground 'font-lock-variable-name-face "cyan")
(set-face-foreground 'font-lock-type-face          "SandyBrown")
(set-face-foreground 'font-lock-keyword-face       "Wheat")
(set-face-foreground 'font-lock-builtin-face       "Wheat")
(set-face-foreground 'font-lock-constant-face      "yellow") ; "Wheat")

;(set-face-foreground 'modeline "black")
;(set-face-background 'modeline "grey100")
(set-face-background 'region "blue")
(set-face-foreground 'bold "red")
(set-face-foreground 'italic "yellow")
(set-face-background 'highlight "blue") 

;(setq tool-bar-mode t)

;Matlab sjov

;;; Installation:
;;
;; Put the this file as "matlab.el" somewhere on your load path, then
;; add this to your .emacs or site-init.el file:
;;
   (autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
   (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
   (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
;;
;; User Level customizations (You need not use them all):
   (setq matlab-indent-function t)	; if you want function bodies indented
   (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
   (defun my-matlab-mode-hook ()
     (setq fill-column 76))		; where auto-fill should wrap
   (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
   (defun my-matlab-shell-mode-hook ()
	'())
   (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
;;
;; If you are using a version of MATLAB with the Desktop enabled,
;; you may need to add this:
;;
   (setq matlab-shell-command-swithes '("-nojvm"))
;;
;; Please read the mode help for matlab-mode for additional
;; configuration options.
;;
;; Syntax highlighting:
;;   To get font-lock try adding this for older emacsen:
;;     (font-lock-mode 1)
;;   Or for newer versions of Emacs:
     (global-font-lock-mode t)
;;   To get hilit19 support try adding:
;;     (matlab-mode-hilit)
;;
;; This package requires easymenu, tempo, and derived.
;; This package will optionally use custom, shell, and gud.
;; This package supports language specific extensions in imenu, func-menu,
;;      speedbar, font-lock, and hilit19.

;;; Mailing List:
;;
;; A mailing list has been set up where beta versions of matlab.el are
;; posted, and where comments, questions, bug reports, and answers to
;; questions can be sent.
;;
;; To subscribe send email to "lists@mathworks.com" with a body of:
;;    "subscribe matlab-emacs"
;; to unsubscribe, send email with the body of: "unsubscribe matlab-emacs"

;; My own hacks
;; Toggle buffer forward
(global-set-key [C-right] 'next-buffer)
;; Toggle buffer Backward (The shit does't work)
(global-set-key [C-left]  'previous-buffer)

; Ignore line-wrap and scroll one line up or down with cursor keys no matter the length of the line. Placed in global "external" folder.
(autoload 'screen-lines-mode "screen-lines" "Toggle Screen Lines minor mode for the current buffer." t)
 (autoload 'turn-on-screen-lines-mode "screen-lines" "Turn on Screen Lines minor mode for the current buffer." t)
 (autoload 'turn-off-screen-lines-mode "screen-lines" "Turn off Screen Lines minor mode for the current buffer." t)

;;No tool-bar


;;No scroll bar
(set-scroll-bar-mode nil)


;; Remove the menubar initially.
;; (setq menubar-on nil)
;; (menu-bar-mode nil)
;;  toggle-menubar function. Toggles the menubar on or off.
;; (defun toggle-menubar ()
;;  "Function used to toggle the menubar on and off."
;;  (interactive)
;;  (setq height (frame-height)) ;; current height
;;  (if menubar-on              ;; if
;;    (progn                    ;; then
;;      (menu-bar-mode nil)
;;      (setq menubar-on nil)
;;      (setq height (+ height 3))
;;      (set-frame-height (selected-frame) height)
;;    )
;;    (progn               ;; else
;;      (menu-bar-mode t)
;;      (setq menubar-on t)
;;      (setq height (- height 3))
;;      (set-frame-height (selected-frame) height)
;;    )
;;  )
;; )

;; Python fun:

(setq visible-bell t)
; Make sure your Emacs is 24 or newer.
(require 'package)
(require 'json)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
; Initialize package mode along with all the installed packages
(package-initialize)
; Enable elpy mode
(elpy-enable)
; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; Setting global key bindings.
(global-set-key [f3] 'toggle-menubar)                     ;; Turns menubar on and off.
(global-set-key [f5] 'flyspell-mode)
(global-set-key [f8] 'ispell-word)
(global-set-key [f9] 'flyspell-mode)
(global-set-key [f4] 'screen-lines-mode)                  ;; Toggle screen-lines-mode.
(global-set-key [f7] 'ispell-buffer)                      ;; Stavekontrol af buffer
(global-set-key [(control tab)] 'other-window)  ;; Switch to previously used buffer.
(global-set-key [(control z)] 'undo)                      ;; Simple undo.
(global-set-key [(insert)] 'kill-buffer)                  ;; Disables overwrite mode. Kills current buffer.
(global-set-key [(control j)] 'goto-line)                 ;; Gå til bestemt linie.
;;(global-set-key [(control x) (control z)] 'comment-region);; Comment marked region.
(global-set-key [(control x) (control z)] 'comment-or-uncomment-region);; Comment marked region.

(global-set-key [(control x) (control i)] 'indent-region) ;; Indent marked region.
;;(global-set-key [(control c) (control x) (control z)] 'uncomment-region);; Comment marked region.

(global-set-key [(meta q)] 'TeX-complete-symbol)


;; Auto complete Hack
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)
