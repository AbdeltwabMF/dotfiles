;;; Certificate host whitelisting
(in-package :next-user)
(setf next/certificate-whitelist-mode:*default-certificate-whitelist*
      (make-instance 'certificate-whitelist :whitelist '("next.atlas.engineer")))

(defclass my-buffer (buffer)
  ((default-modes :initform '(web-mode root-mode proxy-mode certificate-whitelist-mode))))
(setf buffer-class 'my-buffer)


;;; Cloning Git repositories
;; the command looks into the following directories for existing projects:
(in-package :next-user)
(setf next/vcs:*vcs-projects-roots* '("~/.local/src/others"))


;;; Decide how to open files
(defun my-open-files (filename)
  "Open music and videos with mpv, open directories with emacsclient."
  (let ((args)
        (extension (pathname-type filename)))
    (cond
      ((uiop:directory-pathname-p filename)
       (log:info "Opening ~a with emacsclient." filename)
       (setf args (list "emacsclient" filename)))

      ((member extension '("flv" "mkv" "mp4") :test #'string-equal)
       (setf args (list "mpv" filename))))

    (handler-case (if args
                      (uiop:launch-program args)
                      ;; fallback to Next's default.
                      (next/file-manager-mode:open-file-function filename))
      (error (c) (log:error "Error opening ~a: ~a" filename c)))))

(setf next/file-manager-mode:*open-file-function* #'my-open-files)
