(defvar nyorem-pre-extensions
  '(
    ;; pre extension nyorems go here
    )
  "List of all extensions to load before the packages.")

(defvar nyorem-post-extensions
  '(
    ;; post extension nyorems go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function nyorem/init-<extension-nyorem>
;;
;; (defun nyorem/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
