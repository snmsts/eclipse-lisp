;;;-*- syntax:COMMON-LISP; Package: (ITERATE :use "COMMON-LISP" :colon-mode :external) -*-


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                     ITERATE, An Iteration Macro
;;;
;;;                 Copyright 1989 by Jonathan Amsterdam
;;;
;;; Permission to use, copy, modify, and distribute this software and its
;;; documentation for any purpose and without fee is hereby granted,
;;; provided that this copyright and permission notice appear in all
;;; copies and supporting documentation, and that the name of M.I.T. not
;;; be used in advertising or publicity pertaining to distribution of the
;;; software without specific, written prior permission. M.I.T. makes no
;;; representations about the suitability of this software for any
;;; purpose.  It is provided "as is" without express or implied warranty.

;;; M.I.T. DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
;;; ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
;;; M.I.T. BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
;;; ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
;;; WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
;;; ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
;;; SOFTWARE.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  FIXES.
;;; (v. 1.2)
;;;  6/14/91  - fixed generation of previous code
;;;  5/6/91   - improved code generated for COLLECT and ADJOINING
;;;  4/10/91  - added *binding-context?* to correctly determine when inside
;;;	        a binding context
;;;  12/20/90 - fixed ,. bug in IN-HASHTABLE
;;;  3/3/91 - no longer generates loop-end and loop-step tags if they're not
;;;           used, to avoid compiler warnings from some compilers (Allegro)
;;;  3/4/91 - treat cond as a special form for allegro
;;;  (v. 1.1.1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; OUTSTANDING PROBLEMS & QUESTIONS:
;;; - What happens if there are two contradictory declarations 
;;;   about a variable's type?  We just take the second one. CLM 
;;;   doesn't say, but presumably this is an error. Let's say it is.
;;;
;;; - Is there a more general way to do synonyms that still allows
;;;   some specificity to particular clauses?  Right now, all we allow
;;;   is for the first words of clauses to have synonyms.
;;;
;;; - We should look at function type declarations, at least at the
;;;   result type, and record them.
;;;
;;; - Consider allowing (locally...).  The semantics would be quite
;;;   odd, however.
;;;
;;; - Consider adding an if-never keyword to find...max/min
;;;
;;; - Consider allowing accumulation variables to be generalized
;;;   variables, acceptable to setf.
;;;
;;; - Consider parsing type declarations of the form (vector * integer),
;;;   to generate types for internal variables.
;;;
;;; - Vector destructuring?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TO DO: 
;;;  - do I walk &optional and &key code in lambda-lists?
;;;  - try binding *macroexpand-hook* in walk
;;;  - track down PREVIOUS bug in Symbolics and sparc lucid

;;;  - reducing and accum: RESULT-TYPE
;;;  - rethink types 
;;;  - how to type result var?
;;;  - *list-end-test* should work with functions as well.
;;;  - (for var concatenate (from 1 to 10) (in '(a b c)) (next (gensym)))
;;;  -       (if (< var 10) 
;;;		 (next [from-to])
;;;		 (if lst
;;;		     (next [in])
;;;		     (gensym)))
;;;  - for var choose, for var repeatedly

;;; For CL version 2:
;;;  - more special forms
;;;  - variable info from environments
;;;  - macro info     "     " (so we can support macrolet)
;;;  - use errors for EOF
;;;  - change WALK and FREE-VARIABLES to take symbol macros into account
;;;  - array indices are fixnums
;;;  - type REAL for extremum clauses
;;;  - everything but symbols and lists are self-evaluating.

;;; Maybe:
;;;  - decls can appear not at top level, as long as they appear before use.
;;;  - extremum and find-extremum should do reductions when possible
;;;  - optimize collections, hashtables, packages for lispms 
;;;  - fix :using-type-of to check for supplied ???
;;;  - for-in should allow numerical keywords (from, to, etc.)...?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TO TEST: 
;;;  - leaving driver code where it is
;;;  - typing
;;;  - macroexpand & walk after-each
;;;  - check for duplicate keywords in defclause, defmacro-clause
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TO DOCUMENT:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defpackage :ITERATE				;MES 12/21/96
  (:use :COMMON-LISP)
  (:nicknames "ITER" "iterate")
  #+LUCID (:import-from :COMMON-LISP-USER "FOR" "IN")
  (:export "ITERATE" "ITER" "DISPLAY-ITERATE-CLAUSES" "DECLARE-VARIABLES"
	   "DEFMACRO-CLAUSE" "DEFCLAUSE-SEQUENCE" "DSETQ"
	   "INITIALLY" "AFTER-EACH" "FINALLY" "IF-FIRST-TIME"
	   "FINALLY-PROTECTED"
	   #-GCL "FINISH"			;MES 2/4/97
	   "LEAVE" "NEXT-ITERATION" "NEXT"
	   #-MCL "TERMINATE"			;MES 12/24/96
	   "REPEAT" "FOR" "AS" "GENERATE" "GENERATING" "IN"
	   "SUM" "SUMMING" "MULTIPLY" "MULTIPLYING"
	   "MAXIMIZE" "MINIMIZE" "MAXIMIZING" "MINIMIZING" "COUNTING"
	   "ALWAYS" "NEVER" "THEREIS" "FINDING" "COLLECT" "COLLECTING"
	   "WITH" "WHILE" "UNTIL" "ADJOINING" "NCONCING" "APPENDING"
	   "NUNIONING UNIONING" "REDUCING" "ACCUMULATE" "ACCUMULATING")
  )

(in-package :ITERATE)				;MES 12/21/96

;;; Some of the 7 extremely random interface commands:

;;; use strings here so that there's no iterate symbol in USER.

#+ignore					;MES 12/21/96
(in-package "ITERATE" :nicknames '("ITER" "iterate"))

#+ignore					;MES 12/24/96
(provide "iterate")
#+ignore					;MES 12/24/96
(provide "ITERATE")
		     ; If you specify lower-case to REQUIRE in Lucid, it will 
                     ; load from the default directory.  Upper-case doesn't.
                   

#+ignore					;MES 2/6/97
(export  '(iterate iter display-iterate-clauses declare-variables
	   defmacro-clause defclause-sequence dsetq))

#+ignore					;MES 2/6/97
(eval-when (compile load eval)
  (defconstant clause-names
	       '(initially after-each finally if-first-time
		 finally-protected
		 #-GCL finish			;MES 2/4/97
		 leave next-iteration next
		 #-MCL terminate		;MES 12/24/96
		 repeat for as generate generating in
		 sum summing multiply multiplying
		 maximize minimize maximizing minimizing counting
		 always never thereis finding collect collecting
		 with while until adjoining nconcing appending
		 nunioning unioning reducing accumulate accumulating)))

#+ignore					;MES 2/6/97
(export clause-names)

(proclaim '(declaration declare-variables))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Constants and global variables.

(defconstant version "1.2" "Current version of Iterate")



(defconstant standard-type-symbols
  '(array atom bignum bit bit-vector character common compiled-function
    complex cons double-float fixnum float function hash-table integer
    keyword list long-float nil null number package pathname random-state
    ratio rational readtable sequence short-float simple-array 
    simple-bit-vector simple-string simple-vector single-float standard-char
    stream string string-char symbol t vector)
  "Table 4-1 of the Common Lisp Manual")


;;; These next two can be used for maximizing and minimizing.

(defconstant smallest-number-alist
  `((fixnum . ,most-negative-fixnum)
    (float . ,most-negative-long-float)
    (long-float . ,most-negative-long-float)
    (short-float . ,most-negative-short-float)
    (double-float . ,most-negative-double-float)
    (single-float . ,most-negative-single-float)))

(defconstant largest-number-alist
  `((fixnum . ,most-positive-fixnum)
    (float . ,most-positive-long-float)
    (long-float . ,most-positive-long-float)
    (short-float . ,most-positive-short-float)
    (double-float . ,most-positive-double-float)
    (single-float . ,most-positive-single-float)))
					;
;;; This is like (proclaim '(declare-variables)).

(defvar *always-declare-variables* nil)

;;; This is so the advanced user can choose how the end of a list is checked
;;; for. 
;;; There are three choices for termination predicate in FOR...ON and
;;; FOR...IN, differing in their behavior on lists with a non-nil cdr:
;;;    NULL: If lucky, will get an error when taking the cdr.  Bad choice.
;;;    ATOM: Will terminate correctly with no error.
;;;    ENDP: Will give an appropriate error message.

(defparameter *list-end-test* 'endp)

;;; *result-var* is bound to a gensym before the clauses of an iterate
;;; form are processed.  In the generated code, the gensym is bound
;;; to nil before any other bindings are performed.  Clauses are free
;;; to generate code that sets the value of *result-var*.

(defvar *result-var*)

;;; Iterate binds *type-alist* to an alist of variables and their
;;; types before processing clauses.  It does this by looking at
;;; (declare (type ...)) forms in the clauses and recording the information
;;; there.  (Just variable type information, not function.)

(defvar *type-alist*)

;;; *declare-variables* is bound to T iff the 
;;;            (declare (iterate:declare-variables))
;;; declaration was seen at top-level, or if
;;; *always-declare-variables* is non-nil.  This indicates that variables 
;;; that haven't been declared by the user should be declared to have
;;; the appropriate types.  What "appropriate" means depends on the
;;; context. 

(defvar *declare-variables*)

;;; *clause* is bound to each entire iterate clause before the clause
;;; is processed.  Mostly for error output (see clause-error).

(defvar *clause*)

;;; *top-level?* is bound to T at top-level (i.e. before any forms that
;;; contain clauses inside them, like IF, LET, etc.) and to NIL
;;; inside such forms.  It is useful to ensure that certain forms
;;; (particularly iteration drivers) occur only at top-level.

(defvar *top-level?*)

;;; *binding-context?* is bound to T inside a form that can bind
;;; variables (let, let*, multiple-value-bind, lambda).  We used to just see
;;; if *internal-variables* was non-nil, but that's wrong--you can be inside a
;;; binding context that binds no variables.

(defvar *binding-context?*)

;;; For the use of make-binding-internal, to pass back bindings.
;;; if-1st-time also uses it to create first-time variables.

(defvar *bindings*)


;;; This is a list of variable-lists containing the variables made by
;;; internal let's or other binding forms.  It is used to check for
;;; the error of having iterate try to bind one of these variables at
;;; top-level.  E.g.
;;;   (iterate (for i from 1 to 10)
;;;            (let ((a nil))
;;;              (collect i into a)))
;;; is an error.

(defvar *internal-variables*)


;;; For functions (like make-binding) that don't want to or can't pass
;;; declarations normally.  These are really decl-specs, not full
;;; declarations. 

(defvar *declarations*)


;;; This is how we get multiple accumulations into the same variable
;;; to come out right.  See make-accum-var-binding.
;;; It's an alist of (accum-var kind <possibly other info>).
;;; The currently used kinds are:
;;;   :collect     for collect, nconc, append, etc.
;;;   :increment   for sum and count
;;;   :max         for maximize
;;;   :min         for minimize
;;; Note that we do not check for type conflict in the re-use of these
;;; variables.

(defvar *accum-var-alist*)

;;; Name of the block for this iterate form.  Used in generating
;;; return statements.

(defvar *block-name*)

;;; The index of standard clauses (a discrimination tree).  This is a
;;; defvar so that reloading doesn't clobber existing defs (though it
;;; will clobber those clauses that are defined in this file, of
;;; course).

(defvar *clause-info-index* '(:index))

(eval-when (compile)
  ;; This is so the variable has a value when we compile this file, since
  ;; the process of compilation results in actually setting things up.
  (if (not (boundp '*clause-info-index*)) 
      (setq *clause-info-index* '(:index))))


;;; An alist of lisp special forms and the functions for handling them.

(defparameter *special-form-alist* 
  '((block . 		   walk-cddr) 
    (catch . 		   walk-cdr)
    (compiler-let . 	   compiler-let-error)
#+allegro (cond .	   walk-cond)   ;; allegro compiler treats cond
    					;; as a special form
    (declare . 		   walk-declare)
    (eval-when . 	   walk-cddr)
    (flet . 		   walk-flet)
    (function . 	   walk-function)
    (go . 		   nil)
    (if . 		   walk-if)
    (labels . 		   walk-flet)
    (let . 		   walk-let)
    (let* . 		   walk-let)
    (macrolet . 	   walk-macrolet)
    (multiple-value-bind . walk-multiple-value-bind)
    (multiple-value-call . walk-cdr)
    (multiple-value-prog1. walk-cdr)
    (progn . 		   walk-progn)
    (progv . 		   walk-cdr)
    (quote . 		   nil)
    (return-from . 	   walk-cddr)
    (setq . 		   walk-setq)
    (tagbody . 		   walk-cdr)
    (the . 		   walk-cddr)
    (throw . 		   walk-cdr) 
    (unwind-protect . 	   walk-cdr)))


;;; For clauses that are "special" in the sense that they don't conform to the
;;; keyword-argument syntax of Iterate clauses.

(defvar *special-clause-alist* nil)


;;; These two are for conserving temporaries.  *temps* is a list
;;; of temporaries that have already been created and given bindings.
;;; *temps-in-use* is a list of temporaries that are currently being used.
;;; See with-temporary, with-temporaries.

(defvar *temps*)
(defvar *temps-in-use*)

;;; This is the environment, for macroexpand.

(defvar *env*)

;;; This is a list of information about drivers, for use by the NEXT
;;; mechanism. 

(defvar *driver-info-alist*)

;;; This is used by the PREVIOUS mechanism.

(defvar *previous-vars-alist*)


;;; Loop labels

(defvar *loop-top*)
(defvar *loop-step*)
(defvar *loop-end*)

;;; Whether a label was used, to avoid generating them.  This is so we don't
;;; get a warning from compilers that check for unused tags.

(defvar *loop-step-used?*)
(defvar *loop-end-used?*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(eval-when (compile load eval)

;;; Clause-info structures, which are put in the clause index.
  (defstruct clause-info
    function
    keywords
    req-keywords
    doc-string
    generator?)

;;; Driver-info structures, for information about driver variables--used by
;;; NEXT.

  (defstruct driver-info
    next-code
    generator?
    (used nil))

;;; Previous-info structures, used by the PREVIOUS mechanism.

  (defstruct previous-info
    var
    save-info-list
    code
    (class :step))

  (defstruct save-info
    save-var
    save-vars
    iv-ref)

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Macros.

(eval-when (compile load eval)  ;; Allegro needs this 

(defmacro assertion (test)
  `(if (not ,test) (bug "Assertion ~a failed" ',test)))

(defmacro augment (var stuff)
  `(setf ,var (nconc ,var ,stuff)))

(defmacro prepend (stuff var)
  `(setf ,var (nconc ,stuff ,var)))

) ;end eval-when

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SharpL. 

(eval-when (compile load eval)

(defvar *old-sharpL-func* (get-dispatch-macro-character #\# #\L))

(set-dispatch-macro-character #\# #\L 'sharpL-reader)

(defun sharpL-reader (stream subchar n-args)
  (declare (ignore subchar))
  (let* ((form (read stream t nil t))
	 (bang-vars (sort (bang-vars form) #'< :key #'bang-var-num))
	 (bang-var-nums (mapcar #'bang-var-num bang-vars))
	 (max-bv-num (if bang-vars
			 (reduce #'max bang-var-nums :initial-value 0)
			 0)))
    (cond 
     ((null n-args)
      (setq n-args max-bv-num))
     ((< n-args max-bv-num)
      (error "#L: digit-string ~d specifies too few arguments" n-args)))
    (let* ((bvars (let ((temp nil))
		    (dotimes (i n-args (nreverse temp))
		      (push (make-bang-var (1+ i)) temp))))
	   (args (mapcar #'(lambda (x) (declare (ignore x)) (gensym))
			 bvars))
	   (ignores (set-difference bvars bang-vars))
	   (decl (if ignores `(declare (ignore ,.ignores)) nil))
	   (body (if (list-of-forms? form)
		     (if decl (cons decl form) form)
		     (if decl (list decl form) (list form))))
	   (subbed-body (sublis (pairlis bvars args) body)))
      `#'(lambda ,args ,.subbed-body))))

(defun make-bang-var (n)
  (intern (format nil "!~d" n)))

(defun list-of-forms? (x)
  (and (listp x) (listp (car x))
       (not (eq (caar x) 'lambda))))

(defun bang-vars (form)
  (delete-duplicates (bang-vars-1 form) :test #'eq))

(defun bang-vars-1 (form)
  (cond
   ((symbolp form)
    (if (bang-var? form)
	(list form)
	nil))
   ((atom form)
    nil)
   (t
    (nconc (bang-vars-1 (car form)) (bang-vars-1 (cdr form))))))


(defun bang-var? (sym)
  (char= (char (symbol-name sym) 0) #\!))

(defun bang-var-num (sym)
  (let ((num (read-from-string (subseq (symbol-name sym) 1))))
    (if (not (and (integerp num) (> num 0)))
	(error "#L: ~a is not a valid variable specifier" sym)
	num)))

) ;end eval-when

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; The ITERATE macro.


(defmacro iterate (&body body)
  `(iter ,@body))

(defmacro iter (&body body &environment env)
  (let* ((*env* env)
	 (*result-var* (genvar 'result))
	 (*type-alist* nil)
	 (*declare-variables* *always-declare-variables*)
	 (*bindings* nil)
	 (*internal-variables* nil)
	 (*previous-vars-alist* nil)
	 (*declarations* nil)
	 (*accum-var-alist* nil)
	 (*top-level?* t)
	 (*binding-context?* nil)
	 (*temps* nil)
	 (*temps-in-use* nil)
	 (*driver-info-alist* nil)
	 (*block-name* (if (symbolp (car body))
			   (prog1 (car body) (pop body))
			   nil))
	 (*loop-top* (symbol-append 'loop-top- *block-name*))
	 (*loop-step* (symbol-append 'loop-step- *block-name*))
	 (*loop-end* (symbol-append 'loop-end- *block-name*))
	 (*loop-step-used?* nil)
	 (*loop-end-used?* nil))
    (process-top-level-decls body)
    (multiple-value-bind (body decls init-code steppers final-code final-prot)
	(walk-list body)
      (multiple-value-bind (init step)
	  (insert-previous-code)
	(augment init-code init)
	(augment steppers step)
	(prepend (default-driver-code) body)
	(let ((it-bod `(block ,*block-name*
			 (tagbody ,@init-code
				  ,*loop-top*
				  ,@body
				  ,@(if *loop-step-used?* (list *loop-step*))
				  ,@steppers
				  (go ,*loop-top*)
				  ,@(if *loop-end-used?* (list *loop-end*))
				  ,@final-code)
			 ,(if (member *result-var* *bindings* :key #'car)
			      *result-var*
			      nil))))
	  `(let* ,(nreverse *bindings*)
	     ,@(if *declarations*
		   `((declare ,@*declarations*)))
	     ,@decls
	     ,(if final-prot 
		  `(unwind-protect ,it-bod ,@final-prot)
		  it-bod)))))))
	           

(defmacro defmacro-clause (clause-template &body body)
  (define-clause 'defmacro clause-template body nil))

(defmacro defmacro-driver (clause-template &body body)
  (define-clause 'defmacro clause-template body t))

;;;;;;;;;;;;;;;;

(defun process-top-level-decls (clauses)
  ;; This sets *type-alist* to an alist of (var . type), and
  ;; sets *declare-variables* to t if such a declaration was seen.
  (dolist (clause clauses)
    (when (and (listp clause) (eq (car clause) 'declare))
      (dolist (spec (cdr clause))
	(cond
	 ((eq (first spec) 'declare-variables)
	  (setq *declare-variables* t))
	 ((or (eq (first spec) 'type)  ; We don't do ftypes
	      (member (first spec) standard-type-symbols :test #'eq))
	  (let ((type (first spec))
		(vars (cdr spec)))
	    (if (eq type 'type)
		(setq type (pop vars)))
	    (dolist (var vars)
	      (push (cons var type) *type-alist*)))))))))


(defun default-driver-code ()
  nil)

;(defun default-driver-code ()
;  ;; Collect all non-generator code.
;  ;; [Old version: Collect all code not explicitly invoked with NEXT.]
;  (let ((code nil))
;    ;; Put list in same order as clauses
;    (setq *driver-info-alist* (nreverse *driver-info-alist*)) 
;    (dolist (entry *driver-info-alist*)
;      (let ((di (cdr entry)))
;	(when (not (driver-info-generator? di))
;	  (assert (not (driver-info-used di)))
;	  (augment code (copy-list (driver-info-next-code di))))
;	(if (and (driver-info-generator? di)
;		 (not (driver-info-used di)))
;	    (clause-warning "A generator was never used"))))
;    code))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; The code walker.

(defun walk (form)
  ;; Returns the usual five things; body is a list of forms.
  (cond
   ((atom form)
    (list form))
   ((symbolp (car form))
    (cond
     ((special-form? (car form))
      (walk-special-form form))
     ((macro-function (car form))
      ;; Some compilers (e.g. Lucid on Sparcs) treat macros differently at
      ;; compile-time; macroexpand does not expand them.  We assume that if
      ;; this happens, macroexpand's second value is nil.  
      ;;   What do we do with the form in that case?  This is actually a
      ;; very serious problem: if we don't walk it, we miss things, but if we
      ;; do walk it, we don't know how to walk it.  Right now, we don't walk
      ;; it and print out a warning.
      ;;  --Jeff Siskind says try binding *macroexpand-hook* to #'funcall.
      (multiple-value-bind (ex-form expanded?)
	  (macroexpand form *env*)
	(cond
	 (expanded? (walk ex-form))
	 (t	    (clause-warning "The form ~a is a macro that won't expand.
It will not be walked, which means that Iterate clauses inside it will
not be seen."
				    form)
		    (list form)))))
     ((starts-clause? (symbol-synonym (car form)))
      (process-clause form))
     (t ;; Lisp function call 
      (return-code-modifying-body #'walk-arglist (cdr form)
				  #L(list (cons (car form) !1))))))
   ((lambda-expression? (car form))
    ;; Function call with a lambda in the car
    (multiple-value-bind (bod decs init step final final-prot)
	(walk-fspec (car form))
      (multiple-value-bind (abod adecs ainit astep afinal afinal-prot)
	  (walk-arglist (cdr form))
	(values (list (cons bod abod)) (nconc decs adecs) (nconc init ainit)
		(nconc step astep) (nconc final afinal) 
		(nconc final-prot afinal-prot)))))
   (t
    (clause-error "The form ~a is not a valid Lisp expression" form))))

(defun walk-list (forms)
  (walk-list-nconcing forms #'walk))

(defun walk-arglist (args)
  (let ((*top-level?* nil))
    (walk-list-nconcing args #'walk  #L(if (is-iterate-clause? !1)
					   (list (prognify !2))
					   !2))))

(defun walk-fspec (form)
  ;; Works for lambdas and function specs in flet and labels.
  ;; FORM = (LAMBDA-or-name args . body)
  ;; We only walk at the body.  The args are set up as internal variables.
  ;; Declarations are kept internal to the body.
  (let* ((args (second form))
	 (body (cddr form))
	 (*top-level?* nil)
	 (*binding-context?* t)
	 (*internal-variables* (add-internal-vars args)))
    (multiple-value-bind (bod decs init step final finalp)
	(walk-list body)
      (values `(,(first form) ,args ,@decs ,@bod) nil init step final 
	      finalp))))

(defun walk-list-nconcing (list walk-fn 
				&optional (body-during #L!2))
  (let (body-code decls init-code step-code final-code finalp-code)
    (dolist (form list)
      (multiple-value-bind (body decs init step final finalp)
	  (funcall walk-fn form)
	(augment decls decs)
	(augment init-code init)
	(augment body-code (funcall body-during form body))
	(augment step-code step)
	(augment final-code final)
	(augment finalp-code finalp)))
    (values body-code decls init-code step-code final-code
	    finalp-code)))


(defun return-code-modifying-body (f stuff mod-f)
  (multiple-value-bind (bod decs init step final finalp)
      (funcall f stuff)
    (values (funcall mod-f bod) decs init step final finalp)))


(defun add-internal-var (var)
  ;; VAR can be a symbol or a list (symbol ...).
  (cons (if (listp var) (car var) var) *internal-variables*))

(defun add-internal-vars (vars)
  ;; VARS could be a lambda-list, a list of LET bindings, or just a list of
  ;; variables; all will work.
  (nconc (lambda-list-vars vars) *internal-variables*))

(defun lambda-list-vars (lambda-list)
  ;; Return the variables in the lambda list, omitting keywords, default
  ;; values.
  (mapcan #'(lambda (thing)
	      (cond
	       ((listp thing)
		(if (listp (car thing)) ; this is a full keyword spec
		    (list (second (car thing)))
		    (list (car thing))))
	       ((not (member thing lambda-list-keywords))
		(list thing))))
	  lambda-list))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Special forms.

(defun special-form? (symbol)
  ;; special-form-p doesn't work in Lucid--it returns NIL for let, for
  ;; example.  Plus, we want to catch Iterate special clauses.
  (assoc symbol *special-form-alist*))

(defun walk-special-form (form)
  (let ((*clause* form)
	(func (cdr (assoc (car form) *special-form-alist*))))
    (if (null func)
	(list form)
	(apply func form))))

(defun walk-cdr (first &rest stuff)
  ;; This is for anything where only the car isn't to be walked.
  (return-code-modifying-body #'walk-arglist stuff #L(list (cons first !1))))

(defun walk-cddr (first second &rest stuff)
  ;; This is for anything where the first two elements aren't to be walked.
  (return-code-modifying-body #'walk-arglist stuff
			      #L(list (cons first (cons second !1)))))

(defun walk-progn (progn &rest stuff)
  ;; The only difference between this and walk-cdr is that *top-level* is not
  ;; bound.  This is so macros can return PROGNs of things.  It's exactly like
  ;; the definition of "top-level" in lisp. 
  ;; (Also, just for looks, this returns nil if the progn is empty.)
  (return-code-modifying-body #'walk-list stuff 
			      #L(if (null !1)
				    nil
				    (list (cons progn !1)))))

(defun walk-setq (setq &rest things)
  ;; Walk every other thing.
  (let ((*top-level?* nil)
	(i 1)
	body-code decls init-code step-code final-code finalp-code)
    (dolist (thing things)
      (if (oddp i)
	  (push thing body-code)
	  (multiple-value-bind (body decs init step final finalp)
	      (walk thing)
	    (augment decls decs)
	    (augment init-code init)
	    (push (prognify body) body-code)
	    (augment step-code step)
	    (augment final-code final)
	    (augment finalp-code finalp)))
      (incf i))
    (values (list (cons setq (nreverse body-code)))
	    decls init-code step-code final-code finalp-code)))


(defun walk-function (function form)
  ;; If form is a lambda expression, walk it.
  (if (and (listp form) (eq (car form) 'lambda))
      (return-code-modifying-body #'walk-fspec form #L(list 
						       (list function !1)))
      (list (list function form))))

(defun walk-declare (&rest declaration)
  ;; DECLARE is a declaration, and should be put in the declaration
  ;; section of the loop.  Declarations are only allowed at top-level,
  ;; except that they are allowed within binding environments, in which case
  ;; they apply only to that binding environment.
  #+ symbolics (setq declaration (copy-list declaration))
  (if (or *top-level?* *binding-context?*)
      (return-code :declarations (list declaration)) 
      (clause-error "Declarations must occur at top-level, or inside a
binding context like let or multiple-value-bind.")))

(defun walk-if (if test then &optional else)
  (declare (ignore if))
  (let ((*top-level?* nil))
    (multiple-value-bind (t-body t-decls t-init t-step t-final t-finalp)
	(walk then)
      (multiple-value-bind (e-body e-decls e-init e-step e-final e-finalp)
	  (walk else)
	(setq t-body (prognify t-body))
	(setq e-body (prognify e-body))
	(return-code :declarations (nconc t-decls e-decls)
		     :initial (nconc t-init e-init)
		     :body (if e-body
			       (list `(if ,test
					  ,t-body
					  ,e-body))
			       (list `(if ,test ,t-body)))
		     :step  (nconc t-step e-step)
		     :final (nconc t-final e-final)
		     :final-protected (nconc t-finalp e-finalp))))))

(defun walk-let (let bindings &rest body)
  ;; The bindings or body may contain iterate clauses.
  ;; Important: the decls go inside this let, not at top-level.
  ;; It is an error to use a variable in the let bindings as the
  ;; target of an accumulation (i.e. INTO), because iterate will try
  ;; to make a top-level binding for that variable.  The same goes for
  ;; other variables that might be so bound.
  (let ((*top-level?* nil))
    (multiple-value-bind (binds b-decls b-init b-step b-final b-finalp)
	(walk-let-bindings let bindings)
      (let ((*binding-context?* t)
	    (*internal-variables* (add-internal-vars binds)))
	(multiple-value-bind (bod decls init step final finalp)
	    (walk-list body)
	  (return-code :declarations b-decls
		       :initial (nconc b-init init)
		       :body (list `(,let ,binds ,.decls ,.bod))
		       :step (nconc b-step step)
		       :final (nconc b-final final)
		       :final-protected (nconc b-finalp finalp)))))))

(defun walk-let-bindings (let bindings)
  (if (eq let 'let)
      (walk-list-nconcing bindings #'walk-let-binding #L(list !2))
      (walk-let*-bindings bindings)))


(defun walk-let*-bindings (bindings)
  ;; We have to do this one binding at a time, to get the variable scoping
  ;; right.
  (if (null bindings)
      nil
      (multiple-value-bind (bod decls init step final finalp)
	  (walk-let-binding (car bindings))
	(let ((*internal-variables* (add-internal-var (car bindings))))
	  (multiple-value-bind (bod1 decls1 init1 step1 final1 finalp1)
	      (walk-let*-bindings (cdr bindings))
	    (values (cons bod bod1) (nconc decls decls1) (nconc init init1)
		    (nconc step step1) (nconc final final1)
		    (nconc finalp finalp1)))))))

      
(defun walk-let-binding (binding)
  (if (listp binding)
      (multiple-value-bind (bod decls init step final finalp)
	  (walk (second binding))
	(values (list (first binding) (prognify bod)) decls init step final
		finalp))
      binding))
    
(defun walk-multiple-value-bind (mvb vars expr &rest body)
  ;; Important: decls go inside the mvb, not at top-level.  See
  ;; walk-let for binding subtleties.
  (declare (ignore mvb))
  (let ((*top-level?* nil))
    (multiple-value-bind (ebod edecls einit estep efinal efinalp)
	(walk expr)
      (let ((*binding-context?* t)
	    (*internal-variables* (add-internal-vars vars)))
	(multiple-value-bind (bod decls init step final finalp)
	    (walk-list body)
	  (return-code :declarations edecls
		       :initial (nconc einit init)
		       :body (list `(multiple-value-bind ,vars
					,(prognify ebod)
				      ,.decls ,.bod))
		       :step (nconc estep step)
		       :final (nconc efinal final)
		       :final-protected (nconc efinalp finalp)))))))

(defun walk-flet (flet bindings &rest body)
  ;; For FLET or LABELS.  We don't worry about the function bindings.
  (let ((*top-level?* nil))
    (multiple-value-bind (binds b-decls b-init b-step b-final b-finalp)
	(walk-list-nconcing bindings #'walk-fspec #L(list !2))
      (multiple-value-bind (bod decls init step final finalp)
	  (walk-list body)
	(return-code :declarations b-decls
		     :initial (nconc b-init init)
		     :body (list `(,flet ,binds ,.decls ,.bod))
		     :step (nconc b-step step)
		     :final (nconc b-final final)
		     :final-protected (nconc b-finalp finalp))))))


(defun walk-macrolet (&rest stuff)
  (macrolet-error stuff))

(defun macrolet-error (stuff)
  (declare (ignore stuff))
  (error "Macrolet is not permitted inside Iterate.  (It also should
not be used outside an Iterate form if the defined macro expands into Iterate
clauses, because Iterate will not be aware of its existence.)  Use defmacro
to define a global macro."))


(defun walk-cond (cond &rest stuff)
  ;; Because allegro compiler insists on treating COND as a special form.
  (declare (ignore cond))
  (if (null stuff)
      nil
      (let* ((first-clause (first stuff))
	     (test (if (not (listp first-clause))
		       (error "cond clause ~a is not a list" first-clause)
		       (car first-clause)))
	     (thens (cdr first-clause))
	     (if-form (if (null thens)
			  (let ((var (gensym)))
			    `(let ((,var ,test))
			      (if ,var ,var (cond ,@(cdr stuff)))))
			  `(if ,test (progn ,@thens) (cond ,@(cdr stuff))))))
	(walk if-form))))
			    


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Processing Iterate clauses.

(defvar *initial*)
(defvar *decls*)
(defvar *step*)
(defvar *final*)
(defvar *finalp*)

(defun process-clause (clause)
  ;; This should observe the invariant that the forms it returns are
  ;; already copied from the original code, hence nconc-able.  
  (let ((*clause* clause)
	(special-func (assoc (car clause) *special-clause-alist*)))
    (if special-func
	(apply-clause-function (car clause) (cdr clause))
	(let* ((ppclause (preprocess-clause clause))
	       (info (get-clause-info ppclause)))
	  (cond
	   (info
	    (arg-check ppclause info)
	    (let ((args (cons (keywordize (first ppclause))
			      (cdr ppclause)))
		  (func (clause-info-function info)))
	      (if (macro-function func)
		  (walk (macroexpand (cons func args)))
		  (apply-clause-function func args))))
	   (t
	    (clause-error "No iterate function for this clause; do ~
               (display-iterate-clauses) to~%see the existing clauses.")))))))

(defun apply-clause-function (func args)
  (let ((*initial* nil)
	(*decls* nil)
	(*step* nil)
	(*final* nil)
	(*finalp* nil))
    (multiple-value-bind (body decls init step final finalp)
	(apply func args)
      (values body 
	      (nconc *decls* decls)  
	      (nconc *initial* init)
	      (nconc *step* step)
	      (nconc *final* final)
	      (nconc *finalp* finalp)))))
  
(defun preprocess-clause (clause)
  ;; First, check for errors.
  ;; Then, turn every other symbol except the first into a keyword,
  ;; and replace synonyms occurring as the first keyword.
  (do ((cl clause (cddr cl)))
      ((null cl))
    (if (not (symbolp (car cl)))
	(clause-error "~a should be a symbol" (car cl)))
    (if (null (cdr cl))
	(clause-error "missing value for ~a keyword" (car cl))))
  (let ((new-clause nil)
	(syn (symbol-synonym (first clause))))
    (do ((cl (cddr clause) (cddr cl)))
	((null cl))
      (push (keywordize (first cl)) new-clause)
      (push (second cl) new-clause))
    ;; Hack so that (generate ...) turns into (for ... :generate t)
    (if (eq syn 'generate)
	`(for ,(second clause) ,@(nreverse new-clause) :generate t)
	`(,syn ,(second clause) ,@(nreverse new-clause)))))


(defun symbol-synonym (symbol)
  (or (get symbol 'synonym) symbol))


(eval-when (compile load eval)

(defun listify (x)
  (if (listp x) x (list x)))

(defun keywordize (symbol)
  (intern (symbol-name symbol) 'keyword))

);end eval-when

(defun arg-check (clause info)
  ;; Make sure that each keyword in clause is in info.
  (let ((keywords (clause-info-keywords info)))
    (do ((cl clause (cddr cl)))
	((null cl))
      (if (null (cdr cl))
	  (clause-error "Missing a value for ~a" (car cl)))
      (if (not (member (car cl) keywords :test #'eq))
	  (if (eq (car cl) :generate)
	      (if (not (clause-info-generator? info))
		  (clause-error "Clause cannot be used as a generator"))
	      (clause-error "Unknown keyword ~a" (car cl)))))))

(defun walk-expr (expr)
  ;; This isn't used by the code walker itself, but is useful for clauses that
  ;; need to walk parts of themselves.  It always returns a single expression.
  ;; The other parts are collected using globals and returned by
  ;; process-clause. 
  (multiple-value-bind (body decls init step final finalp)
      (walk expr)
    (augment *decls* decls)
    (augment *initial* init)
    (augment *step* step)
    (augment *final* final)
    (augment *finalp* finalp)
    (prognify body)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Displaying clauses.

(defun display-iterate-clauses (&optional clause-spec)
  (fresh-line)
  (if (and clause-spec (symbolp clause-spec))
      (setq clause-spec (list clause-spec)))
  (if (member '&optional clause-spec)
      (error "Iterate: clause-spec cannot mention optional keywords"))
  (if clause-spec
      (setq clause-spec (cons (car clause-spec)
			      (mapcar #'keywordize (cdr clause-spec)))))
  (dolist (spec-entry *special-clause-alist*)
    (let ((spec-clause-kws (list (car spec-entry))))
      (if (clause-matches? clause-spec spec-clause-kws)
	  (display-clause spec-clause-kws (cdr spec-entry)))))
  (disp-std-clauses clause-spec *clause-info-index*)
  t)

(defun disp-std-clauses (clause-spec index)
  (if (index? index)
      (dolist (entry (cdr index))
	(disp-std-clauses clause-spec (cdr entry)))
      (if (clause-matches? clause-spec (clause-info-keywords index))
	  (display-clause (clause-info-keywords index)
			  (clause-info-doc-string index)))))
  
(defun display-clause (kws doc-string)
  (display-kws kws)
  (if doc-string
      (format t "~25,4t ~a~%" doc-string)
      (terpri)))


(defconstant fill-col 77)

(defun display-kws (kws)
  (do* ((col 1)
	(kw-list kws (cdr kw-list))
	(kw (car kw-list) (car kw-list)))
      ((null kw-list))
    (let ((len (length (symbol-name kw))))
      (when (>= (+ col len) fill-col)
	(format t "~%~4t")
	(setq col 4))
      (if (= col 1) ; the first one--print package name
	  (format t "~s" kw)
	  (format t "~a" kw))
      (incf col len)
      (when (cdr kw-list) 
	(cond
	 ((>= (+ col 1) fill-col)
	  (format t "~%~4t")
	  (setq col 4))
	 (t
	  (format t " ")
	  (incf col)))))))
      

(defun clause-matches? (clause-spec kws)
  (or (null clause-spec)
      (every #'eq clause-spec kws)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Indexing of clause functions.

;;; Each clause has one or more required keywords, which must
;;; appear in order, and zero or more optional keywords, which may be
;;; omitted and may appear in any order.   

;;; The first word of a clause, though used as a keyword when the
;;; clause function is called, is kept in its original package for
;;; indexing purposes.  This provides iterate's interface with the
;;; package system.

;;; Two clauses can be ambiguous when 1) they have the same list of required
;;; keywords, or 2) #1's required-list is a prefix of #2's and #1 has optional
;;; keywords which match the remaining keywords of #2's required-list.  We
;;; check for these situations and signal an error.

;;; Indexing scheme: basically a discrimination tree.  There is a tree
;;; of alists with root *clause-info-index*.

(defun get-clause-info (clause &optional (index *clause-info-index*))
  (let ((entry (cdr (index-lookup (car clause) index))))
    (if (index? entry)
	(let ((result (get-clause-info (cddr clause) entry)))
	  ;; It could be that the required part of the clause ends here.
	  (or result (get-clause-info nil entry)))
	entry)))
      

(defun is-iterate-clause? (form)
  (and (listp form)
       (symbolp (car form))
       (starts-clause? (car form))))


(defun starts-clause? (symbol)
  ;; A symbol starts a clause if it appears in the top-level index, or if it
  ;; is in the special-clause alist, or if it is GENERATE.
  ;;   This is used to distinguish the case where there's a lisp form
  ;; (in which case the symbol doesn't start a clause), versus the
  ;; situation where an erroneous clause is provided.
  (or (assoc symbol *special-clause-alist*)
      (index-lookup symbol *clause-info-index*)
      (eq symbol 'generate)))

;;; The code generated by DEFINE-CLAUSE (below) is the only code that the
;;; invokes this.

(eval-when (compile load eval)

(defun install-clause-info (req-keywords keywords function doc-string 
			    generator?)
  (install-clause-info-1 req-keywords *clause-info-index* 
			 (make-clause-info :function function
					   :keywords keywords
					   :req-keywords req-keywords
					   :doc-string doc-string
					   :generator? generator?)))


(defun install-clause-info-1 (keywords index info)  
  ;; Here, KEYWORDS is a list of the required keywords.
  ;; The basic rule here is to build indices all the way out to the
  ;; end of the list of keywords.  That way it will be necessary for
  ;; the user's clause to contain all of the required keywords.
  ;;   If index contains no entry for the first keyword, build a full
  ;; set of indices and put it in index.  
  ;;   If there is an entry and it's an index, call recursively.
  ;;   If there's an entry and it's not an index, then we have a case of
  ;; duplication or prefix.  If duplication, we replace and warn; if
  ;; prefix, we check for ambiguity, and if so, error.
  (if (null keywords)
      (ambiguity-check-index info index))
  (let ((entry (index-lookup (car keywords) index)))
    (cond
     ((null entry)
      (index-add (car keywords) (build-index (cdr keywords) info) index))
     ((index? (cdr entry))
      (install-clause-info-1 (cdr keywords) (cdr entry) info))
     ((clause-info-p (cdr entry))
      (cond
       ((null (cdr keywords))
	;; Duplication; warn if they are not completely identical.
	(if (not (equal (clause-info-keywords (cdr entry))
			(clause-info-keywords info)))
	    (format *error-output* 
		    "~&Warning: replacing clause ~a~%with ~a~%"
		    (clause-info-keywords (cdr entry))
		    (clause-info-keywords info)))
	(setf (cdr entry) info))
       (t
	(ambiguity-check-clause (cdr entry) info 2)
	;; Replace this entry with an index.
	(let ((index2 (build-index (cdr keywords) info)))
	  (index-add nil (cdr entry) index2)
	  (setf (cdr entry) index2)))))
     (t
      (bug "install-clause-info-1: index is broken")))))
	

(defun build-index (keywords info)
  (if (null keywords)
      info
      `(:index (,(car keywords) . ,(build-index (cdr keywords) info)))))
		 
(defun index? (x)
  (and (listp x) (eq (car x) :index)))

(defun index-add (key thing index)
  (push (cons key thing) (cdr index)))

(defun index-lookup (item index)
  (assoc item (cdr index) :test #'eq))

(defun ambiguity-check-index (ci1 index)
  ;; We're trying to add CI1, and we have to check it against all the things
  ;; in INDEX.
  (dolist (entry (cdr index))
    (if (clause-info-p (cdr entry))
	(ambiguity-check-clause ci1 (cdr entry) 1)
	(ambiguity-check-index ci1 (cdr entry)))))

(defun ambiguity-check-clause (ci1 ci2 insert-n)
  ;; It is known that the required keywords of CI1 are a prefix of those
  ;; of CI2, and that we are trying to add INSERT-N (1 or 2).
  (if (ambiguous-clauses? ci1 ci2)
      (let ((kw1 (clause-info-keywords ci1))
	    (kw2 (clause-info-keywords ci2)))
	(if (= insert-n 2)
	    (rotatef kw1 kw2))
	(error "Iterate: Inserting clause ~a would create
an ambiguity with clause ~a" 
	       kw1 kw2))))


(defun ambiguous-clauses? (ci1 ci2)
  ;; rk1 is a prefix of rk2
  (let* ((rk1 (clause-info-req-keywords ci1))
	 (rk2 (clause-info-req-keywords ci2))
	 (rest-rk2 (nthcdr (length rk1) rk2))
	 (ok1 (cdr (member '&optional (clause-info-keywords ci1)))))
    (if (null rest-rk2)
	nil     ; Don't consider identical clauses ambiguous--that will be
		; handled elsewhere.
	(dolist (k2 rest-rk2 t)
	  (if (not (member k2 ok1))
	      (return nil))))))

	  
	  
) ;end eval-when


(defun display-index (&optional (index *clause-info-index*) (indent 0))
  ;; for debugging
  (if (not (index? index))
      (format t "~vt~a~%" indent (clause-info-keywords index))
      (dolist (entry (cdr index))
	(format t "~vt~a:~%" indent (car entry))
	(display-index (cdr entry) (+ indent 2)))))

(defun remove-clause (clause-keywords)
  ;; CLAUSE-KEYWORDS is a list that (once the symbols have been
  ;; keywordized) should be equal to some clause in the index.
 (let* ((all-keywords (mapcar #L(if (eq !1 '&optional) !1 (keywordize !1))
			      clause-keywords))
	(req-keywords (cons (car clause-keywords)
			    (cdr (ldiff all-keywords (member `&optional
							     all-keywords))))))
   (labels ((remove-clause-internal (keywords index)
	      (if (null keywords)
		  (error "clause ~a not found" clause-keywords)
		  (let ((entry (index-lookup (car keywords) index)))
		    (cond
		     ((null entry)
		      (error "clause ~a not found" clause-keywords))
		     ((clause-info-p (cdr entry))
		      (if (equal all-keywords 
				 (clause-info-keywords (cdr entry)))
			  (delete entry index)))
		     (t ;; an index
		      (remove-clause-internal (cdr keywords) (cdr entry))
		      ;; if the index is empty, delete it too
		      (if (null (cddr entry))
			  (delete entry index))))))))
     (remove-clause-internal req-keywords *clause-info-index*))
   t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Macros and useful functions for defining new iterate clauses.

(defmacro defclause (clause-template &body body)
  (define-clause 'defun clause-template body nil))

(defmacro defclause-driver (clause-template &body body)
  (define-clause 'defun clause-template body t))


;  ;; This duplicates body, which is annoying but not serious.
;  (let* ((gen-clause-template (cons 'generate (cdr clause-template)))
;	 (for-body `((let ((generator? nil)) ,@body)))
;	 (gen-body `((let ((generator? t)) ,@body))))
;    (define-clause 'defun clause-template for-body)
;    (define-clause 'defun gen-clause-template gen-body)))

(eval-when (compile load eval)

(defconstant sequence-keyword-list
  '(:FROM from :UPFROM upfrom :DOWNFROM downfrom :TO to :DOWNTO downto
    :ABOVE above :BELOW below :BY (by 1) :WITH-INDEX with-index))

(defun define-clause (define-form clause-template body generator?)
  ;; CLAUSE-TEMPLATE is of the form 
  ;;  (<sym1> <spec1> ... [&optional <symk> <speck> ...] [&sequence])
  ;; The <sym> forms must be symbols (in any package); they are the
  ;; keywords for the clause. The <spec> forms are to be bound to the
  ;; values of those keywords when the clause is processed; such a
  ;; form can be either a symbol, a list (symbol initform), or a list
  ;; (symbol initform svar).  These are processed exactly as if they
  ;; were keyword specifiers.  To be precise, a pair of keyword and
  ;; value-form behaves exactly like the keyword specification
  ;; ((:keyword var) initform svar). 
  ;;   If the special symbol &sequence occurs, it must be the last
  ;; form.  It is equivalent to specifying all the sequence optional
  ;; symbols (FROM, TO, etc.), with specs of the same name (i.e. the
  ;; variable bound to the FROM keyword is "from", etc.).  There are
  ;; no defaults except that BY defaults to 1.
  ;;   The BODY is just an ordinary lisp body; it will refer to the 
  ;; value-forms in the clause template.  It should use return-code to
  ;; return the appropriate arguments.
  (if (null clause-template)
      (error "Iterate: empty clause template with body ~a" body))
  (flet ((make-keyword-spec (kw val)
           (if (symbolp val)
	       `((,kw ,val))
	       `((,kw ,(car val)) ,@(cdr val)))))
    (let ((last (car (last clause-template))))
      (if (and (symbolp last) (string= last "&SEQUENCE"))
	  (setq clause-template 
		(nconc (butlast clause-template)
		       (if (member '&optional clause-template)
			   sequence-keyword-list
			   (cons '&optional sequence-keyword-list))))))
    (multiple-value-bind (rkws rvals okws ovals) 
	(split-clause-template clause-template)
      (let* ((req-keywords (mapcar #'keywordize rkws))
	     (req-kws-but-first (cons (car clause-template)
				      (cdr req-keywords)))
	     (opt-keywords (mapcar #'keywordize okws))
	     (keywords&opt (if opt-keywords
			       (append req-kws-but-first
				       '(&optional) opt-keywords)
			       req-kws-but-first))
	     (rkw-specs (mapcar #'make-keyword-spec req-keywords rvals))
	     (okw-specs (mapcar #'make-keyword-spec opt-keywords ovals))
	     (func-name (make-function-name rkws))
	     (doc-string (if (stringp (car body))
			     (car body)
			     nil))
	     (all-keywords (append req-keywords opt-keywords))
	     (arglist `(&key ,@rkw-specs ,@okw-specs)))
	(if (contains-duplicates? all-keywords)
	    (error "While defining ~a: keyword list contains duplicates"
		   clause-template))
	(if generator?
	    (augment arglist (list 'generate)))
	;; Actually define a named function, instead of using an
	;; anonymous lambda, to ensure that it gets compiled.  A
	;; compiler should compile a sharp-quoted lambda, but the
	;; Symbolics one doesn't.  Also, use the original first symbol
	;; of the clause for indexing.  This provides the following behavior
	;; re the package system: the first symbol of the user's clause
	;; must be eq to (hence in the same package as) the first symbol of
	;; the defined clause; but the packages of the other symbols don't
	;; matter.
	`(eval-when (compile load eval)
	   (,define-form ,func-name ,arglist ,@body)
	   (install-clause-info ',req-kws-but-first
				',keywords&opt 
				',func-name
				,doc-string
				,generator?)
	   ',clause-template)))))

(defun make-function-name (req-syms)
  (let ((req-string "CLAUSE-"))
    (dolist (sym req-syms)
      (setq req-string (concatenate 'string req-string (symbol-name sym) "-")))
    (gentemp req-string)))

(defun split-clause-template (ct)
  ;; Splits template into required keywords, optional keywords and
  ;; values. 
  (let* ((opt&-list (member '&optional ct))
	 (req-list (ldiff ct opt&-list))
	 (opt-list (cdr opt&-list)))
    (if (zerop (length req-list))
	(error "DEFCLAUSE: template ~a has no required part" ct))
    (if (oddp (length req-list))
	(error "DEFCLAUSE: required part of template ~a is of odd length" ct))
    (if (oddp (length opt-list))
	(error "DEFCLAUSE: optional part of template ~a is of odd length" ct))
    (multiple-value-bind (rkws rvals)
	(split-list-odd-even req-list)
      (multiple-value-bind (okws ovals)
	  (split-list-odd-even opt-list)
	(values rkws rvals okws ovals)))))
	

(defun split-list-odd-even (list)
  ;; Splits list into odd- and even-numbered elements, returns
  ;; the odds and evens as two values.
  (do ((lis list (cddr lis))
       (odds nil)
       (evens nil))
      ((null lis) (values (nreverse odds) (nreverse evens)))
    (push (car lis) odds)
    (push (cadr lis) evens)))

(defun contains-duplicates? (list)
  (not (equal list (remove-duplicates list))))

); end eval-when



(defmacro defsynonym (syn word)
  ;; Makes SYN a synonym for the existing iterate keyword WORD.
  `(eval-when (compile load eval)
     (setf (get ',syn 'synonym) ',word)))



(defmacro defclause-sequence (element-name index-name 
			      &key access-fn size-fn
			      element-type sequence-type
			      element-doc-string index-doc-string)
  ;; A simple way to define simple sequence clauses.
  ;; Package subtlety: the FOR should be in the same package as the
  ;; element-name or index-name.
  (let* ((seq-for (if element-name 
		      (intern "FOR" (symbol-package element-name))))
	 (seq-def (if element-name
		      `(defclause-driver (,seq-for var ,element-name seq 
						   &sequence)
			 ,element-doc-string
			 (return-sequence-code 
			  :element-var   var
			  :sequence      seq
			  :access-fn   ,access-fn
			  :size-fn     ,size-fn
			  :element-type  ,element-type
			  :sequence-type ,sequence-type))))
	 (inx-for (if index-name
		      (intern "FOR" (symbol-package index-name))))
	 (inx-def (if index-name
		      `(defclause-driver (,inx-for var ,index-name seq 
						   &sequence)
			 ,index-doc-string
			 (cond 
			  (with-index
			   (clause-error "WITH-INDEX keyword should not ~
                                         be specified for this clause"))
			  (t
			   (setq with-index var)
			   (return-sequence-code
			    :sequence seq
			    :size-fn ,size-fn
			    :sequence-type ,sequence-type)))))))
    `(progn ,seq-def ,inx-def)))
			     
(defun if-1st-time (then &optional else first-time-var)
  ;; Returns 1: a form which evaluates THEN the first time through the
  ;; loop, ELSE subsequent times; 2: the variable that keeps track of
  ;; the first time.
  (let* ((var (or first-time-var 
		  (make-var-and-binding 'first-time t :type 'symbol)))
	 (code (if else
		   `(cond
		     (,var
		      (setq ,var nil)
		      ,@then)
		     (t
		      ,@else))
		   `(when ,var 
		      (setq ,var nil)
		      ,@then))))
    (values code var)))

(defmacro with-temporary (var &body body)
  (let ((old-var (gensym))
	(vars (listify var)))
    `(let ((,old-var *temps-in-use*))
       (unwind-protect
	   (let ,(mapcar #L`(,!1 (get-free-temp))
			 vars)
	     ,@body)
	 (setq *temps-in-use* ,old-var)))))

(defmacro with-temporaries (n vlist &body body)
  (let ((old-var (gensym)))
    `(let ((,old-var *temps-in-use*))
       (unwind-protect
	   (let ((,vlist (let ((ts nil)) 
			   (dotimes (i ,n) 
			     (push (get-free-temp) ts))
			   ts)))
	      ,@body)
	 (setq *temps-in-use* ,old-var)))))

(defun get-free-temp ()
  (let ((temp (some #L(if (not (member !1 *temps-in-use*)) !1)
		    *temps*)))
    (when (null temp)
      (setq temp (make-var-and-default-binding 'temp))
      (push temp *temps*))
    (push temp *temps-in-use*)
    temp))



;;;;;;;;;;;;;;;;
;;; Typing.

(defun var-type (var)
  (if (the-expression? var)
      (second var)
      (var-declaration var)))

(defun var-declaration (var)
  (cdr (assoc var *type-alist* :test #'eq)))

(defun expr-type-only (expr)
  ;; If expr is self-evaluating, return its type (using type-of);
  ;; if expr is of the form (the <type> <form>), return <type>; 
  ;; else, return nil.
  (cond 
   ((self-evaluating? expr)
    (type-of expr))
   ((the-expression? expr)
    (second expr))
   (t nil)))

(defun expression-type (form)
  (if (symbolp form)
      (var-type form)
      (expr-type-only form)))

(defun quoted? (x)
  ;; Returns T iff x is of the form (quote ...)
  (and (listp x) (eq (car x) 'quote)))

(defun function-quoted? (x)
  ;; Returns T iff x is of the form (function ...) [same as #'(...)]
  (and (listp x) (eq (car x) 'function)))

(defun lambda-expression? (x)
  (and (listp x) (eq (car x) 'lambda)))

(defun the-expression? (x)
  (and (listp x) (eq (first x) 'the)))

(defun self-evaluating? (x)
  ;; See CLM, Sec. 5.1.1.
  ;; This differs from constantp in that it returns nil for quoted
  ;; things and defconstants.
  (or (null x) (numberp x) (characterp x) (stringp x) 
      (bit-vector-p x) (keywordp x)))

(defun constant? (x)
  ;; This differs from constantp in that it doesn't acknowledge
  ;; defconstants to be constants; the problem with so acknowledging
  ;; them is that the run-time and compile-time environments may
  ;; differ.  The things constant? returns T for are really and truly
  ;; constant everywhere.
  (or (self-evaluating? x) (quoted? x) (function-quoted? x)
      (eq x t)))

(defun duplicable? (x)
  ;; Returns T if X can be copied in code.  This returns T for symbols, on the
  ;; assumption that the copies are close enough to each other so that
  ;; updating the variable cannot occur.
  (or (numberp x) (symbolp x) (characterp x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Variable specifiers.  They're either a symbol, or a the-expression
;;; constaining a symbol.

(defun var-spec? (x)
  (or (the-expression? x) (symbolp x)))

(defun extract-var (var-spec)
  (if (the-expression? var-spec)
      (third var-spec)
      var-spec))

;;; Possible extension:
;;; When more than one variable can occur, we allow a single
;;; the-expression to cover them all.  Unfortunately, this makes
;;; things rather hairy--probably better to avoid it.

;(defun distribute-type-spec (x)
;  (if (and (the-expression? x) (not (symbolp (third x))))
;      (let ((type (second x))
;	    (vars (third x)))
;	(mapcar #'(lambda (v) `(the ,type ,v)) vars))
;      x))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Binding and destructuring.

(defun make-binding (var value &key type using-type-of)
  ;; This creates a binding of VAR to VALUE.  TYPE means declare VAR
  ;; to be of that type if it isn't declared to be a type already.
  ;; (But do so only when declare-variables has been declared.)
  ;; USING-TYPE-OF means to use the type of that form, if any.  
  ;; Specifying both keyword args is an error.
  ;;   It is okay to pass nil for VAR; in this case, nothing will
  ;; happen and nil will be returned.  This is done just to simplify
  ;; coding of clauses.
  (make-binding-internal var value t type using-type-of))

(defun make-default-binding (var &key type using-type-of)
  ;; This makes a random binding of VAR (i.e. you should not depend on
  ;; the binding's value).  It will observe TYPE and USING-TYPE-OF in
  ;; choosing a value to bind to (see the comment for make-binding).
  ;;   It is okay to pass nil for VAR; in this case, nothing will
  ;; happen and nil will be returned.  This is done just to simplify
  ;; coding of clauses.
  (make-binding-internal var nil nil type using-type-of))

(defun make-var-and-binding (string value &key type using-type-of)
  (let ((var (genvar string)))
    (make-binding-internal var value t type using-type-of)
    var))

(defun make-var-and-default-binding (string &key type using-type-of)
  (let ((var (genvar string)))
    (make-binding-internal var nil nil type using-type-of)
    var))

(defun make-accum-var-binding (var value kind &key type using-type-of)
  (make-accum-var-binding-internal var value t kind type using-type-of))

(defun make-accum-var-default-binding (var kind &key type using-type-of)
  (make-accum-var-binding-internal var nil nil kind type using-type-of))

(defun make-accum-var-binding-internal (var value value-supplied?
					kind type using-type-of)
  ;; Possibly creates a binding for an accumulation variable, like
  ;; those generated by COLLECT, MAXIMIZE, COUNT, etc.  
  ;; It checks *accum-var-alist* to see if the variable already exists.
  ;; If so, and it is of the right kind, it does not create a new
  ;; binding.  If it is of the wrong kind, an error is signalled.  If kind is
  ;; NIL, then we don't do this error check.  However, we aways check to make
  ;; sure the initial value, if supplied, is correct.
  ;;    In all cases, *internal-variables* is checked to make sure the
  ;; variable does not occur there.
  ;;    The alist entry is returned.  It can be used to store
  ;; additional info, like the end-pointer for collections.
  (let ((entry (assoc var *accum-var-alist* :test #'eq)))
    (cond
     ((null entry)
      (if value-supplied?
	  (make-binding var value :type type :using-type-of using-type-of)
	  (make-default-binding var :type type :using-type-of using-type-of))
      (setq entry (list var kind))
      (push entry *accum-var-alist*)
      entry)
     ((and kind (second entry) (not (eq (second entry) kind)))
      (clause-error "Attempt to do ~a accumulation into a variable ~
                     already being used~%for ~a accumulation."
		    kind (second entry)))
     (t
      (if value-supplied?
	  (let ((orig-value  (second (assoc var *bindings*))))
	    (if (not (equal value orig-value))
		(clause-error "Initial values ~a and ~a are not equal ~
for variable ~a" 
			      orig-value value var))))
      (check-internal-variables var)
      entry))))



(defun make-binding-internal (var-spec value value-supplied? 
				       use-type using-type-of)
  ;; This returns T if it actually created a binding, else NIL.
  ;; Declaration and typing rules: first of all, no declaration is
  ;; generated unless *declare-variables* is T and var doesn't already
  ;; have a type declaration.  If there is no type for var, we infer
  ;; it as best we can as follows: if use-type is supplied, we use
  ;; that type.  If using-type-of is supplied, we try to determine a
  ;; type for that variable or expression (see expression-type) and
  ;; use that if we find it.  (It is erroneous to supply both use-type
  ;; and using-type-of.)  If neither is supplied, we DO NOT try to
  ;; infer the type of value--we just give up.  Otherwise, someone who
  ;; innocently did (make-binding 'foo nil) would discover that the
  ;; resulting code, if iterate-declare-variables was used, would 
  ;; have foo declared to be of type symbol (since, in Lucid at least,
  ;; (type-of nil) == symbol).  Note that we do not check for a type
  ;; conflict between a supplied type and the existing type; the
  ;; existing type just wins.
  ;;   The var can actually be of the form (the <type> var).
  (let ((var (extract-var var-spec)))
    (cond
     ((null var-spec)
      nil)
     ((not (symbolp var))
      (clause-error "The variable ~a is not a symbol" var))
     (t
      (let* ((existing-type (var-type var-spec))
	     (declared? (var-declaration var))
	     (type (or existing-type
		       use-type
		       (if using-type-of (expression-type using-type-of)))))
	(if (or declared? (and *declare-variables* type))
	    ;; We only have to be concerned about getting value to be
	    ;; the right type if there will actually be a declaration
	    ;; for var.  This will be either when there is an existing
	    ;; declaration, or when *declare-variables* is true and
	    ;; there is some type.
	    (setq value (make-initial-value value value-supplied? type)))
	(if (and (not declared?) *declare-variables* type)
	    (push `(type ,type ,var) *declarations*))
	(add-binding var value)
      t)))))



(defun make-initial-value (value value-supplied? type)
  ;; This should really be done by trying to coerce, then trapping the error,
  ;; because the subtype checks aren't really right--nil, for instance, is a
  ;; subtype of anything, but you can't coerce anything to it.  (Sure, we
  ;; check for nil explicitly, but there are other things like it.)  Yet if we
  ;; omit the subtype tests currently, how will we know that we can convert
  ;; nil to a vector?
  (cond
   ((null type)
    value)
   (value-supplied?
    (if (self-evaluating? value)
	(coerce value type)
	`(the ,type ,value)))
   ((or (subtypep 'number type) (subtypep type 'number))
    (coerce 0 type))
   ((or (subtypep 'sequence type) (subtypep 'symbol type)
	(subtypep type 'sequence) (subtypep type 'symbol))
    (coerce nil type))
   ((subtypep type 'character)
    (coerce
      #-GCL #\null
      #+GCL #\ 					;MES 2/4/97
      type))
   (t 
    (clause-warning 
     "Cannot supply an initial value for type ~a; using NIL."
     type)
    nil)))

(defun add-binding (var value)
  (cond
   ((var-binding var)
    (clause-error "Duplicate variable: ~a" var))
   (t
    (check-internal-variables var)
    (push (list var value) *bindings*))))

(defun check-internal-variables (var)
  (if (internal-variable? var)
      (clause-error 
       "The variable ~a, which iterate would like to bind, already has a
binding in a context internal to the iterate form.  Give the variable
another name." var)))

(defun internal-variable? (var)
  (member var *internal-variables* :test #'eq))

;  (some #L(if (symbolp !1) 
;	      (eq var !1) 
;	      (member var !1 :test #'eq))
;	*internal-variables*))

(defun var-binding (var)
  (car (member var *bindings* :test #'eq :key #'car)))



;;;;;;;;;;;;;;;;;;
;;; Destructuring.

;;; Where destructuring happens:
;;;  WITH (bind)
;;;  FOR...INIT...THEN (setq)
;;;  FOR...FIRST...THEN (setq)
;;;  FOR...= (setq)
;;;  FOR...IN-FILE (setq)
;;;  FOR...IN-STREAM (setq)
;;;  FOR...IN-HASHTABLE (setq)
;;;  element-var of sequence & list drivers (setq)


(defun make-destructuring-bindings (template value 
				    &key type using-type-of)
  (cond
   ((null template)
    (clause-error "Can't bind to NIL: ~a" value))
   ((var-spec? template)
    (make-binding template value :type type :using-type-of using-type-of))
   ((not (listp template))
    (clause-error "Invalid binding form: ~a" template))
   ((eq (car template) 'values)
    (clause-error "Cannot perform multiple-value destructuring in ~
                   this context"))
   (t
    (let ((var (make-var-and-binding 'temp value)))
      (push var *temps*)  ; so that others can benefit
      (do-destructuring-bindings template var)))))


(defun do-destructuring-bindings (template value)
  (cond
   ((null template)
    nil)
   ((var-spec? template)
    (make-binding template value)
    nil)
   ((not (listp template))
    (clause-error "Invalid binding form: ~a" template))
   ((eq (car template) 'values)
    (clause-error "Multiple-value destructuring cannot be nested"))
   (t
    (nconc (do-destructuring-bindings (car template) `(car ,value))
	   (do-destructuring-bindings (cdr template) `(cdr ,value))))))

(defun extract-vars (template)
  ;; Like extract-var, but will work with a destructuring template as well.
  ;; Returns a list of variables.
  (cond
   ((null template)
    nil)
   ((var-spec? template)
    (list (extract-var template)))
   ((not (listp template))
    (clause-error "Invalid binding form: ~a" template))
   ((eq (car template) 'values)
    (mapcan #'extract-vars (cdr template)))
   (t
    (nconc (extract-vars (car template))
	   (extract-vars (cdr template))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Dsetq.

(defmacro dsetq (template value)
  ;; This macro can be used outside an Iterate form. 
  ;; The semantics are that if you say (DSETQ (A B) A), then b will get its
  ;; value from the original A.
  (do-dsetq template value nil))

  
(defun do-dsetq (template value &optional (bindings? t) type)
  (cond
   ((null template)
    (dsetq-error "Can't bind to nil"))
   ((symbolp template)
    (if bindings?
	(make-default-binding template :type type))
    `(setq ,template ,value))
   ((and (listp template) (eq (car template) 'values))
    ;; Just do a simple check for the most common errors.  There's no way we
    ;; can catch all problems.
    (if (or (atom value) (member (car value) '(car cdr cdar caar aref get)))
	(dsetq-error "Multiple values make no sense for this expression" )
	(make-mv-dsetqs (cdr template) value bindings?)))
   (t
    (let ((temp (gensym)))
      `(let ((,temp ,value))
	 ,.(if type `((declare (type ,type ,temp))))
	 ,.(make-dsetqs template temp bindings?)
	 ,temp)))))

(defun make-dsetqs (template value bindings?)
  (cond 
   ((null template)
    nil)
   ((var-spec? template)
    (if bindings?
	(make-default-binding template))
    `((setq ,(extract-var template) ,value)))
   ((not (listp template))
    (dsetq-error "Invalid binding form: ~a" template))
   ((eq (car template) 'values)
    (error "Multiple-value destructuring cannot be nested"))
   (t
    (nconc (make-dsetqs (car template) `(car ,value) bindings?)
	   (make-dsetqs (cdr template) `(cdr ,value) bindings?)))))

(defun make-mv-dsetqs (templates value bindings?)
  (let ((temps nil)
	(vars nil)
	(tplates nil))
    (dolist (tp templates)
      (cond
       ((var-spec? tp)
	(push nil tplates)
	(push nil temps)
	(push (extract-var tp) vars)
	(if bindings?
	    (make-default-binding tp)))
       (t
	(let ((temp (gensym)))
	  (push tp tplates)
	  (push temp temps)
	  (push temp vars)))))
    (setq temps (nreverse temps))
    (setq vars (nreverse vars))
    (setq tplates (nreverse tplates))
    (let ((mv-setq `(multiple-value-setq ,vars ,value)))
      (if (every #'null temps)
	  mv-setq
	  `(let ,(delete nil temps)
	     ,mv-setq
	     ,.(mapcan #L(make-dsetqs !1 !2 bindings?)
		       tplates temps)
	     ,(car vars))))))

(defun dsetq-error (format-string &rest args)
  (if (in-iterate?)
      (apply #'clause-error format-string args)
      (apply #'error (concatenate 'string "Dsetq: " format-string) args)))

(defun in-iterate? ()
  (boundp '*result-var*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Free variables; checking for local bindings.

(defun local-binding-check (form)
  (let ((vars (remove-if-not #'internal-variable? (free-variables form))))
    (if vars
	(let ((len (length vars)))
	  (clause-error "The variable~p ~a ~a bound in a context internal to ~
the Iterate form.
This part of the clause will be moved outside the body of the loop, so it
must not contain anything that depends on the body."
			len (if (= len 1) (car vars) vars)
			(if (= len 1) "is" "are"))))))


(defun free-variables (form)
  ;; This will return a list of the (lexically) free variables in FORM.  It
  ;; will never return anything that is not a free variable (except for not
  ;; processing MACROLET), but it may not get all of them. 
  (delete-duplicates (free-vars form nil) :test #'eq))

(defun free-vars (form bound-vars)
  ;; To compute the variables that are free in a form, we have to walk it,
  ;; keeping track of what variables are bound.
  (cond
   ((constantp form)
    nil)
   ((symbolp form)
    (if (not (member form bound-vars :test #'eq))
	(list form)))
   ((atom form)
    nil)
   ((symbolp (car form))
    (cond
     ((or (special-form-p (car form)) 
	  (member (car form) '(flet labels let let*))) ; Lucid doesn't think
						       ; that these are
						       ; special forms.
      (case (car form)
	((catch if multiple-value-call multiple-value-prog1 progn progv
	  setq tagbody throw unwind-protect)
	    (free-vars-list (cdr form) bound-vars))
	((block eval-when return-from the)
	    (free-vars-list (cddr form) bound-vars))
	(multiple-value-bind
	    (free-vars-list (cddr form) (append (cadr form) bound-vars)))
	(function
	    (free-vars-fspec (second form) bound-vars))
	((flet labels macrolet)
	    (nconc (mapcan #L(free-vars-fspec !1 bound-vars)
			   (second form))
		   (free-vars-list (cddr form) bound-vars)))
	(let
	    (let* ((bindings (second form))
		   (body (cddr form))
		   (vars (mapcar #L(if (listp !1) (car !1) !1)
				 bindings)))
	      (nconc (mapcan #L(if (listp !1)
				   (free-vars (second !1) bound-vars)
				   nil)
			     bindings)
		     (free-vars-list body (append vars bound-vars)))))
	(let*
	    (let* ((bindings (second form))
		   (body (cddr form))
		   (free-vars nil))
	      (dolist (binding bindings)
		(if (listp binding)
		    (augment free-vars (free-vars (second binding) 
						  bound-vars)))
		(push (if (listp binding) (car binding) binding) bound-vars))
	      (nconc free-vars (free-vars-list body bound-vars))))
	(otherwise
	    nil)))
     ((macro-function (car form))
      (free-vars (macroexpand form) bound-vars))   ; should have *env*
     (t ; function call
      (free-vars-list (cdr form) bound-vars))))
   ((and (listp (car form)) (eq (caar form) 'lambda))
    (nconc (free-vars-fspec (car form) bound-vars)
	   (free-vars-list (cdr form) bound-vars)))
   (t
    (error "The form ~a is not a valid Lisp expression" form))))

(defun free-vars-list (list bound-vars)
  (mapcan #L(free-vars !1 bound-vars)
	  list))

(defun free-vars-fspec (fspec bound-vars)
  ;; FSPEC is either: a symbol, or
  ;; (<name-or-lambda> (<vars>) . body), or
  ;; (SETF <symbol>)
  (if (or (symbolp fspec) (eq (car fspec) 'setf))
      nil
      (free-vars-list (cddr fspec) (append (second fspec) bound-vars))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Functions that return code.

(defun return-code (&key declarations initial body step final final-protected)
  (values body declarations initial step final final-protected))

(defmacro return-driver-code (&key variable initial declarations body step
				   final final-protected next)
  ;; This assumes there is a local var called "generate"
  (let ((btemp (gensym))
	(ntemp (gensym)))
    `(let ((,btemp ,body)
	   (,ntemp ,next))
      (add-driver-info ,variable ,ntemp generate)
      (if (not generate)
	  (augment ,btemp ,ntemp))
      (values ,btemp ,declarations ,initial ,step ,final ,final-protected))))

(defun add-driver-info (var-template next-code generator?)
  ;; VAR-TEMPLATE could be a single var-spec or a destructuring template.
  ;; Copy the code--the original could be nconc'ed.
  (let ((vars (extract-vars var-template))
	(di (make-driver-info :next-code (copy-list next-code)
			      :generator? generator?)))
    (register-previous-code vars next-code :next)
    (push (cons vars di) *driver-info-alist*)))

(defmacro return-sequence-code (&key element-var sequence access-fn
				     size-fn element-type sequence-type)
  ;; This assumes all the sequence keywords will be in the lexical
  ;; environment. 
  `(return-seq-code
    :element-var ,element-var
    :sequence ,sequence
    :access-fn ,access-fn
    :size-fn ,size-fn
    :element-type ,element-type
    :sequence-type ,sequence-type
    :from from :upfrom upfrom :to to :downto downto :above above :below below
    :downfrom downfrom :by by
    :with-index with-index
    :generate generate))

(defun return-seq-code (&key element-var sequence access-fn size-fn
			     element-type sequence-type
			     from upfrom to downto above below downfrom 
			     with-index (by 1) generate)
  ;; element-var might involve destructuring; the others won't.  If
  ;; access-fn is NIL, don't generate element-accessing code at all.
  (top-level-check)
  (check-sequence-keywords from upfrom downfrom to downto above below t)
  (let* ((index-var-spec (or with-index (genvar 'index))) 
	 (index-var (extract-var index-var-spec))
	 (seq-var (if (or access-fn (not (symbolp sequence)))
		      (make-var-and-default-binding 'seq
						    :type sequence-type)))
	 (seq-code (or seq-var sequence))
	 (step-var (if (not (constant? by))
		       (make-var-and-default-binding 'step :type 'fixnum)))
	 (step (or step-var by))
	 (step-func (if (or downto downfrom above) '- '+))
	 (test-func (cond
		     (to '>)
		     ((or downto downfrom) '<)
		     (below '>=)
		     (above '<=)
		     (t '>=)))
	 (size-code (make-application size-fn seq-code))
	 (limit-value (cond
		       ((or to below))
		       ((or downto above))
		       (downfrom 0)
		       (t size-code)))
	 (limit-var (if (not (numberp limit-value)) 
			(make-var-and-default-binding 'limit :type 'fixnum)))
	 (limit-code (or limit-var limit-value))
	 (other-func (if (eq step-func '-) '+ '-))
	 (initial-value (eval-const-expr
			 (cond
			  ((or from upfrom downfrom)
			   `(,other-func ,(or from upfrom downfrom) ,step))
			  ((or downto above) size-code)
			  (t `(- ,step)))))
	 (access-code (if (null access-fn)
			  nil
			  (make-application access-fn seq-code index-var)))
	 (step-code `(setq ,index-var (,step-func ,index-var ,step)))
	 (setqs	(if access-fn (do-dsetq element-var access-code 
					t element-type)))
	 (test `(if (,test-func ,index-var ,limit-code) (go ,*loop-end*))))
    (make-default-binding index-var-spec :type 'fixnum)
    (setq *loop-end-used?* t)
    (return-driver-code
     :initial (nconc (if seq-var `((setq ,seq-var ,sequence)))
		     (if step-var `((setq ,step-var ,by)))
		     (if limit-var `((setq ,limit-var ,limit-value)))
		     (if index-var `((setq ,index-var ,initial-value))))
     :next (list step-code test setqs)
     ;; say (list nil ...) in case element-var = VALUES
     :variable (list nil element-var index-var))))

(defun check-sequence-keywords (from upfrom downfrom to downto above below
				known-limits? &aux count)

  ;; If the limits aren't known, the possibilities are: FROM; UPFROM;
  ;; DOWNFROM; TO; BELOW; or FROM and exactly one of TO, DOWNTO, ABOVE and
  ;; BELOW.
  ;; If the limits are known: you also have DOWNTO; ABOVE; and nothing.
  (if (or (and upfrom downfrom)
	  (and (or upfrom downfrom) (or from to downto above below)))
      (clause-error "UPFROM or DOWNFROM must occur alone"))
  (if (> (setq count (count-if #'identity (list to downto above below))) 1)
      (clause-error "Use at most one of TO, DOWNTO, ABOVE and BELOW"))
  (if (not known-limits?)
      ;; eliminate the cases DOWNTO, ABOVE, and nothing.
      (if (and (not (or from upfrom downfrom))
	       (or downto above (zerop count)))
	  (clause-error "Illegal set of sequence keywords"))))

(defun eval-const-expr (expr)
  ;; This is very simple: if expr is a list, and all the args are constants,
  ;; it will evaluate it; else it will just return it.
  (if (and (listp expr) (every #'constantp (cdr expr)))
      (eval expr)
      expr))

(defun make-funcall (fn &rest args)
  ;; This should be used when FN is something the user has written in a
  ;; clause. 
  #+symbolics (setq args (copy-list args))
  (cond
   ((or (quoted? fn) (function-quoted? fn))
    `(,(second fn) ,@args))
   ((lambda-expression? fn)
    `(,fn ,@args))
   ((functionp fn) `(funcall ,fn ,@args))
   (t
    `(funcall ,fn ,@args))))

(defun make-application (fn &rest args)
  ;; Use this when FN is given in the implementation code.
  #+ symbolics (setq args (copy-list args))
  (cond
   ((or (symbolp fn) (lambda-expression? fn))
    `(,fn ,@args))
   ((function-quoted? fn)
    `(,(second fn) ,@args))
   ((and (listp fn) (eq (car fn) 'subst))
    (apply-subst-expr fn args))
   ((functionp fn) `(funcall ,fn ,@args)) ;; Siskind's patch for compiled fns
   (t
    (clause-error "~a should denote a function, but it doesn't" fn))))
      
(defun apply-subst-expr (subst-expr args)
  (let ((params (second subst-expr))
	(body (cddr subst-expr)))
    (prognify (sublis (pairlis params args) body))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Clauses   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Special clauses.  These must return freshly consed lists that are
;;; nconcable. 

(defmacro def-special-clause (name arglist &body body)
  `(progn
     (defun ,name ,arglist ,@body)
     (install-special-clause-function ',name
				      ,(if (stringp (car body))
					   (car body)))))

(defun install-special-clause-function (symbol &optional doc-string)
  ;; Put it at the end, if not already present.
  (let ((entry (assoc symbol *special-clause-alist*)))
    (if (null entry)
	(augment *special-clause-alist* (list (cons symbol doc-string)))
	(setf (cdr entry) doc-string))
    symbol))

(def-special-clause INITIALLY (&rest forms)
  "Lisp forms to execute before loop starts"
  (mapc #'local-binding-check forms)
  (return-code :initial (copy-list forms)))

(def-special-clause AFTER-EACH (&rest forms)
  "Lisp forms to execute after each iteration"
  (mapc #'local-binding-check forms)
  (return-code :step (walk-list forms)))

;;;		     (copy-list forms)))
 
(def-special-clause FINALLY (&rest forms)
  "Lisp forms to execute after loop ends"
  (mapc #'local-binding-check forms)
  (return-code :final (copy-list forms)))

(def-special-clause FINALLY-PROTECTED (&rest forms)
  "Lisp forms in an UNWIND-PROTECT after loop ends"
  (mapc #'local-binding-check forms)
  (return-code :final-protected (copy-list forms)))

(def-special-clause IF-FIRST-TIME (then &optional else)
  (return-code :body (list (if-1st-time (list (walk-expr then))
					(list (walk-expr else))))))

(def-special-clause IN (block-name &rest forms)
  "Process forms in a given Iterate block"
  ;; VALUE: depends on forms
  (if (eq block-name *block-name*)
      (walk-list forms)
      `((in ,block-name ,@(copy-list forms)))))

(def-special-clause NEXT (var &optional (n 1))
  "Explicitly step a driver variable"
  ;; VALUE: var, after stepping.
  ;; Enclose the returned code in a PROGN so that the variable reference isn't
  ;; confusable with a tag (since the code might appear within a tagbody).
  ;; The PROGN is also necessary so that spliced-in save code will not result
  ;; in extra forms, for cases when the NEXT appears as an argument.
  (let ((entry (assoc var *driver-info-alist* :test #'member)))
    (if (or (null entry) (not (driver-info-generator? (cdr entry))))
	(clause-error "Variable is not associated with a generator")
	(let* ((vars (car entry))
	       (di (cdr entry))
	       (code (copy-list (driver-info-next-code di))))
	  (if (internal-variable? var)
	      (clause-error "The variable ~a is bound in a context internal ~
to the Iterate form. 
It cannot be stepped at this point in the code." var))
	  (if (some #'internal-variable? vars)
	      (clause-error "Some of the variables ~a, which will be stepped
when this clause is executed, are bound in a context internal to the Iterate
form, so ~a cannot be stepped at this point in the code." vars var))
	  (setf (driver-info-used di) t)
	  (register-previous-code vars code :next)
	  (return-code :body (make-next-code var code n))))))


(defun make-next-code (var code n)
  ;; Construct the body carefully, ensuring that CODE, and not a copy,
  ;; appears in it.
  (let ((var-code (if (eq var (var-value-returned code))
		      nil
		      (list var))))
    (if (eql n 1)
	(list (cons 'progn (nconc code var-code)))
	(let ((i (genvar 'next)))
	  (list (cons 'progn (cons 'dotimes (cons (list i n var) 
						  code))))))))


(defun var-value-returned (forms)
  ;; If the result of evaluating FORMS would be the value of some variable,
  ;; then that variable is returned; else NIL.
  ;;  We only check for progns, setqs and raw variables.
  (let ((form (car (last forms))))
    (cond
     ((symbolp form)
      form)
     ((atom form)
      nil)
     ((eq (car form) 'setq)
      (nth (- (length form) 2) form))
     ((eq (car form) 'progn)
      (var-value-returned (cdr form)))
     (t
      nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Iteration-driving clauses.

(defsynonym as for)

(defsynonym generating generate)

(defclause (REPEAT n)
  "Repeat the loop some number of times"
  (top-level-check)
  (let* ((c-type (or (expression-type n) 'fixnum))
	 (count-var (make-var-and-default-binding 'count :type c-type)))
    (setq *loop-end-used?* t)
    (return-code :initial `((setq ,count-var ,n))
		 :body `((if (<= ,count-var 0) (go ,*loop-end*)))
		 :step `((setq ,count-var (1- ,count-var))))))


(defclause-driver (FOR var-spec &sequence)
  "Numbers"
  (top-level-check)
  (if with-index
      (clause-error "WITH-INDEX should not be specified for this clause"))
  (check-sequence-keywords from upfrom downfrom to downto above below nil)
  (make-default-binding var-spec :type 'number)
  (let* ((var (extract-var var-spec))
	 (initial (or from upfrom downfrom 0))
	 (limit (or to downto above below))
	 (step-func (if (or downfrom downto above)
			'-
			'+))
	 (test-func (cond
		     (to '>)
		     (downto '<)
		     (below '>=)
		     (above '<=)))
	 (limit-var (if (and limit (not (constant? limit)))
			(make-var-and-default-binding 
			 'limit
			 :using-type-of (if (expression-type limit)
					    limit
					    var))))
	 (step-var (if (not (constantp by)) 
		       (make-var-and-default-binding 'step
						     :using-type-of by)))
	 (step-thing (or step-var by))
	 (limit-code (or limit-var limit))
	 (init-val (eval-const-expr
		    (list (if (eq step-func '+) '- '+) initial step-thing)))
	 (test (if limit
		   (progn (setq *loop-end-used?* t)
			  `((if (,test-func ,var ,limit-code) 
				(go ,*loop-end*))))
		   nil))
	 (next `((setq ,var (,step-func ,var ,step-thing)) ,@test)))
    (return-driver-code :initial `(,@(if limit-var
					 `((setq ,limit-var ,limit)))
				   ,@(if step-var
					 `((setq ,step-var ,by)))
				   (setq ,var ,init-val))
			:next next
			:variable var)))


;;;;;;;;;;;;;;;;;;;;;;;
;;; Sequence iteration

(defclause-driver (FOR var-spec ON list &optional BY (step ''cdr))
  "Sublists of a list"
  (top-level-check)
  (let* ((var (extract-var var-spec))
	 (list-var (make-var-and-default-binding 'list :type 'list))
	 (test `(if (,*list-end-test* ,list-var) (go ,*loop-end*)))
	 (setq (do-dsetq var-spec list-var)))
    (setq *loop-end-used?* t)
    (return-driver-code :initial `((setq ,list-var ,list))
			:next (list test
				    setq
				    (generate-function-step-code 
				     list-var step))
			:variable var)))

(defclause-driver (FOR var IN list &optional BY (step ''cdr))
  "Elements of a list"
  (top-level-check)
  (let* ((on-var (make-var-and-default-binding 'list :type 'list))
	 (setqs (do-dsetq var `(car ,on-var)))
	 (test `(if (,*list-end-test* ,on-var) (go ,*loop-end*))))
    (setq *loop-end-used?* t)
    (return-driver-code :initial `((setq ,on-var ,list))
			:next (list test
				    setqs
				    (generate-function-step-code on-var step))
			:variable var)))


(defun generate-function-step-code (var step) 
  ;; If the stepping function is quoted or sharp-quoted, we don't need to make
  ;; a variable for it.  The two constant cases are distinguished solely for
  ;; compilers too stupid to compile (funcall 'cdr foo) the same as (cdr foo).
  ;; (Really, for cosmetics--there probably are no such stupid compilers.)
  (cond
   ((quoted? step)
    `(setq ,var (,(second step) ,var)))
   ((function-quoted? step)
    `(setq ,var (funcall ,step ,var)))
   (t
    (let ((step-var (make-var-and-binding 'step step :type 'function)))
      `(setq ,var (funcall ,step-var ,var))))))


(defclause-sequence IN-VECTOR INDEX-OF-VECTOR
  ;; This doesn't observe fill-pointers.
  :access-fn 'aref
  :size-fn 'length
  :sequence-type 'vector
  :element-doc-string "Elements of a vector"
  :index-doc-string "Indices of a vector")

(defclause-sequence IN-SEQUENCE INDEX-OF-SEQUENCE
  ;; This observes fill pointers, and works for any sequence.
  :access-fn 'elt
  :size-fn 'length
  :sequence-type 'sequence
  :element-doc-string "Elements of a sequence (vector or list)"
  :index-doc-string "Indices of a sequence (vector or list)")

(defclause-sequence IN-STRING INDEX-OF-STRING
  :access-fn 'char
  :size-fn 'length
  :sequence-type 'string
  :element-type 'character
  :element-doc-string "Characters in a string"
  :index-doc-string "Indices of a string")

;;; IN-HASHTABLE and IN-PACKAGE are cheats: we use the portable interface to
;;; make a list, then iterate over that.

(defclause-driver (FOR key-val-vars IN-HASHTABLE table)
  "Elements of a hashtable"
  ;; This is just like FOR...IN.
  (top-level-check)
  (if (not (listp key-val-vars))
      (clause-error "~a should be a list of two variables: the first for the
keys, the second for the values." key-val-vars))
  (let* ((on-var (make-var-and-default-binding 'list :type 'list))
	 (key-var (first key-val-vars))
	 (item-var (second key-val-vars))
	 (key-setq (if key-var (list (do-dsetq key-var `(caar ,on-var)))))
	 (item-setq (if item-var (list (do-dsetq item-var `(cdar ,on-var)))))
	 (setqs (nconc key-setq item-setq)))
    (setq *loop-end-used?* t)
    (return-driver-code :initial `((setq ,on-var (hashtable->list ,table)))
			:next `((if (null ,on-var) (go ,*loop-end*))
				,@setqs
				(setq ,on-var (cdr ,on-var)))
			;; say (list nil ...) in case one of the vars is VALUES
			:variable (list nil item-var key-var))))
  

(defun hashtable->list (table)
  (let ((list nil))
    (maphash #L(push (cons !1 !2) list) table)
    list))

(defclause-driver (FOR var IN-PACKAGE pkg &optional EXTERNAL-ONLY (ext nil))
  "Symbols in a package"
  (top-level-check)
  (let ((on-var (make-var-and-default-binding 'list :type 'list)))
    (make-default-binding var :type 'symbol)
    (setq *loop-end-used?* t)
    (return-driver-code :initial `((setq ,on-var (symbols->list ,pkg ,ext)))
			:next `((if (null ,on-var) (go ,*loop-end*))
				(setq ,var (car ,on-var))
				(setq ,on-var (cdr ,on-var)))
			:variable var)))

(defun symbols->list (pkg external?)
  (let ((list nil))
    (if external?
	(do-external-symbols (s pkg)
	   (push s list))
	(do-symbols (s pkg)
	   (push s list)))
    list))


(defclause-driver (FOR var IN-FILE filename &optional USING (reader '#'read))
  "Forms in a file"
  (top-level-check)
  (return-stream-driver-code var filename reader :file generate))

(defclause-driver (FOR var IN-STREAM stream &optional USING (reader '#'read))
  "Forms in a stream"
  (top-level-check)
  (return-stream-driver-code var stream reader :stream generate))

		 
(defun return-stream-driver-code (var thing reader stream-or-file generate)
  (let* ((evar (extract-var var))
	 (type (or (var-type evar) T))
	 (stream-var (make-var-and-binding 'stream nil))
	 (set-var (if (and (var-spec? var)
			   (subtypep 'symbol type))
		      ;; We can use the given variable directly if no
		      ;; destructuring is required, and if the type of the
		      ;; variable can hold a symbol (since we use a gensym for
		      ;; the eof-marker). 
		      evar
		      (genvar 'temp)))
	 (eof (gensym))
	 (setq (if (eq set-var evar)
		   (progn (make-default-binding set-var) nil)
		   (list (do-dsetq var set-var)))))
    (setq *loop-end-used?* t)
    (return-driver-code 
     :initial (if (eq stream-or-file :file)
		  `((setq ,stream-var (open ,thing :direction :input)))
		  `((setq ,stream-var ,thing)))
     :next `((setq ,set-var (funcall ,reader ,stream-var nil ',eof))
	     (if (eq ,set-var ',eof) (go ,*loop-end*))
	     ,@setq)
     :final-protected `((if (streamp ,stream-var)
			    (close ,stream-var)))
     :variable var)))
  
  

(defclause-driver (FOR var NEXT next)
  "General driver; VAR is set to value of NEXT"
  (let ((setq (do-dsetq var next)))
    (return-driver-code :variable var
			:next (list setq))))

(defclause-driver (FOR var DO-NEXT next)
  "General driver; VAR must be explicitly set"
  (return-driver-code :variable var
		      :next (if (list-of-forms? next)
				(copy-list next)
				(list next))))




; No NEXT:
; LOOP-TOP: SET
;          (if test (go LOOP-END))
;          STEP
;
; NEXT:
;	...
; LOOP-TOP ...
;	[next] SET; (if test (go LOOP-END)); STEP


;(FOR var FROM n) => (initially (setq var (- n 1)))
;                    (FOR var NEXT (1+ var))
;
;(FOR var FROM n TO m) => (initially (setq var (- n 1)) (setq limit (- m 1)))
;                         (FOR var NEXT (if (> var limit) (finish) (1+ var))
;					 
;
;(FOR var ON list)  =>    (initially (setq temp list))
;                         (FOR var NEXT (if (null temp) 
;					   (finish)
;					   (progn (setq temp (cdr temp))
;						  temp)))
;
;(FOR var IN list) =>    (initially (setq temp list))
;			(FOR var NEXT (if (null temp)
;					  (finish)
;					  (pop temp)))
;
;(FOR var IN-VECT v) =>  (initially (setq index -1) (setq len (1- (length v))))
;			(FOR var NEXT (if (>= index len) (finish))
;			              (setq index (1+ index))
;				      (aref v index))
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Variable binding and setting; pseudo-drivers.

(defclause (WITH var &optional = (value nil supplied?))
  "Bind a variable"
  ;; Special case: if value is not supplied, var can be a list of
  ;; variables, all bound defaultly.
  (if (not supplied?)
      (mapc #'make-default-binding (if (var-spec? var) (list var) var))
      (make-destructuring-bindings var value))
  (return-code)) ; nothing to return

(defclause (FOR var INITIALLY initial THEN then)
  "Set var initially, then on subsequent iterations"
  ;; This is a pseudo-driver: it doesn't work with NEXT.
  ;; Set var in initialization code, then set it in the step section on
  ;; subsequent iterations.  
  (top-level-check)
  (let* ((initial-setq (list (do-dsetq var initial)))
	 (then-setq (list (do-dsetq var (walk-expr then) nil))))
    (register-previous-code (extract-vars var) then-setq :initial)
    (return-code :initial initial-setq
		 :step then-setq)))

(defclause (FOR var = expr)
  "Set a variable on each iteration"
  ;; Set var each time through the loop.
  ;; VALUE: expr.
  (let ((vars (extract-vars var))
	(code (list (do-dsetq var (walk-expr expr)))))
    (register-previous-code vars code :next)
    (return-code :body code)))


(defclause (FOR var FIRST first-expr THEN then-expr)
  "Set var on first, and on subsequent, iterations"
  ;; Set var in the loop, but differently the first time.  Most
  ;; inefficient of the three.
  ;; VALUE: first- or then-expr.
  (let* ((first-setq (list (do-dsetq var (walk-expr first-expr))))
	 (then-setq  (list (do-dsetq var (walk-expr then-expr) nil))))
    (register-previous-code (extract-vars var) then-setq :initial)
    (return-code :body (list (if-1st-time first-setq then-setq)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Reducers.

(defun return-reduction-code (&key identity operation external-op? variable
				   expression test type using-type-of
				   accum-kind)
  ;;  A reduction is an iteration pattern in which a value is accumulated
  ;;(into VARIABLE) by repeatedly applying a binary OPERATION to the 
  ;;variable and an EXPRESSION.  The first time, the operation is applied
  ;;to the IDENTITY and the expression.
  ;;  Some other options allow for a wider range of patterns.  If TEST
  ;;is present, the result will only be accumulated on each iteration if
  ;;it succeeds. 
  ;;  TYPE is the type of the accumulation variable.
  ;;  ACCUM-KIND is the kind of accumulation this is--:increment, :max,
  ;;etc.  If NIL, then it matches any kind.
  ;; VALUE RETURNED: the value accumulated so far.
  (setq variable (or variable *result-var*))
  (let* ((var (extract-var variable))
	 (expr (walk-expr expression))
	 (op-expr (if external-op?
		      (make-funcall operation var expr)
		      (make-application operation var expr)))
	 (update-code `(setq ,var ,op-expr)))
    (make-accum-var-binding variable identity accum-kind 
			    :type type :using-type-of using-type-of)
    (return-code :body (if test
			   `((if ,test ,update-code ,var))
			   (list update-code)))))



(defclause (COUNTING expr &optional INTO var)
  "Increment a variable if expression is non-nil"
  (return-reduction-code :identity 0
			 :operation '(subst (var exp) (1+ var))
			 :expression nil
			 :test expr
			 :variable var
			 :type 'fixnum
			 :accum-kind :increment))

(defclause (SUM expr &optional INTO var)
  "Sum into a variable"
  (return-reduction-code :identity 0
			 :operation '+
			 :expression expr
			 :test nil
			 :variable var
			 :type 'number
			 :accum-kind :increment))

(defsynonym summing sum)


(defclause (MULTIPLY expr &optional INTO var)
  "Multiply into a variable"
  (return-reduction-code :identity 1
			 :operation '*
			 :expression expr
			 :test nil
			 :variable var
			 :type 'number
			 :accum-kind :increment))

(defsynonym multiplying multiply)


(defclause (REDUCING expr BY op &optional INITIAL-VALUE (init-val nil iv?)
		                          INTO var-spec)
  "Generalized reduction"
  ;; If we don't know the initial value, we can't use RETURN-REDUCTION-CODE.
  ;; We have to be inefficient and do something different the first time.
  ;; Also, we have to share the first-time-var in case of multiple reductions
  ;; into the same variable.
  (cond
   (iv?
    (local-binding-check init-val)
    (return-reduction-code :identity init-val
			   :operation op
			   :external-op? t
			   :expression expr
			   :variable var-spec
			   :type (expr-type-only op)
			   :accum-kind nil))  ; matches anything
   (t
    (setq expr (walk-expr expr))
    (setq var-spec (or var-spec *result-var*))
    (let* ((var (extract-var var-spec))
	   (entry (make-accum-var-default-binding var-spec nil
						  :using-type-of expr))
	   (prev-first-time-var (third entry)))
      (multiple-value-bind (update-code first-time-var)
	  (if-1st-time 
	   `((setq ,var ,expr))
	   `((setq ,var (funcall ,op ,var ,expr)))
	   prev-first-time-var)
	(if (null prev-first-time-var)
	    (setf (cddr entry) (list first-time-var)))
	(return-code :body (list update-code)))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Extrema.

(defclause (MAXIMIZE expr &optional INTO var)
  "Maximize value of an expression"
  (return-extremum-code expr var 'max))

(defsynonym maximizing maximize)


(defclause (MINIMIZE expr &optional INTO var)
  "Minimize value of an expression"
  (return-extremum-code expr var 'min))

(defsynonym minimizing minimize)


(defun return-extremum-code (expr var-spec operation)
  ;; If we know the extremal value for the type of var, we COULD generate
  ;; a reduction...but don't right now, because it complicates
  ;; multiple accumulation.
  ;;  In order to accomodate multiple maxmins into the same variable, 
  ;; we store the first-time-variable in the accum-var-alist entry and
  ;; reuse it.  We have to do it this way, testing the var each time
  ;; through the loop, because due to conditionalization we don't know
  ;; if any of the first-time code will be executed.
  ;; VALUE: extremum so far.
  (setq expr (walk-expr expr))
  (let* ((m-var-spec (or var-spec *result-var*))
	 (m-var (extract-var m-var-spec))
	 (entry (make-accum-var-default-binding m-var-spec 
						(if (eq operation 'min)
						    :min :max)
						:using-type-of expr))
	 (prev-first-time-var (third entry)))
    (multiple-value-bind (update-code first-time-var)
	(if-1st-time 
	 `((setq ,m-var ,expr))
	 `((setq ,m-var (,operation ,m-var ,expr)))
	 prev-first-time-var)
      (if (null prev-first-time-var)
	  (setf (cddr entry) (list first-time-var)))
      (return-code :body (list update-code)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Control flow.

(defmacro finish ()
  "Leave the loop gracefully, executing the epilogue"
  (setq *loop-end-used?* t)
  `(go ,*loop-end*))

(defmacro terminate ()
  '(finish))

(defmacro next-iteration ()
  "Begin the next iteration"
  (setq *loop-step-used?* t)
  `(go ,*loop-step*))

(defmacro leave (&optional value)
  "Exit the loop without running the epilogue code"
  `(return-from ,*block-name* ,value))

(defclause (WHILE expr)
  "Exit loop if test is nil"
  (setq *loop-end-used?* t)
  (return-code :body `((if (not ,(walk-expr expr)) (go ,*loop-end*)))))

(defclause (UNTIL expr)
  "Exit loop if test is non-nil"
  (setq *loop-end-used?* t)
  (return-code :body `((if ,(walk-expr expr) (go ,*loop-end*)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Aggregated Boolean tests.

(defclause (ALWAYS expr)
  "Return last value iff expression is always non-nil"
  ;; VALUE: expr
  (setq expr (walk-expr expr))
  (let ((var *result-var*))
    (make-accum-var-binding var t :Boolean)
    (return-code :body `((or (setq ,var ,expr) 
			     (return-from ,*block-name* nil))))))


(defclause (NEVER expr)
  "Return T iff expression is never non-nil"
  ;; VALUE: expr (which is always nil)
  (setq expr (walk-expr expr))
  (let ((var *result-var*))
    (make-accum-var-binding var t :Boolean :type 'symbol)
    (return-code :body `((if ,expr (return-from ,*block-name* nil))))))



(defclause (THEREIS expr)
  "Return value of expression as soon as it is non-nil"
  ;; VALUE: expr (which is always nil)
  (setq expr (walk-expr expr))
  (let ((var *result-var*))
    (make-accum-var-default-binding var :Boolean)
    (return-code :body `((if (setq ,var ,expr) 
			     (return-from ,*block-name* ,var))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Finders.

(defclause (FINDING expr SUCH-THAT test &optional INTO var-spec
						  ON-FAILURE fval)
  "Return expression when test is non-nil"
  ;; VALUE: undefined.
  (setq expr (walk-expr expr))
  (setq test (walk-expr test))
  (local-binding-check fval)
  (setq var-spec (or var-spec *result-var*))
  (setq *loop-end-used?* t)
  (let ((var (extract-var var-spec)))
    (make-binding var-spec fval :using-type-of fval) 
    (if (function-quoted? test)
	(if (duplicable? expr)
	    (return-code :body `((when ,(make-funcall test expr)
				   (setq ,var ,expr)
				   (go ,*loop-end*))))
	    (with-temporary temp-var
	      (return-code :body `((setq ,temp-var ,expr)
				   (when ,(make-funcall test temp-var)
				     (setq ,var ,temp-var)
				     (go ,*loop-end*))))))
	(return-code :body `((when ,test
			       (setq ,var ,expr)
			       (go ,*loop-end*)))))))

(defclause (FINDING expr MAXIMIZING max-expr &optional INTO variable)
  "Return value which maximizes expression"
  (return-find-extremum-code expr max-expr variable :max))

(defclause (FINDING expr MINIMIZING min-expr &optional INTO variable)
  "Return value which minimizes expression"
  (return-find-extremum-code expr min-expr variable :min))

(defun return-find-extremum-code (expr m-expr var kind)
  ;; VALUE: max/min expr so far.
  ;; Variable can be a list of two variables, in which case the first
  ;; is used for the expr and the second for the extremum.
  ;; The update code looks something like this:
  ;; When m-expr is not a function:
  ;;     (setq temp m-expr)
  ;;     (cond
  ;;      ((> temp m-var)
  ;;       (setq m-var temp)
  ;;       (setq expr-var expr))
  ;;      (t expr-var))
  ;;
  ;; When m-expr is a function:
  ;;     (setq temp2 expr)
  ;;     (setq temp (funcall m-expr temp2)) ;; or (m-expr temp2)
  ;;     (cond 
  ;;      ((> temp m-var)
  ;;       (setq m-var temp)
  ;;       (setq expr-var temp2))
  ;;      (t expr-var))
  ;;
  (setq expr (walk-expr expr))
  (setq m-expr (walk-expr m-expr))
  (let* ((function? (function-quoted? m-expr))
	 (temp-var (make-var-and-default-binding 'temp :using-type-of 
						 (if (not function?) m-expr)))
	 (temp-var-2 (if (and function? (not (duplicable? expr)))
			 (make-var-and-default-binding 'temp
						       :using-type-of expr)))
	 (test (if (eq kind :max) '> '<))
	 expr-var m-var)
    (cond
     ((null var)   
      ;; no var means return expr as a result
      (setq expr-var *result-var*)
      (setq m-var (genvar kind)))
     ((var-spec? var)
      ;; a single var-spec means set expr to that var
      (setq expr-var var)
      (setq m-var (genvar kind)))
     ((and (listp var) (= (length var) 2) (every #'var-spec? var))
      ;; a two-element list means set expr to 1st, m to 2nd
      (setq expr-var (first var))
      (setq m-var (second var)))
     (t
      (clause-error "The value for INTO, ~a, should be a variable specifier~%~
                     or a list of two variable specifiers." var)))
    (make-default-binding expr-var :using-type-of expr)
    (make-accum-var-default-binding m-var kind :using-type-of m-expr)
    (setq expr-var (extract-var expr-var))
    (setq m-var (extract-var m-var))
    (let* ((expr-code (or temp-var-2 expr))
	   (esetq-code (if temp-var-2 `((setq ,temp-var-2 ,expr))))
	   (m-code (if function?
		       (make-funcall m-expr expr-code)
		       m-expr)))
      (return-code :body `(,@esetq-code
			   (setq ,temp-var ,m-code)
			   ,(if-1st-time 
			     `((setq ,m-var ,temp-var)
			       (setq ,expr-var ,expr-code))
			     `((cond
				((,test ,temp-var ,m-var)
				 (setq ,m-var ,temp-var)
				 (setq ,expr-var ,expr-code))
				(t ,expr-var)))))))))
				 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Collectors.

    
(defun return-collection-code (&key variable expression 
				    start-operation end-operation
				    one-element
				    test
				    (place 'end) (result-type 'list)
				    &aux place-string)
  ;; VALUE: the list so far.
  (setq place-string (symbol-name place))
  (cond
   ((string= place-string "END")
    (setq place 'end))
   ((or (string= place-string "START")
	(string= place-string "BEGINNING"))
    (setq place 'start))
   (t 
    (clause-error "~a is neither 'start', 'beginning' or 'end'" 
		  place)))
  (let* ((collect-var-spec (or variable *result-var*))
	 (collect-var (extract-var collect-var-spec))
	 (entry (make-accum-var-binding collect-var-spec nil 
					:collect :type 'list))
	 (end-pointer (third entry))
	 (prev-result-type (fourth entry)))
    (cond
     ((null end-pointer)
      (if (eq place 'end)
	  (setq end-pointer (make-var-and-binding 'end-pointer nil 
						  :type 'list)))
      (setf (cddr entry) (list end-pointer result-type)))
     (t
      (if (not (equal result-type prev-result-type))
	  (clause-error "Result type ~a doesn't match ~a" 
			result-type prev-result-type))))
    (let* ((expr (walk-expr expression))
	   (op-expr 
	    (if (eq place 'start)
		(if (null start-operation)
		    expr
		    (make-application start-operation expr collect-var))
		(if (null end-operation)
		    expr
		    (make-application end-operation collect-var expr)))))
      (if (eq place 'start)
	  (return-code :body `((setq ,collect-var ,op-expr)))
	  (with-temporary temp-var
	    ;; In the update code, must test if collect-var is null to allow
	    ;; for other clauses to collect into same var.  This code
	    ;; is a tad bummed, but probably more for looks than real
	    ;; efficiency.
	    (let* ((update-code `(if ,collect-var
				     (setf (cdr ,end-pointer) ,temp-var)
				     (setq ,collect-var ,temp-var)))
		   (main-code (cond
			       ((not one-element)
				`((if (setq ,temp-var ,op-expr)
				      (setq ,end-pointer 
					    (last ,update-code)))))
			       (test
				`((when ,(make-application test
							   collect-var expr)
				      (setq ,temp-var ,op-expr)
				      (setq ,end-pointer ,update-code))))
			       (t
				`((setq ,temp-var ,op-expr)
				  (setq ,end-pointer ,update-code))))))
				
	      (return-code 
	       ;; Use a progn so collect-var isn't mistaken for a tag.
	       :body `((progn ,.main-code ,collect-var))
	       :final (if (eq result-type 'list)
			  nil
			  `((setq ,collect-var 
				  (coerce ,collect-var ',result-type)))))))))))


(defclause (COLLECT expr &optional INTO var AT (place 'end) 
		    		   RESULT-TYPE (type 'list))
  "Collect into a list"
  (return-collection-code
   :variable var
   :expression expr
   :one-element t
   :start-operation 'cons 
   :end-operation '(subst (var expr) (list expr))
   :place place
   :result-type (if (quoted? type) (second type) type)))

(defsynonym collecting collect)

(defclause (ADJOINING expr &optional INTO var AT (place 'end) 
		                     TEST (test '#'eql)
				     RESULT-TYPE (type 'list))
  "Adjoin into a list (tests for membership first)"
  (if (duplicable? expr)
      (return-collection-code
       :variable var
       :expression expr
       :start-operation 'adjoin
       :test `(subst (var expr) (not (member expr var :test ,test)))
       :end-operation '(subst (var expr) (list expr))
       :one-element t
       :result-type (if (quoted? type) (second type) type)
       :place place)
      (with-temporary temp
	(return-collection-code
	 :variable var
	 :expression expr
	 :start-operation 'adjoin
	 :test `(subst (var expr)
		 (progn
		   (setq ,temp expr)
		   (not (member ,temp var :test ,test))))
	 :end-operation `(subst (var expr) (list ,temp))
	 :one-element t
	 :result-type (if (quoted? type) (second type) type)
	 :place place))))



(defclause (NCONCING expr &optional INTO var AT (place 'end))
  "Nconc into a list"
  (return-collection-code
   :variable var
   :expression expr
   :start-operation 'nconc
   :place place
   :one-element nil))
   
(defclause (APPENDING expr &optional INTO var AT (place 'end))
  "Append into a list"
  (return-collection-code
   :variable var
   :expression expr
   :start-operation 'append
   :end-operation '(subst (var expr) (copy-list expr))
   :place place
   :one-element nil))

(defclause (UNIONING expr &optional INTO var AT (place 'end) 
		                    TEST (test '#'eql))
  "Union into a list"
  ;; Can't use UNION because it says nothing about the order.
  (return-collection-code
    :variable var
    :expression expr
    :start-operation `(subst (expr var)
			(nconc (delete-if #L(member !1 var :test ,test)
					  (copy-list expr))
			       var))
    :end-operation `(subst (var expr) 
		      (delete-if #L(member !1 var :test ,test)
				 (copy-list expr)))
    :place place
    :one-element nil))

(defclause (NUNIONING expr &optional INTO var AT (place 'end) 
		                    TEST (test '#'eql))
  "Union into a list, destructively"
  ;; Can't use UNION because it says nothing about the order.
  (return-collection-code
    :variable var
    :expression expr
    :start-operation `(subst (expr var)
			(nconc (delete-if #L(member !1 var :test ,test)
					  expr)
			       var))
    :end-operation `(subst (var expr) 
		      (delete-if #L(member !1 var :test ,test)
				 expr))
    :place place
    :one-element nil))


(defclause (ACCUMULATE expr BY op &optional INITIAL-VALUE init-val 
		                            INTO var-spec)
  "Generalized accumulation"
  ;; This is just like REDUCING except, 1. the args to OP are in the other
  ;; order, and 2. if no initial value is supplied, NIL is used. 
  (local-binding-check init-val)
  (setq var-spec (or var-spec *result-var*))
  ;; ignore the THE expression--it was a bad idea
  (if (the-expression? op) 
      (setq op (third op)))
  (let* ((var (extract-var var-spec))
	 (op-expr (make-funcall op (walk-expr expr) var)))
    (make-accum-var-binding var-spec init-val nil :type NIL)
    (return-code :body `((setq ,var ,op-expr)))))

(defsynonym accumulating accumulate)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; The PREVIOUS mechanism.

;;; It makes no sense to save local vars, so this is not as complex as I had
;;; thought.  There is one list: an alist of top-level vars and their info
;;; (*previous-vars-alist*).  Also, I now insist that the default value be
;;; fixed at the initialization section of the loop, so the old *unset*
;;; implementation is unnecessary.
;;;   However, generators complicate things.  In the absence of a generator,
;;; the save code can go in the step portion of the loop; but if there is a
;;; generator, the best we can do is use a flag for the first time.


(defclause (FOR pvar PREVIOUS var &optional INITIALLY (default nil default?)
					    BACK (n-expr 1))
  "Previous value of a variable"
  ;; Set each save variable to the default in the initialization.
  (top-level-check)
  (if (not (constantp n-expr))
      (clause-error "~a should be a compile-time constant" n-expr))
  (let ((n (eval n-expr))) ; Is this okay? It should be.
    (if (not (and (integerp n) (> n 0)))
	(clause-error "~a should be a positive integer" n-expr)
	;; Here, n is a positive integer.
	(let* ((p-i (intern-previous-info var))
	       (init-val (make-initial-value default default? (var-type var)))
	       (temp (if (not (duplicable? init-val))
			 (make-var-and-default-binding
			  'temp :using-type-of init-val)))
	       (iv-ref (or temp init-val))
	       (save-vars (cons pvar (make-save-vars var (1- n))))
	       (inits (mapcar #L`(setq ,!1 ,iv-ref) save-vars)))
	  (if temp (push `(setq ,temp ,init-val) inits))
	  (make-default-binding pvar)
	  (push (make-save-info :save-var pvar
				:iv-ref iv-ref
				:save-vars save-vars)
		(previous-info-save-info-list p-i))
	  (return-code :initial inits)))))

(defun register-previous-code (vars code class)
  ;; It's important for this that code is never copied; we keep a pointer to
  ;; it. 
  (dolist (var (listify vars))
    (let ((p-i (intern-previous-info var)))
      (setf (previous-info-class p-i) class)
      (push (cons code (last code)) (previous-info-code p-i)))))

(defun intern-previous-info (var)
  ;; If VAR already has a previous-info structure, return it; else
  ;; create a new one, put it where it belongs, and return it.
  ;;   Make sure that if VAR is itself a save-var, the new record goes after
  ;; the one for VAR's var, so that the previous code is generated before it
  ;; is itself considered update code for another previous splicing.
  (or (cdr (assoc var *previous-vars-alist*))
      (let* ((p-i (make-previous-info :var var))
	     (place (member var *previous-vars-alist* 
			    :test #'is-save-var)))
	(if (null place)
	    (push (cons var p-i) *previous-vars-alist*)
	    (push (cons var p-i) (cdr place)))
	p-i)))

(defun is-save-var (var entry)
  (member var (previous-info-save-info-list (cdr entry))
	  :key #'save-info-save-var))

(defun make-save-vars (var n)
  (let ((list nil)
	(string (format nil "SAVE-~a-" var)))
    (dotimes (i n)
      (let ((svar (make-var-and-default-binding string :using-type-of var)))
	(push svar list)))
    list))

(defun insert-previous-code ()
  ;; For each variable that requires a previous value, get all the update code
  ;; for that variable and splice in code that will remember the previous
  ;; values for the desired number of iterations.  Return code to put in the
  ;; init and step sections of the loop.
  ;; There are three situations here: 
  ;; 1. Variable has its initial value at the beginning of the loop, or gets
  ;;    its initial value in a different place than where it is updated.  In
  ;;    this case, we can put the save code just before each update of the
  ;;    variable.  Applicable clauses are: FOR-PREVIOUS, FOR-INITIALLY-THEN,
  ;;    and FOR-FIRST-THEN. (class :INITIAL)
  ;; 2. The variable is updated somewhere inside the loop, and the update also
  ;;    gives it its first value.  We use another, internal save variable,
  ;;    which is set to the variable after each update.  This is for FOR-= and
  ;;    driver clauses when NEXT is used.(class :NEXT)
  ;; 3. Variable is a driver with no NEXT.  We can put the update in the step
  ;;    portion of the loop, since we know the update code occurs at the
  ;;    beginning. (class :STEP)
  ;; Note that (3) is really an optimization of (2), and we could perform such
  ;; an optimization more generally if we could show that a variable in class
  ;; (2) was always updated before being used.  Right now, we don't bother.
  ;;  *** (3) is no longer done because driver code stays where the driver is.
  ;;  We could try to detect that the driver is at the beginning, but don't
  ;;  for now.
  (let ((init-code nil)
	(step-code nil)
	(pv-list *previous-vars-alist*))
    ;; Step through this manually, because it may be that we add to it in
    ;; the process, and we must make sure that we don't cdr till we have to. 
    (loop
     (if (null pv-list) (return))
     (let* ((entry (car pv-list))
	    (var (car entry))
	    (p-i (cdr entry))
	    (save-info-list (previous-info-save-info-list p-i))
	    (code-list (previous-info-code p-i))
	    (class (previous-info-class p-i)))
       (if save-info-list
	   (if (and (null code-list) (not (eq class :step)))
	       (clause-error "Cannot obtain previous values of ~a" var)
	       (let ((prev-code (if (not (eq class :next))
				    (mapcan #L(make-prev-code var !1)
					    save-info-list))))
		 (case class
;;;;;;		   (:step (augment step-code prev-code))
		   (:initial (splice-in-code prev-code nil code-list))
		   ((:next :step) (augment init-code
				   (do-extra-save-var-hack var save-info-list
							   code-list)))
		   (otherwise (bug "unknown class ~a" class)))))))
     (setq pv-list (cdr pv-list)))
    (values init-code step-code)))

(defun do-extra-save-var-hack (var save-info-list code-list)
  (let ((init-code nil)
	(prev-code nil)
	(post-code nil))
    (dolist (s-i save-info-list)
      (let* ((extra-save-var (make-post-save-var var))
	     (prev (make-prev-code extra-save-var s-i :next)))
	(augment init-code `((setq ,extra-save-var ,(save-info-iv-ref s-i))))
	(augment post-code `((setq ,extra-save-var ,var)))
	(augment prev-code prev)))
    (splice-in-code prev-code post-code code-list)
    init-code))
			
(defun make-post-save-var (var)
  (make-var-and-default-binding (format nil "POST-SAVE-~a-" var) 
				:using-type-of var))


(defun make-prev-code (set-var s-i &optional (class :initial))
  (let ((prev (make-save-previous-code set-var (save-info-save-vars s-i))))
    (register-previous-code (save-info-save-var s-i) prev class)
    prev))

(defun make-save-previous-code (var save-vars)
  ;; The first save-var is the furthest back.
  (if (null (cdr save-vars))
      `((setq ,(car save-vars) ,var))
      (cons `(setq ,(first save-vars) ,(second save-vars))
	    (make-save-previous-code var (cdr save-vars)))))

(defun splice-in-code (prev-code post-code code-list)
  ;; Put PREV-CODE in at the first cons cell of CODE, and POST-CODE at the
  ;; last cons cell.  Both PREV-CODE and POST-CODE are single forms.
  ;; Some list splicing here--danger.  It's crucial that
  ;; CODE actually appears in the code to be generated.
  ;;  Can't use prognify here, because other people might have pointers to
  ;;  this code, and when prognify takes the car it ruins that.
  (setq prev-code (add-progn prev-code))
  (setq post-code (add-progn post-code))
  (dolist (code code-list)
    (let* ((first-cons-cell (car code))
	   (last-cons-cell (cdr code)))
      (when post-code
;;;	(format t "Splicing ~a after ~a~%" post-code last-cons-cell)
	(setf (cdr last-cons-cell) (cons post-code (cdr last-cons-cell))))
      (when prev-code
;;;	(format t "Splicing ~a before ~a~%" prev-code first-cons-cell)
	(let ((new-start (cons (car first-cons-cell) (cdr first-cons-cell))))
	  (setf (car first-cons-cell) prev-code)
	  (setf (cdr first-cons-cell) new-start))))))

(defun add-progn (forms)
  ;; If more than one form, cons the progn in; else do nothing.
  (cond
   ((null forms)
    nil)
  ((and (listp (car forms)) (not (lambda-expression? (car forms))))
   (cons 'progn forms))
  (t
   forms)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Miscellaneous.

(defun at-top-level? ()
  *top-level?*)

(defun top-level-check ()
  (if (not *top-level?*)
      (clause-error "Clause can occur only at top-level")))

(defun prognify (forms)
  ;; If more than one form, and the first is a list, then insert a PROGN.
  ;; Be careful to not copy forms.
  (if (cdr forms)
      (if (and (listp (car forms)) (not (eq (caar forms) 'lambda)))
	  (cons 'progn forms)
	  forms)
      (car forms)))

(defun clause-error (format-string &rest args)
  (if (boundp '*clause*)
      (apply #'error 
	     (concatenate 'string "Iterate, in ~a:~%" format-string)
	     *clause*
	     args)
      (apply #'error
	     (concatenate 'string "Iterate: " format-string)
	     args)))

(defun clause-warning (format-string &rest args)
  (if (boundp '*clause*)
      (apply #'format 
	     *error-output*
	     (concatenate 'string 
			  "Warning: Iterate, in clause ~a:~%" format-string)
	     *clause*
	     args)
      (apply #'format 
	     *error-output*
	     (concatenate 'string "Warning: Iterate: " format-string)
	     args)))


(defun bug (format-string &rest args)
  (apply #'format 
	 *error-output*
	 (concatenate 'string "Bug in Iterate: " format-string)
	 args))

;;; I need something that's a cross between gensym and gentemp...

(defvar *genvar-counter* 0)

(defun genvar (&optional (string "TEMP"))
  (prog1 (make-symbol (format nil "~a~d" string *genvar-counter*))
	 (incf *genvar-counter*)))
    

(defun symbol-append (&rest syms)
  (intern (apply #'concatenate 'string (mapcar #'symbol-name syms))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Debugging.

(defun run-test ()
  (with-open-file (ifile "/wh/jba/Lisp/test-iter.lisp" :direction :input)
    (loop
      (let ((form (read ifile nil :eof)))
	(if (eq form :eof) (return-from run-test nil))
	(print form)
	(format t "==>~%")
	(print (eval form))
	(format t "~%--------------------~2%")))))


(defun expand-test ()
  (with-open-file (ifile "test-iter.lisp" :direction :input)
    (loop
      (let ((form (read ifile nil :eof)))
	(if (eq form :eof) (return-from expand-test nil))
	(print form)
	(format t "==>~%")
	(print (macroexpand-1 form))
	(format t "~%--------------------~2%")))))

(defmacro me (x)
  `(progn (setq *print-pretty* t) (macroexpand-1 ',x)))


(eval-when (compile load eval)
  (set-dispatch-macro-character #\# #\L *old-sharpL-func*))

#+LUCID						;MES 12/21/96
(defun SPECIAL-FORM-P (x)
  (lisp:special-form-p x))

#+ANSI-CL					;MES 12/21/96
(defun SPECIAL-FORM-P (x)
  (special-operator-p x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Junk.


;;;;;;; For Gnu Emacs ;;;;;;;
;;; Local variables:
;;; version-control: t
;;; kept-new-versions: 5
;;; kept-old-versions: 0
;;; end:
