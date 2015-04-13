(defvar nyorem-packages
  '(
    glsl-mode
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar nyorem-excluded-packages '()
  "List of packages to exclude.")

(defun nyorem/init-glsl-mode ()
  "Initialize my package"
  )

;; For each package, define a function nyorem/init-<package-nyorem>
;;
;; (defun nyorem/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
