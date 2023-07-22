(use-modules (gnu packages man)
             (gnu packages ruby))

(packages->manifest (list mandoc ruby ruby-webrick))

