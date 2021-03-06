(defun within-tolerance (a b &optional (tol nil tolp))
  (let* ((complexp (or (typep a 'complex) (typep b 'complex)))
	 (tol (cond (tolp tol)
		    ((or (typep b 'double-float)
			 (and complexp
			      (typep (realpart b) 'double-float)))
		     (* 10 double-float-epsilon))
		    (t (* 10 single-float-epsilon)))))
    (if complexp
	(let ((ra (realpart a))
	      (ia (imagpart a))
	      (rb (realpart b))
	      (ib (imagpart b)))
	  (let ((rdelta (abs (- ra rb)))
		(idelta (abs (- ia ib))))
	    (or (and (<= rdelta tol)
		     (<= idelta tol))
		(complex rdelta idelta))))
      (let ((delta (abs (- a b))))
	(or (<= delta tol) delta)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 12.2 PREDICATES ON NUMBERS                                   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ZEROP
(deftest zerop1 (zerop 0) t)
(deftest zerop2 (zerop 1) nil)
(deftest zerop3 (zerop -0.0f0) t)
(deftest zerop4 (zerop 0/100) t)
(deftest zerop5 (zerop #c(0 0.0f0)) t)
(deftest zerop6 (zerop 1/9) nil)
(deftest zerop7 (zerop 2.0d0) nil)
(deftest zerop8 (zerop 0.0d0) t)
(deftest zerop9 (zerop #c(0 0.0d0)) t)

;;; PLUSP
(deftest plusp1 (plusp 0) nil)
(deftest plusp2 (plusp 0.0f0) nil)
(deftest plusp3 (plusp 0.0d0) nil)
(deftest plusp4 (plusp 1) t)
(deftest plusp5 (plusp -9) nil)
(deftest plusp6 (plusp 7.3f0) t)
(deftest plusp7 (plusp -3.9d0) nil)
(deftest plusp8 (plusp #xffffffff) t)
(deftest plusp9 (plusp #x-ffffffff) nil)
(deftest plusp10 (plusp least-positive-single-float) t)
(deftest plusp11 (plusp least-negative-single-float) nil)
(deftest plusp12 (plusp least-positive-double-float) t)
(deftest plusp13 (plusp least-negative-double-float) nil)

;;; MINUSP
(deftest minusp1 (minusp 0) nil)
(deftest minusp2 (minusp 0.0f0) nil)
(deftest minusp3 (minusp 0.0d0) nil)
(deftest minusp4 (minusp 1) nil)
(deftest minusp5 (minusp -9) t)
(deftest minusp6 (minusp 7.3f0) nil)
(deftest minusp7 (minusp -3.9d0) t)
(deftest minusp8 (minusp #xffffffff) nil)
(deftest minusp9 (minusp #x-ffffffff) t)
(deftest minusp10 (minusp least-positive-single-float) nil)
(deftest minusp11 (minusp least-negative-single-float) t)
(deftest minusp12 (minusp least-positive-double-float) nil)
(deftest minusp13 (minusp least-negative-double-float) t)

;;; EVENP
(deftest evenp1 (evenp 0) t)
(deftest evenp2 (evenp 4) t)
(deftest evenp3 (evenp #x10000000000) t)
(deftest evenp4 (evenp 5) nil)
(deftest evenp5 (evenp #x10000000001) nil)
(deftest evenp6 (evenp -4) t)
(deftest evenp7 (evenp #x-10000000000) t)
(deftest evenp8 (evenp -5) nil)
(deftest evenp9 (evenp #x-10000000001) nil)

;;; ODDP
(deftest oddp1 (oddp 0) nil)
(deftest oddp2 (oddp 4) nil)
(deftest oddp3 (oddp #x10000000000) nil)
(deftest oddp4 (oddp 5) t)
(deftest oddp5 (oddp #x10000000001) t)
(deftest oddp6 (oddp -4) nil)
(deftest oddp7 (oddp #x-10000000000) nil)
(deftest oddp8 (oddp -5) t)
(deftest oddp9 (oddp #x-10000000001) t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 12.3 COMPARISONS ON NUMBERS                                  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; =
(deftest =1 (= 3 3) t)
(deftest =2 (= 3 5) nil)
(deftest =3 (= 3.0d0 #c(3.0 0.0d0)) t)
(deftest =4 (= 3 3.0f0) t)
(deftest =5 (= 0.0 -0.0) t)
(deftest =6 (= 3.0s0 3.0d0) t)
(deftest =7 (= 5/2 2.5f0) t)
(deftest =8 (= 0 -0.0f0) t)
(deftest =9 (= 2.1d0 2.10001d0) nil)
(deftest =10 (= #c(1 2) #c(1 2)) t)
(deftest =11 (= #c(1 2) #c(1 3)) nil)
(deftest =12 (= #c(1 2) #c(1 2.0f0)) t)
(deftest =13 (= #c(1 5/2) #c(1 2.5d0)) t)
(deftest =14 (= #c(1 5/2) #c(1.01d0 2.5d0)) nil)
(deftest =rat1 (= (float 5/7) (float 5/7)) t)
(deftest =rat2 (= 5/7 (float 5/7)) nil)
(deftest =rat3 (= 5/7 (rational (float 5/7))) nil)
(deftest =rat4 (= 5/7 (float 5/7 1.0d0)) nil)
(deftest =rat5 (= 5/7 (rational (float 5/7 1.0d0))) nil)
(deftest =big1 (= #x123456789 #x123456789) t)
(deftest =big2 (= #x123456789 #x-123456789) nil)
(deftest =big3 (= #x-123456789 #x-123456789) t)
(deftest =big4 (= #x-123456789 #x123456789) nil)
(deftest =big-single1 (= (rational (float #x123456789 1.0f0))
			 (float #x123456789 1.0f0)) t)
(deftest =big-single2 (= (rational (float #x-123456789 1.0f0))
			      (float #x123456789 1.0f0)) nil)
(deftest =big-single3 (= (rational (float #x-123456789 1.0f0))
			      (float #x-123456789 1.0f0)) t)
(deftest =big-single4 (= (rational (float #x123456789 1.0f0))
			      (float #x-123456789 1.0f0)) nil)
(deftest =big-double1 (= (rational (float #x123456789 1.0d0))
			      (float #x123456789 1.0d0)) t)
(deftest =big-double2 (= (rational (float #x-123456789 1.0d0))
			      (float #x123456789 1.0d0)) nil)
(deftest =big-double3 (= (rational (float #x-123456789 1.0d0))
			      (float #x-123456789 1.0d0)) t)
(deftest =big-double4 (= (rational (float #x123456789 1.0d0))
			      (float #x-123456789 1.0d0)) nil)

;;; /=
(deftest /=int1 (/= 3 3) nil)
(deftest /=int2 (/= 3 5) t)
(deftest /=int3 (/= 3 3 3 3) nil)
(deftest /=int4 (/= 3 3 5 3) nil)
(deftest /=int5 (/= 3 6 5 2) t)
(deftest /=int6 (/= 3 2 3) nil)
(deftest /=int7 (/= 3) t)
(deftest /=float-complex (/= 3.0 #c(3.0 1.0)) t)

;;; <
(deftest <1 (< 3 5) t)
(deftest <2 (< 3 -5) nil)
(deftest <3 (< 3 3) nil)
(deftest <4 (< 3 3.0f0) nil)
(deftest <5 (< -0.0 0.0) nil)
(deftest <rat1 (< 5/7 5/7) nil)
(deftest <rat2 (< (float 5/7) (float 5/7)) nil)
(deftest <rat3 (< 5/7 (float 5/7)) t)
(deftest <rat4 (< 5/7 (rational (float 5/7))) t)
(deftest <rat5 (< 5/7 (float 5/7 1.0d0)) t)
(deftest <rat6 (< 5/7 (rational (float 5/7 1.0d0))) t)
(deftest <big1 (< #x123456789 #x123456789) nil)
(deftest <big2 (< #x123456789 #x-123456789) nil)
(deftest <big3 (< #x-123456789 #x-123456789) nil)
(deftest <big4 (< #x-123456789 #x123456789) t)
(deftest <big-single1 (< (rational (float #x123456789 1.0f0))
			  (float #x123456789 1.0f0)) nil)
(deftest <big-single2 (< (rational (float #x-123456789 1.0f0))
			  (float #x123456789 1.0f0)) t)
(deftest <big-single3 (< (rational (float #x-123456789 1.0f0))
			  (float #x-123456789 1.0f0)) nil)
(deftest <big-single4 (< (rational (float #x123456789 1.0f0))
			  (float #x-123456789 1.0f0)) nil)
(deftest <big-double1 (< (rational (float #x123456789 1.0d0))
			  (float #x123456789 1.0d0)) nil)
(deftest <big-double2 (< (rational (float #x-123456789 1.0d0))
			  (float #x123456789 1.0d0)) t)
(deftest <big-double3 (< (rational (float #x-123456789 1.0d0))
			  (float #x-123456789 1.0d0)) nil)
(deftest <big-double4 (< (rational (float #x123456789 1.0d0))
			  (float #x-123456789 1.0d0)) nil)

;;; >
(deftest >1 (> 4 3) t)
(deftest >2 (> -4 -3) nil)
(deftest >3 (> 3 3) nil)
(deftest >4 (> 3 3.0f0) nil)
(deftest >5 (> 0.0 -0.0) nil)
(deftest >6 (> -4 3) nil)
(deftest >7 (> 4 -5) t)
(deftest >rat1 (> (float 5/7) (float 5/7)) nil)
(deftest >rat2 (> (float 5/7) 5/7) t)
(deftest >rat3 (> (rational (float 5/7)) 5/7) t)
(deftest >rat4 (> (float 5/7 1.0d0) 5/7) t)
(deftest >rat5 (> (rational (float 5/7 1.0d0)) 5/7) t)
(deftest >big1 (> #x123456789 #x123456789) nil)
(deftest >big2 (> #x123456789 #x-123456789) t)
(deftest >big3 (> #x-123456789 #x-123456789) nil)
(deftest >big4 (> #x-123456789 #x123456789) nil)
(deftest >big-single1 (> (rational (float #x123456789 1.0f0))
			  (float #x123456789 1.0f0)) nil)
(deftest >big-single2 (> (rational (float #x-123456789 1.0f0))
			  (float #x123456789 1.0f0)) nil)
(deftest >big-single3 (> (rational (float #x-123456789 1.0f0))
			  (float #x-123456789 1.0f0)) nil)
(deftest >big-single4 (> (rational (float #x123456789 1.0f0))
			  (float #x-123456789 1.0f0)) t)
(deftest >big-double1 (> (rational (float #x123456789 1.0d0))
			  (float #x123456789 1.0d0)) nil)
(deftest >big-double2 (> (rational (float #x-123456789 1.0d0))
			  (float #x123456789 1.0d0)) nil)
(deftest >big-double3 (> (rational (float #x-123456789 1.0d0))
			  (float #x-123456789 1.0d0)) nil)
(deftest >big-double4 (> (rational (float #x123456789 1.0d0))
			  (float #x-123456789 1.0d0)) t)

;;; <=
(deftest <=1 (<= 3 5) t)
(deftest <=2 (<= 3 -5) nil)
(deftest <=3 (<= 3 3) t)
(deftest <=4 (<= 3 3.0f0) t)
(deftest <=5 (<= -0.0 0.0) t)
(deftest <=rat1 (<= 5/7 5/7) t)
(deftest <=rat2 (<= (float 5/7) (float 5/7)) t)
(deftest <=rat3 (<= 5/7 (float 5/7)) t)
(deftest <=rat4 (<= 5/7 (rational (float 5/7))) t)
(deftest <=rat5 (<= 5/7 (float 5/7 1.0d0)) t)
(deftest <=rat6 (<= 5/7 (rational (float 5/7 1.0d0))) t)
(deftest <=big1 (<= #x123456789 #x123456789) t)
(deftest <=big2 (<= #x123456789 #x-123456789) nil)
(deftest <=big3 (<= #x-123456789 #x-123456789) t)
(deftest <=big4 (<= #x-123456789 #x123456789) t)
(deftest <=big-single1 (<= (rational (float #x123456789 1.0f0))
			   (float #x123456789 1.0f0)) t)
(deftest <=big-single2 (<= (rational (float #x-123456789 1.0f0))
			   (float #x123456789 1.0f0)) t)
(deftest <=big-single3 (<= (rational (float #x-123456789 1.0f0))
			   (float #x-123456789 1.0f0)) t)
(deftest <=big-single4 (<= (rational (float #x123456789 1.0f0))
			   (float #x-123456789 1.0f0)) nil)
(deftest <=big-double1 (<= (rational (float #x123456789 1.0d0))
			   (float #x123456789 1.0d0)) t)
(deftest <=big-double2 (<= (rational (float #x-123456789 1.0d0))
			   (float #x123456789 1.0d0)) t)
(deftest <=big-double3 (<= (rational (float #x-123456789 1.0d0))
			   (float #x-123456789 1.0d0)) t)
(deftest <=big-double4 (<= (rational (float #x123456789 1.0d0))
			   (float #x-123456789 1.0d0)) nil)

;;; >=
(deftest >=1 (>= 4 3) t)
(deftest >=2 (>= -4 -3) nil)
(deftest >=3 (>= 3 3) t)
(deftest >=4 (>= 3 3.0f0) t)
(deftest >=5 (>= 0.0 -0.0) t)
(deftest >=6 (>= -4 3) nil)
(deftest >=7 (>= 4 -5) t)
(deftest >=rat1 (>= (float 5/7) (float 5/7)) t)
(deftest >=rat2 (>= (float 5/7) 5/7) t)
(deftest >=rat3 (>= (rational (float 5/7)) 5/7) t)
(deftest >=rat4 (>= (float 5/7 1.0d0) 5/7) t)
(deftest >=rat5 (>= (rational (float 5/7 1.0d0)) 5/7) t)
(deftest >=big1 (>= #x123456789 #x123456789) t)
(deftest >=big2 (>= #x123456789 #x-123456789) t)
(deftest >=big3 (>= #x-123456789 #x-123456789) t)
(deftest >=big4 (>= #x-123456789 #x123456789) nil)
(deftest >=big-single1 (>= (rational (float #x123456789 1.0f0))
			   (float #x123456789 1.0f0)) t)
(deftest >=big-single2 (>= (rational (float #x-123456789 1.0f0))
			   (float #x123456789 1.0f0)) nil)
(deftest >=big-single3 (>= (rational (float #x-123456789 1.0f0))
			   (float #x-123456789 1.0f0)) t)
(deftest >=big-single4 (>= (rational (float #x123456789 1.0f0))
			   (float #x-123456789 1.0f0)) t)
(deftest >=big-double1 (>= (rational (float #x123456789 1.0d0))
			   (float #x123456789 1.0d0)) t)
(deftest >=big-double2 (>= (rational (float #x-123456789 1.0d0))
			   (float #x123456789 1.0d0)) nil)
(deftest >=big-double3 (>= (rational (float #x-123456789 1.0d0))
			   (float #x-123456789 1.0d0)) t)
(deftest >=big-double4 (>= (rational (float #x123456789 1.0d0))
			   (float #x-123456789 1.0d0)) t)

;;; MAX
(deftest max1 (max 3) 3)
(deftest max2 (max 6 12) 12)
(deftest max3 (max -6 -12) -6)
(deftest max4 (max 1 3 2 -7) 3)
(deftest max5 (max -2 3 0 7) 7)
(deftest max6 (max 5.0f0 2) 5.0f0)
(deftest max7 (= (max 3.0 7 1) 7) t)
(deftest max8 (max 1.0s0 7.0d0) 7.0d0)
(deftest max9 (= (max 3 1 1.0s0 1.0d0) 3) t)
(deftest max10 (max 27/4 2 4) 27/4)
(deftest max11 (= (max 27/4 2 4.0f0) 27/4) t)

;;; MIN
(deftest min1 (min 3) 3)
(deftest min2 (min 6 12) 6)
(deftest min3 (min -6 -12) -12)
(deftest min4 (min 1 3 2 -7) -7)
(deftest min5 (min -2 3 0 7) -2)
(deftest min6 (= (min 5.0f0 2) 2) t)
(deftest min7 (= (min 3.0d0 7 1) 1) t)
(deftest min8 (= (min 1.0s0 7.0d0) 1.0s0) t)
(deftest min9 (= (min 3 1 1.0s0 1.0d0) 1) t)
(deftest min10 (min -27/4 -2 -4) -27/4)
(deftest min11 (= (min -27/4 -2 -4.0f0) -27/4) t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 12.4 ARITHMETIC OPERATIONS                                   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; + 
(deftest +integer1 (+ 1 2) 3)
(deftest +integer2 (+ -1 -2) -3)
(deftest +integer3 (+ 1 -2) -1)
(deftest +integer4 (+ -1 2) 1)

(deftest +single1 (+ 1.0f0 2.0f0) 3.0f0)
(deftest +single2 (+ -1.0f0 -2.0f0) -3.0f0)
(deftest +single3 (+ 1.0f0 -2.0f0) -1.0f0)
(deftest +single4 (+ -1.0f0 2.0f0) 1.0f0)

(deftest +single-int1 (+ 1.0f0 2) 3.0f0)
(deftest +single-int2 (+ -1.0f0 -2) -3.0f0)
(deftest +single-int3 (+ 1.0f0 -2) -1.0f0)
(deftest +single-int4 (+ -1.0f0 2) 1.0f0)

(deftest +int-single1 (+ 1 2.0f0) 3.0f0)
(deftest +int-single2 (+ -1 -2.0f0) -3.0f0)
(deftest +int-single3 (+ 1 -2.0f0) -1.0f0)
(deftest +int-single4 (+ -1 2.0f0) 1.0f0)

(deftest +double1 (+ 1.0d0 2.0d0) 3.0d0)
(deftest +double2 (+ -1.0d0 -2.0d0) -3.0d0)
(deftest +double3 (+ 1.0d0 -2.0d0) -1.0d0)
(deftest +double4 (+ -1.0d0 2.0d0) 1.0d0)

(deftest +double-int1 (+ 1.0d0 2) 3.0d0)
(deftest +double-int2 (+ -1.0d0 -2) -3.0d0)
(deftest +double-int3 (+ 1.0d0 -2) -1.0d0)
(deftest +double-int4 (+ -1.0d0 2) 1.0d0)

(deftest +int-double1 (+ 1 2.0d0) 3.0d0)
(deftest +int-double2 (+ -1 -2.0d0) -3.0d0)
(deftest +int-double3 (+ 1 -2.0d0) -1.0d0)
(deftest +int-double4 (+ -1 2.0d0) 1.0d0)

(deftest +single-double1 (+ 1.0f0 2.0d0) 3.0d0)
(deftest +single-double2 (+ -1.0f0 -2.0d0) -3.0d0)
(deftest +single-double3 (+ 1.0f0 -2.0d0) -1.0d0)
(deftest +single-double4 (+ -1.0f0 2.0d0) 1.0d0)

(deftest +double-single1 (+ 1.0d0 2.0f0) 3.0d0)
(deftest +double-single2 (+ -1.0d0 -2.0f0) -3.0d0)
(deftest +double-single3 (+ 1.0d0 -2.0f0) -1.0d0)
(deftest +double-single4 (+ -1.0d0 2.0f0) 1.0d0)

(deftest +rat1 (+ 31/100 69/100) 1)
(deftest +rat2 (+ 1/2 2/3) 7/6) 
(deftest +rat3 (+ 1/2 -2/3) -1/6) 
(deftest +rat4 (+ -1/2 -2/3) -7/6) 
(deftest +rat5 (+ -1/2 2/3) 1/6) 
(deftest +rat-float1 (+ 1/5 0.8f0) 1.0f0)

(deftest +int-a (+ 0 3) 3)
(deftest +int-b (+ 0 -3) -3)
(deftest +int-c (+ -2 0) -2)
(deftest +int-d (+ 2 0) 2)

(deftest +complex-int1 (+ #c(1 2) #c(3 4)) #c(4 6))
(deftest +complex-int2 (+ #c(1 2) #c(3 -4)) #c(4 -2))
(deftest +complex-int3 (+ #c(-1 2) #c(3 -4)) #c(2 -2))
(deftest +complex-single1 (+ #c(1.0f0 2) #c(3 4)) #c(4 6.0f0))
(deftest +complex-single2 (+ #c(1 2) #c(3.0f0 -4)) #c(4 -2.0f0))
(deftest +complex-single3 (+ #c(-1 2.0f0) #c(3 -4)) #c(2 -2.0f0))
(deftest +complex-double1 (+ #c(1.0d0 2) #c(3 4)) #c(4 6.0d0))
(deftest +complex-double2 (+ #c(1 2) #c(3.0d0 -4)) #c(4 -2.0d0))
(deftest +complex-double3 (+ #c(-1 2.0d0) #c(3 -4)) #c(2 -2.0d0))
(deftest +integer-complex (+ -3 #c(2 4)) #c(-1 4))
(deftest +single-complex (+ -3.0f0 #c(2 4)) #c(-1.0f0 4.0f0))
(deftest +big-complex (+ #x-fafaa5a53 #c(2 4)) #c(#x-fafaa5a51 4))

(defparameter long-max 2147483647)
(defparameter short-digit-max 65535)
(deftest +big-a (+ long-max 1) 2147483648)
(deftest +big-b (+ long-max 2) 2147483649)
(deftest +big-c (+ (- long-max) -1) -2147483648)
(deftest +big-d (+ (- long-max) -2) -2147483649)
(deftest +big-e (+ (- long-max) long-max) 0)
(deftest +big-f (+ (- long-max) (- long-max)) -4294967294)

;;; - 
(deftest -integer1 (- 1 2) -1)
(deftest -integer2 (- -1 -2) 1)
(deftest -integer3 (- 1 -2) 3)
(deftest -integer4 (- -1 2) -3)

(deftest -single1 (- 1.0f0 2.0f0) -1.0f0)
(deftest -single2 (- -1.0f0 -2.0f0) 1.0f0)
(deftest -single3 (- 1.0f0 -2.0f0) 3.0f0)
(deftest -single4 (- -1.0f0 2.0f0) -3.0f0)

(deftest -single-int1 (- 1.0f0 2) -1.0f0)
(deftest -single-int2 (- -1.0f0 -2) 1.0f0)
(deftest -single-int3 (- 1.0f0 -2) 3.0f0)
(deftest -single-int4 (- -1.0f0 2) -3.0f0)

(deftest -int-single1 (- 1 2.0f0) -1.0f0)
(deftest -int-single2 (- -1 -2.0f0) 1.0f0)
(deftest -int-single3 (- 1 -2.0f0) 3.0f0)
(deftest -int-single4 (- -1 2.0f0) -3.0f0)

(deftest -double1 (- 1.0d0 2.0d0) -1.0d0)
(deftest -double2 (- -1.0d0 -2.0d0) 1.0d0)
(deftest -double3 (- 1.0d0 -2.0d0) 3.0d0)
(deftest -double4 (- -1.0d0 2.0d0) -3.0d0)

(deftest -double-int1 (- 1.0d0 2) -1.0d0)
(deftest -double-int2 (- -1.0d0 -2) 1.0d0)
(deftest -double-int3 (- 1.0d0 -2) 3.0d0)
(deftest -double-int4 (- -1.0d0 2) -3.0d0)

(deftest -int-double1 (- 1 2.0d0) -1.0d0)
(deftest -int-double2 (- -1 -2.0d0) 1.0d0)
(deftest -int-double3 (- 1 -2.0d0) 3.0d0)
(deftest -int-double4 (- -1 2.0d0) -3.0d0)

(deftest -single-double1 (- 1.0f0 2.0d0) -1.0d0)
(deftest -single-double2 (- -1.0f0 -2.0d0) 1.0d0)
(deftest -single-double3 (- 1.0f0 -2.0d0) 3.0d0)
(deftest -single-double4 (- -1.0f0 2.0d0) -3.0d0)

(deftest -double-single1 (- 1.0d0 2.0f0) -1.0d0)
(deftest -double-single2 (- -1.0d0 -2.0f0) 1.0d0)
(deftest -double-single3 (- 1.0d0 -2.0f0) 3.0d0)
(deftest -double-single4 (- -1.0d0 2.0f0) -3.0d0)

(deftest -rat1 (- 131/100 31/100) 1)
(deftest -rat-a (- 1/2 2/3) -1/6) 
(deftest -rat-b (- 1/2 -2/3) 7/6) 
(deftest -rat-c (- -1/2 -2/3) 1/6) 
(deftest -rat-d (- -1/2 2/3) -7/6) 
(deftest -rat-e (- 31/100 171/100) -7/5)

(deftest -int-a (- 0 3) -3)
(deftest -int-b (- 0 -3) 3)
(deftest -int-c (- -2 0) -2)
(deftest -int-d (- 2 0) 2)

(deftest -complex-int1 (- #c(1 2) #c(3 4)) #c(-2 -2))
(deftest -complex-int2 (- #c(1 2) #c(3 -4)) #c(-2 6))
(deftest -complex-int3 (- #c(-1 2) #c(3 -4)) #c(-4 6))
(deftest -complex-int4 (- #c(100 45) #c(0 45)) 100)
(deftest -complex-single1 (- #c(1.0f0 2) #c(3 4)) #c(-2.0f0 -2.0f0))
(deftest -complex-single2 (- #c(1 2) #c(3.0f0 -4)) #c(-2.0f0 6.0f0))
(deftest -complex-single3 (- #c(-1 2.0f0) #c(3 -4)) #c(-4.0f0 6.0f0))
(deftest -complex-double1 (- #c(1.0d0 2) #c(3 4)) #c(-2.0d0 -2.0))
(deftest -complex-double2 (- #c(1 2) #c(3.0d0 -4)) #c(-2.0d0 6.0))
(deftest -complex-double3 (- #c(-1 2.0d0) #c(3 -4)) #c(-4.0d0 6.0))
(deftest -integer-complex (- -3 #c(2 4)) #c(-5 -4))
(deftest -single-complex (- -3.0f0 #c(2 4)) #c(-5.0f0 -4.0f0))
(deftest -big-complex (- #x-fafaa5a53 #c(2 4)) #c(#x-fafaa5a55 -4))

(deftest -big-a (- long-max -1) 2147483648)
(deftest -big-b (- long-max -2) 2147483649)
(deftest -big-c (- (- long-max) 1) -2147483648)
(deftest -big-d (- (- long-max) 2) -2147483649)
(deftest -big-e (- long-max long-max) 0)
(deftest -big-f (- (- long-max) long-max) -4294967294)

;;; * 
(deftest *integer1 (* 3 2) 6)
(deftest *integer2 (* -3 -2) 6)
(deftest *integer3 (* 3 -2) -6)
(deftest *integer4 (* -3 2) -6)

(deftest *single1 (* 3.0f0 2.0f0) 6.0f0)
(deftest *single2 (* -3.0f0 -2.0f0) 6.0f0)
(deftest *single3 (* 3.0f0 -2.0f0) -6.0f0)
(deftest *single4 (* -3.0f0 2.0f0) -6.0f0)

(deftest *single-int1 (* 3.0f0 2) 6.0f0)
(deftest *single-int2 (* -3.0f0 -2) 6.0f0)
(deftest *single-int3 (* 3.0f0 -2) -6.0f0)
(deftest *single-int4 (* -3.0f0 2) -6.0f0)

(deftest *int-single1 (* 3 2.0f0) 6.0f0)
(deftest *int-single2 (* -3 -2.0f0) 6.0f0)
(deftest *int-single3 (* 3 -2.0f0) -6.0f0)
(deftest *int-single4 (* -3 2.0f0) -6.0f0)

(deftest *double1 (* 3.0d0 2.0d0) 6.0d0)
(deftest *double2 (* -3.0d0 -2.0d0) 6.0d0)
(deftest *double3 (* 3.0d0 -2.0d0) -6.0d0)
(deftest *double4 (* -3.0d0 2.0d0) -6.0d0)

(deftest *double-int1 (* 3.0d0 2) 6.0d0)
(deftest *double-int2 (* -3.0d0 -2) 6.0d0)
(deftest *double-int3 (* 3.0d0 -2) -6.0d0)
(deftest *double-int4 (* -3.0d0 2) -6.0d0)

(deftest *int-double1 (* 3 2.0d0) 6.0d0)
(deftest *int-double2 (* -3 -2.0d0) 6.0d0)
(deftest *int-double3 (* 3 -2.0d0) -6.0d0)
(deftest *int-double4 (* -3 2.0d0) -6.0d0)

(deftest *single-double1 (* 3.0f0 2.0d0) 6.0d0)
(deftest *single-double2 (* -3.0f0 -2.0d0) 6.0d0)
(deftest *single-double3 (* 3.0f0 -2.0d0) -6.0d0)
(deftest *single-double4 (* -3.0f0 2.0d0) -6.0d0)

(deftest *double-single1 (* 3.0d0 2.0f0) 6.0d0)
(deftest *double-single2 (* -3.0d0 -2.0f0) 6.0d0)
(deftest *double-single3 (* 3.0d0 -2.0f0) -6.0d0)
(deftest *double-single4 (* -3.0d0 2.0f0) -6.0d0)

(deftest *rat-a (* 1/2 2/3) 1/3) 
(deftest *rat-b (* 1/2 -2/3) -1/3) 
(deftest *rat-c (* -1/2 -2/3) 1/3) 
(deftest *rat-d (* -1/2 2/3) -1/3) 
(deftest *rat-e (* 2/7 -21/2) -3)

(deftest *int-a (* 0 3) 0)
(deftest *int-b (* 0 -3) 0)
(deftest *int-c (* -2 0) 0)
(deftest *int-d (* 2 0) 0)

(deftest *complex-int1 (* #c(1 2) #c(3 4)) #c(-5 10))
(deftest *complex-int2 (* #c(1 2) #c(3 -4)) #c(11 2))
(deftest *complex-int3 (* #c(-1 2) #c(3 -4)) #c(5 10))
(deftest *complex-single1 (* #c(1.0f0 2) #c(3 4)) #c(-5.0f0 10.0f0))
(deftest *complex-single2 (* #c(1 2) #c(3.0f0 -4)) #c(11.0f0 2.0f0))
(deftest *complex-single3 (* #c(-1 2.0f0) #c(3 -4)) #c(5.0f0 10.0f0))
(deftest *complex-double1 (* #c(1.0d0 2) #c(3 4)) #c(-5.0d0 10.0))
(deftest *complex-double2 (* #c(1 2) #c(3.0d0 -4)) #c(11.0d0 2.0))
(deftest *complex-double3 (* #c(-1 2.0d0) #c(3 -4)) #c(5.0d0 10.0))
(deftest *integer-complex (* -3 #c(2 4)) #c (-6 -12))
(deftest *single-complex (* -3.0f0 #c(2 4)) #c (-6.0f0 -12.0f0))
(deftest *big-complex (* #x-fafaa5a53 #c(2 4)) #c(#x-1f5f54b4a6 #x-3ebea9694c))

(deftest mult-big-a (* short-digit-max short-digit-max) 4294836225)
(deftest mult-big-b (* (1+ short-digit-max) short-digit-max) 4294901760)
(deftest mult-big-c (* (+ 2 short-digit-max) short-digit-max) 4294967295)
(deftest mult-big-d (* long-max short-digit-max) 140735340806145)
(deftest mult-big-e (* (+ long-max long-max) short-digit-max)
  281470681612290)
(deftest mult-big-f (* long-max long-max) 4611686014132420609)
(deftest mult-big-g (+ (* long-max long-max) 1) 4611686014132420610)
(deftest mult-big-h (+ (* long-max long-max) -1) 4611686014132420608)

;;; /
(deftest div1 (/ 12 4) 3)
(deftest div2 (/ 13 4) 13/4)
(deftest div3 (/ 1 -8) -1/8)
(deftest div4 (/ 1 0.5f0) 2.0f0)
(deftest div5 (/ 20 5) 4)
(deftest div6 (/ 5 20) 1/4)
(deftest div7 (/ 2 #c(2 2)) #c(1/2 -1/2))

(deftest div-int-a (/ 1 2) 1/2)
(deftest div-int-b (/ 1 -2) -1/2)
(deftest div-int-c (/ -1 -2) 1/2)
(deftest div-int-d (/ -1 2) -1/2)
(deftest div-int-e (/ 3 2) 3/2)
(deftest div-int-f (/ 3 -2) -3/2)
(deftest div-int-g (/ -3 -2) 3/2)
(deftest div-int-h (/ -3 2) -3/2)
(deftest div-int-i (/ 2 1) 2)
(deftest div-int-j (/ -2 1) -2)
(deftest div-int-k (/ -2 -1) 2)
(deftest div-int-l (/ 2 -1) -2)
(deftest div-int-m (/ 0 2) 0)
(deftest div-int-n (/ 0 -2) 0)
(deftest div-int-o (/ 4 2) 2)
(deftest div-int-p (/ 4 -2) -2)
(deftest div-int-q (/ -4 -2) 2)
(deftest div-int-r (/ -4 2) -2)
(deftest div-int-s (/ 2 4) 1/2)
(deftest div-int-t (/ 2 -4) -1/2)
(deftest div-int-u (/ -2 -4) 1/2)
(deftest div-int-v (/ -2 4) -1/2)
(deftest div-int-w (/ 91 49) 13/7)
(deftest div-int-x (/ 91 -49) -13/7)
(deftest div-int-y (/ -91 -49) 13/7)
(deftest div-int-z (/ -91 49) -13/7)

(deftest div-single-e (/ 3.0f0 2) 1.5f0)
(deftest div-single-f (/ 3 -2.0f0) -1.5f0)
(deftest div-single-g (/ -3.0f0 -2) 1.5f0)
(deftest div-single-h (/ -3 2.0f0) -1.5f0)
(deftest div-double-e (/ 3.0d0 2) 1.5d0)
(deftest div-double-f (/ 3 -2.0d0) -1.5d0)
(deftest div-double-g (/ -3.0d0 -2) 1.5d0)
(deftest div-double-h (/ -3 2.0d0) -1.5d0)

(deftest div-rat-a (/ 1/2 2/3) 3/4)
(deftest div-rat-b (/ 1/2 -2/3) -3/4) 
(deftest div-rat-c (/ -1/2 -2/3) 3/4) 
(deftest div-rat-d (/ -1/2 2/3) -3/4) 
(deftest div-rat-e (/ 2/7 -2/21) -3)

(deftest div-complex1 (/ #c(1 2) #c(3 4)) #c(11/25 2/25))
(deftest div-complex2 (/ #c(1 2) #c(3.0f0 4)) #c(0.44f0 0.08f0))

(deftest div-integer-a (let ((n (/ long-max #xFFFF)))
			 (values (numerator n) (denominator n)))
  2147483647 65535)
(deftest div-integer-b (let ((n (/ (* long-max long-max)
				   #xFFFF)))
			 (values (numerator n) (denominator n)))
  4611686014132420609 65535)
(deftest div-integer-c (let ((n (/ (* long-max long-max)
					   long-max)))
			 (values (numerator n) (denominator n)))
  2147483647 1)
(deftest div-integer-d (let ((n (/ (* long-max long-max)
					     #x10000)))
			 (values (numerator n) (denominator n)))
  4611686014132420609 65536)

(deftest div-integer-e
  (let ((n (/ #x12345678a #x123456789)))
    (values (numerator n) (denominator n)))
  #x12345678a #x123456789)


;;; 1+
(deftest 1+a (1+ 99) 100)
(deftest 1+b (1+ (complex 0.0f0)) #c(1.0f0 0.0f0))

;;; 1-
(deftest 1-a (1- 100) 99)
(deftest 1-b (1- 5/3) 2/3)

;;; CONJUGATE
(deftest conjugate1 (conjugate #c(0 -1)) #c(0 1))
(deftest conjugate2 (conjugate #c(1 1)) #c(1 -1))
(deftest conjugate3 (conjugate 1.5f0) 1.5f0)
(deftest conjugate4 (conjugate #c(3/5 4/5)) #c(3/5 -4/5))
(deftest conjugate5 (conjugate #c(0.0d0 -1.0d0)) #c(0.0d0 1.0d0))
(deftest conjugate6 (conjugate 3.7d0) 3.7d0)

;;; GCD
(deftest gcd1 (gcd) 0)
(deftest gcd2 (gcd 60 42) 6)
(deftest gcd3 (gcd 3333 -33 101) 1)
(deftest gcd4 (gcd 3333 -33 1002001) 11)
(deftest gcd5 (gcd 91 -49) 7)
(deftest gcd6 (gcd 63 -42 35) 7)
(deftest gcd7 (gcd 5) 5)
(deftest gcd8 (gcd -4) 4)
(deftest gcd9 (gcd #x800000000 #x-200000000) #x200000000)

;;; LCM
(deftest lcm1 (lcm 10) 10)
(deftest lcm2 (lcm 25 30) 150)
(deftest lcm3 (lcm -24 18 10) 360)
(deftest lcm4 (lcm 14 35) 70)
(deftest lcm5 (lcm 0 5) 0)
(deftest lcm6 (lcm 1 2 3 4 5 6) 60)
(deftest lcm7 (lcm) 1)
(deftest lcm8 (lcm #x30000000 #x20000000) #x60000000)


