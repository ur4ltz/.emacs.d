;;; habamax.el --- miscelaneous habamax functions -*- lexical-binding: t; -*-
;;; Commentary:
;;  Bunch of misc functions.
;;; Code:

(defun habamax/open-init-file ()
  "Open init.el."
  (interactive)
  (find-file user-init-file))

(defun habamax/open-secret-file ()
  "Select and open gpg file from org directory."
  (interactive)
  (let ((default-directory (or (getenv "ORG") "~/org")))
    (thread-first
      (lambda (f) (file-relative-name (file-name-sans-extension f)))
      (mapcar (directory-files-recursively default-directory "\\.gpg$"))
      ((lambda (files) (completing-read "Open secret: " files)))
      (concat ".gpg")
      (find-file))))

(defun habamax/toggle-comment (arg)
  "Comment or uncomment current line if mark region is not active.
Otherwise call well known `comment-dwim'"
  (interactive "*P")
  (comment-normalize-vars)
  (cond
   ((use-region-p)
    (comment-dwim arg))
   (t
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (forward-line))))

(defun habamax/join-line ()
  "Join next line."
  (interactive)
  (delete-indentation 1))

(defun habamax/next-buffer-like-this ()
  "Open next buffer with the same major mode as current."
  (interactive)
  (let ((b-name (buffer-name))
        (b-mode mode-name))
    (next-buffer)
    (while
        (and
         (not (equal mode-name b-mode))
         (not (equal b-name (buffer-name))))
      (next-buffer))))

(defun habamax/previous-buffer-like-this ()
  "Open previous buffer with the same major mode as current."
  (interactive)
  (let ((b-name (buffer-name))
        (b-mode mode-name))
    (previous-buffer)
    (while
        (and
         (not (equal mode-name b-mode))
         (not (equal b-name (buffer-name))))
      (previous-buffer))))

(defun habamax/kill-region ()
  "Kill region if mark is active, kill whole line otherwise."
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end) (use-region-p))
    (kill-region (line-beginning-position) (line-beginning-position 2))))

(defun habamax/kill-ring-save ()
  "Save region in kill ring if mark is active, save whole line otherwise."
  (interactive)
  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end) (use-region-p))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))

(defun habamax/slurp-forward ()
  "Basic implementation of a slurp forward."
  (interactive)
  (save-excursion
    (up-list 1 t t)
    (when (char-equal (char-before) ?\")
      (up-list 1 t t))
    (when-let ((close (char-before))
               (start (point)))
      (delete-char -1)
      (forward-sexp)
      (insert close)
      (indent-region start (point) nil))))

(defun habamax/diff-buffer ()
  "Show diff for current buffer against file."
  (interactive)
  (diff-buffer-with-file (buffer-name)))

(defun habamax/grep-current-word ()
  "Search current word using `grep' and `grep-command'"
  (interactive)
  (grep (concat grep-command (current-word) " .")))

(defun habamax/grep-todo ()
  "Search current TODO:, FIXME: and XXX: using `grep' and `grep-command'"
  (interactive)
  (grep (concat grep-command "\"(TODO|FIXME|XXX):\" .")))

(defun habamax/insert-lorem ()
  "Select and insert text file from lorem/ directory located in
`user-emacs-directory'"
  (interactive)
  (let ((path (locate-user-emacs-file "lorem/")))
    (insert-file-contents
     (concat
      path
      (completing-read
       "Insert lorem: "
       (directory-files path
                        nil
                        directory-files-no-dot-files-regexp))))))

(defun habamax/toggle-theme ()
  "Toggle my themes."
  (interactive)
  (let* ((theme (car custom-enabled-themes))
         (my-themes '((wildcharm . wildcharm-light)
                      (wildcharm-light . forget-me-not)
                      (forget-me-not . sandcastle)))
         (next-theme (cdr (assoc theme my-themes))))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme (or next-theme 'wildcharm) t)))

(defun habamax/toggle-alpha ()
  "Toggle alpha-background (transparency)."
  (interactive)
  (thread-last
    (pcase (frame-parameter nil 'alpha-background)
      (90 nil)(_ 90))
    (set-frame-parameter nil 'alpha-background)))

(defun habamax/reload-current-theme ()
  "Reload current theme."
  (interactive)
  (let ((theme (car custom-enabled-themes)))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme theme t)))

(defun habamax/open-file-manager ()
  "Open file-manager for the current file."
  (interactive)
  (let ((filename (or (buffer-file-name)
                      (dired-get-file-for-visit))))
    (cond
     ((and +IS-WINDOWS+ filename)
      (call-process-shell-command
       (format "explorer.exe /select, \"%s\""
               (string-replace "/" "\\" filename))))
     ((and +IS-WSL+ filename)
      (call-process-shell-command
       (format "explorer.exe /select, \"%s\""
               (if (string-match "/mnt/[c-z]/.*" filename)
                   (string-trim (shell-command-to-string (concat "wslpath -w '" filename "'")))
                 (string-replace "/" "\\" filename)))))
     (filename
      (call-process-shell-command
       (format "nautilus --select \"%s\" &" filename))))))

(defun habamax/auth-secret (host)
  "Return secret(password) for specified host from auth-sources."
  (let ((found (nth 0 (auth-source-search :host host :create nil))))
    (when found
      (let ((secret (plist-get found :secret)))
	(if (functionp secret)
	    (funcall secret)
	  secret)))))

(defun habamax/auth-basic (host)
    "Return base64 encoded login:password for specified host from auth-sources."
    (let ((found (nth 0 (auth-source-search :host host :create nil))))
      (when found
	(let ((secret (plist-get found :secret))
              (user (plist-get found :user)))
          (base64url-encode-string
           (format "%s:%s"
                  user
                  (if (functionp secret)
                      (funcall secret)
                    secret)))))))

(provide 'habamax)
;;; habamax.el ends here
