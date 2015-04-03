;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 12.7 LOGICAL OPERATIONS ON NUMBERS                           ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BOOLE
(defparameter fix-a #b0011)
(defparameter fix-b #b0101)
(deftest boole-fix-clr (boole boole-clr fix-a fix-b)	0)
(deftest boole-fix-set (boole boole-set fix-a fix-b)	-1)
(deftest boole-fix-1 (boole boole-1 fix-a fix-b)	#b0011)
(deftest boole-fix-2 (boole boole-2 fix-a fix-b)	#b0101)
(deftest boole-fix-c1 (boole boole-c1 fix-a fix-b)	#.(lognot #b0011))
(deftest boole-fix-c2 (boole boole-c2 fix-a fix-b)	#.(lognot #b0101))
(deftest boole-fix-and (boole boole-and fix-a fix-b)	#b0001)
(deftest boole-fix-ior (boole boole-ior fix-a fix-b)	#b0111)
(deftest boole-fix-xor (boole boole-xor fix-a fix-b)	#b0110)
(deftest boole-fix-eqv (boole boole-eqv fix-a fix-b)	#.(lognot #b0110))
(deftest boole-fix-nand (boole boole-nand fix-a fix-b)#.(lognot #b0001))
(deftest boole-fix-nor (boole boole-nor fix-a fix-b)	#.(lognot #b0111))
(deftest boole-fix-andc1 (boole boole-andc1 fix-a fix-b)	#b0100)
(deftest boole-fix-andc2 (boole boole-andc2 fix-a fix-b)	#b0010)
(deftest boole-fix-orc1 (boole boole-orc1 fix-a fix-b)#.(lognot #b0010))
(deftest boole-fix-orc2 (boole boole-orc2 fix-a fix-b)#.(lognot #b0100))

(defparameter big-a #x333333333333)
(defparameter big-b #x555555555555)
(deftest boole-big-clr (boole boole-clr big-a big-b)	0)
(deftest boole-big-set (boole boole-set big-a big-b)	-1)
(deftest boole-big-1 (boole boole-1 big-a big-b)	#x333333333333)
(deftest boole-big-2 (boole boole-2 big-a big-b)	#x555555555555)
(deftest boole-big-c1 (boole boole-c1 big-a big-b)	#.(lognot #x333333333333))
(deftest boole-big-c2 (boole boole-c2 big-a big-b)	#.(lognot #x555555555555))
(deftest boole-big-and (boole boole-and big-a big-b)	#x111111111111)
(deftest boole-big-ior (boole boole-ior big-a big-b)	#x777777777777)
(deftest boole-big-xor (boole boole-xor big-a big-b)	#x666666666666)
(deftest boole-big-eqv (boole boole-eqv big-a big-b)	#.(lognot #x666666666666))
(deftest boole-big-nand (boole boole-nand big-a big-b)#.(lognot #x111111111111))
(deftest boole-big-nor (boole boole-nor big-a big-b)	#.(lognot #x777777777777))
(deftest boole-big-andc1 (boole boole-andc1 big-a big-b)	#x444444444444)
(deftest boole-big-andc2 (boole boole-andc2 big-a big-b)	#x222222222222)
(deftest boole-big-orc1 (boole boole-orc1 big-a big-b)#.(lognot #x222222222222))
(deftest boole-big-orc2 (boole boole-orc2 big-a big-b)#.(lognot #x444444444444))

(deftest boole-mix1-clr (boole boole-clr big-a fix-b)	0)
(deftest boole-mix1-set (boole boole-set big-a fix-b)	-1)
(deftest boole-mix1-1 (boole boole-1 big-a fix-b)	#x333333333333)
(deftest boole-mix1-2 (boole boole-2 big-a fix-b)	#x5)
(deftest boole-mix1-c1 (boole boole-c1 big-a fix-b)	#.(lognot #x333333333333))
(deftest boole-mix1-c2 (boole boole-c2 big-a fix-b)	#.(lognot #x5))
(deftest boole-mix1-and (boole boole-and big-a fix-b)	#x1)
(deftest boole-mix1-ior (boole boole-ior big-a fix-b)	#x333333333337)
(deftest boole-mix1-xor (boole boole-xor big-a fix-b)	#x333333333336)
(deftest boole-mix1-eqv (boole boole-eqv big-a fix-b)	#.(lognot #x333333333336))
(deftest boole-mix1-nand (boole boole-nand big-a fix-b) #.(lognot #x1))
(deftest boole-mix1-nor (boole boole-nor big-a fix-b)	#.(lognot #x333333333337))
(deftest boole-mix1-andc1 (boole boole-andc1 big-a fix-b)	#x4)
(deftest boole-mix1-andc2 (boole boole-andc2 big-a fix-b)	#x333333333332)
(deftest boole-mix1-orc1 (boole boole-orc1 big-a fix-b)#.(lognot #x333333333332))
(deftest boole-mix1-orc2 (boole boole-orc2 big-a fix-b)#.(lognot #x4))

(deftest boole-mix2-clr (boole boole-clr fix-a big-b)	0)
(deftest boole-mix2-set (boole boole-set fix-a big-b)	-1)
(deftest boole-mix2-1 (boole boole-1 fix-a big-b)	#x3)
(deftest boole-mix2-2 (boole boole-2 fix-a big-b)	#x555555555555)
(deftest boole-mix2-c1 (boole boole-c1 fix-a big-b)	#.(lognot #x3))
(deftest boole-mix2-c2 (boole boole-c2 fix-a big-b)	#.(lognot #x555555555555))
(deftest boole-mix2-and (boole boole-and fix-a big-b)	#x1)
(deftest boole-mix2-ior (boole boole-ior fix-a big-b)	#x555555555557)
(deftest boole-mix2-xor (boole boole-xor fix-a big-b)	#x555555555556)
(deftest boole-mix2-eqv (boole boole-eqv fix-a big-b)	#.(lognot #x555555555556))
(deftest boole-mix2-nand (boole boole-nand fix-a big-b)#.(lognot #x1))
(deftest boole-mix2-nor (boole boole-nor fix-a big-b)	#.(lognot #x555555555557))
(deftest boole-mix2-andc1 (boole boole-andc1 fix-a big-b)	#x555555555554)
(deftest boole-mix2-andc2 (boole boole-andc2 fix-a big-b)	#x2)
(deftest boole-mix2-orc1 (boole boole-orc1 fix-a big-b)#.(lognot #x2))
(deftest boole-mix2-orc2 (boole boole-orc2 fix-a big-b)#.(lognot #x555555555554))

(deftest boole-big-1-clr (boole boole-clr big-a -1)	0)
(deftest boole-big-1-set (boole boole-set big-a -1)	-1)
(deftest boole-big-1-1 (boole boole-1 big-a -1)	#x333333333333)
(deftest boole-big-1-2 (boole boole-2 big-a -1)	-1)
(deftest boole-big-1-c1 (boole boole-c1 big-a -1)	#.(lognot #x333333333333))
(deftest boole-big-1-c2 (boole boole-c2 big-a -1)	0)
(deftest boole-big-1-and (boole boole-and big-a -1)	#x333333333333)
(deftest boole-big-1-ior (boole boole-ior big-a -1)	-1)
(deftest boole-big-1-xor (boole boole-xor big-a -1)	#.(lognot #x333333333333))
(deftest boole-big-1-eqv (boole boole-eqv big-a -1)	#x333333333333)
(deftest boole-big-1-nand (boole boole-nand big-a -1)	#.(lognot #x333333333333))
(deftest boole-big-1-nor (boole boole-nor big-a -1)	0)
(deftest boole-big-1-andc1 (boole boole-andc1 big-a -1) #.(lognot #x333333333333))
(deftest boole-big-1-andc2 (boole boole-andc2 big-a -1)	0)
(deftest boole-big-1-orc1 (boole boole-orc1 big-a -1) -1)
(deftest boole-big-1-orc2 (boole boole-orc2 big-a -1) #x333333333333)

(deftest boole-1-bigclr (boole boole-clr -1 big-b)	0)
(deftest boole-1-bigset (boole boole-set -1 big-b)	-1)
(deftest boole-1-big1 (boole boole-1 -1 big-b)	-1)
(deftest boole-1-big2 (boole boole-2 -1 big-b)	#x555555555555)
(deftest boole-1-bigc1 (boole boole-c1 -1 big-b)	0)
(deftest boole-1-bigc2 (boole boole-c2 -1 big-b)	#.(lognot #x555555555555))
(deftest boole-1-bigand (boole boole-and -1 big-b)	#x555555555555)
(deftest boole-1-bigior (boole boole-ior -1 big-b)	-1)
(deftest boole-1-bigxor (boole boole-xor -1 big-b)	#.(lognot #x555555555555))
(deftest boole-1-bigeqv (boole boole-eqv -1 big-b)	#x555555555555)
(deftest boole-1-bignand (boole boole-nand -1 big-b)	#.(lognot #x555555555555))
(deftest boole-1-bignor (boole boole-nor -1 big-b)	0)
(deftest boole-1-bigandc1 (boole boole-andc1 -1 big-b)0)
(deftest boole-1-bigandc2 (boole boole-andc2 -1 big-b)#.(lognot #x555555555555))
(deftest boole-1-bigorc1 (boole boole-orc1 -1 big-b)	#x555555555555)
(deftest boole-1-bigorc2 (boole boole-orc2 -1 big-b)	-1)

;;; LOGIOR, LOGXOR, LOGAND, LOGEQV, LOGNAND, LOGNOR, LOGANDC1, LOGANDC2, LOGORC1, LOGORC2
(deftest logand0 (logand) -1)
(deftest logand4 (logand #b0101 #b0111 #b1111 #b1011) #b0001)
(deftest logeqv0 (logeqv) -1)
(deftest logeqv4 (logeqv #b0101 #b0111 #b1111 #b1011) -7)
(deftest logior0 (logior) 0)
(deftest logior4 (logior 1 2 4 8) 15)
(deftest logxor0 (logxor) 0)
(deftest logxor4 (logxor 1 3 7 15) 10)

(deftest logand-fix (logand fix-a fix-b)	#b0001)
(deftest logior-fix (logior fix-a fix-b)	#b0111)
(deftest logxor-fix (logxor fix-a fix-b)	#b0110)
(deftest logeqv-fix (logeqv fix-a fix-b)	#.(lognot #b0110))
(deftest lognand-fix (lognand fix-a fix-b)#.(lognot #b0001))
(deftest lognor-fix (lognor fix-a fix-b)	#.(lognot #b0111))
(deftest logandc1-fix (logandc1 fix-a fix-b)	#b0100)
(deftest logandc2-fix (logandc2 fix-a fix-b)	#b0010)
(deftest logorc1-fix (logorc1 fix-a fix-b)#.(lognot #b0010))
(deftest logorc2-fix (logorc2 fix-a fix-b)#.(lognot #b0100))

(deftest logand-big (logand big-a big-b)	#x111111111111)
(deftest logior-big (logior big-a big-b)	#x777777777777)
(deftest logxor-big (logxor big-a big-b)	#x666666666666)
(deftest logeqv-big (logeqv big-a big-b)	#.(lognot #x666666666666))
(deftest lognand-big (lognand big-a big-b)#.(lognot #x111111111111))
(deftest lognor-big (lognor big-a big-b)	#.(lognot #x777777777777))
(deftest logandc1-big (logandc1 big-a big-b)	#x444444444444)
(deftest logandc2-big (logandc2 big-a big-b)	#x222222222222)
(deftest logorc1-big (logorc1 big-a big-b)#.(lognot #x222222222222))
(deftest logorc2-big (logorc2 big-a big-b)#.(lognot #x444444444444))

(deftest logand-mix1 (logand big-a fix-b)	#x1)
(deftest logior-mix1 (logior big-a fix-b)	#x333333333337)
(deftest logxor-mix1 (logxor big-a fix-b)	#x333333333336)
(deftest logeqv-mix1 (logeqv big-a fix-b)	#.(lognot #x333333333336))
(deftest lognand-mix1 (lognand big-a fix-b) #.(lognot #x1))
(deftest lognor-mix1 (lognor big-a fix-b)	#.(lognot #x333333333337))
(deftest logandc1-mix1 (logandc1 big-a fix-b)	#x4)
(deftest logandc2-mix1 (logandc2 big-a fix-b)	#x333333333332)
(deftest logorc1-mix1 (logorc1 big-a fix-b)#.(lognot #x333333333332))
(deftest logorc2-mix1 (logorc2 big-a fix-b)#.(lognot #x4))

(deftest logand-mix2 (logand fix-a big-b)	#x1)
(deftest logior-mix2 (logior fix-a big-b)	#x555555555557)
(deftest logxor-mix2 (logxor fix-a big-b)	#x555555555556)
(deftest logeqv-mix2 (logeqv fix-a big-b)	#.(lognot #x555555555556))
(deftest lognand-mix2 (lognand fix-a big-b)#.(lognot #x1))
(deftest lognor-mix2 (lognor fix-a big-b)	#.(lognot #x555555555557))
(deftest logandc1-mix2 (logandc1 fix-a big-b)	#x555555555554)
(deftest logandc2-mix2 (logandc2 fix-a big-b)	#x2)
(deftest logorc1-mix2 (logorc1 fix-a big-b)#.(lognot #x2))
(deftest logorc2-mix2 (logorc2 fix-a big-b)#.(lognot #x555555555554))

(deftest logand-big-1 (logand big-a -1)	#x333333333333)
(deftest logior-big-1 (logior big-a -1)	-1)
(deftest logxor-big-1 (logxor big-a -1)	#.(lognot #x333333333333))
(deftest logeqv-big-1 (logeqv big-a -1)	#x333333333333)
(deftest lognand-big-1 (lognand big-a -1)	#.(lognot #x333333333333))
(deftest lognor-big-1 (lognor big-a -1)	0)
(deftest logandc1-big-1 (logandc1 big-a -1) #.(lognot #x333333333333))
(deftest logandc2-big-1 (logandc2 big-a -1)	0)
(deftest logorc1-big-1 (logorc1 big-a -1) -1)
(deftest logorc2-big-1 (logorc2 big-a -1) #x333333333333)

(deftest logand-1-big (logand -1 big-b)	#x555555555555)
(deftest logior-1-big (logior -1 big-b)	-1)
(deftest logxor-1-big (logxor -1 big-b)	#.(lognot #x555555555555))
(deftest logeqv-1-big (logeqv -1 big-b)	#x555555555555)
(deftest lognand-1-big (lognand -1 big-b)	#.(lognot #x555555555555))
(deftest lognor-1-big (lognor -1 big-b)	0)
(deftest logandc1-1-big (logandc1 -1 big-b)0)
(deftest logandc2-1-big (logandc2 -1 big-b)#.(lognot #x555555555555))
(deftest logorc1-1-big (logorc1 -1 big-b)	#x555555555555)
(deftest logorc2-1-big (logorc2 -1 big-b)	-1)

;;; LOGNOT
(deftest lognot0 (lognot 0) -1)
(deftest lognot-1 (lognot 1) -2)
(deftest lognot-minus-1 (lognot -1) 0)
(deftest lognot-cycle (lognot (1+ (lognot 1000))) 999)
(deftest lognot-big (lognot #x3333333333333332) #x-3333333333333333)
(deftest lognot-big2 (lognot #x-3333333333333333) #x3333333333333332)

;;; LOGTEST
(deftest logtest-fix1 (not (logtest 1 7)) nil)
(deftest logtest-fix2 (logtest 1 2) nil)
(deftest logtest-fix3 (not (logtest -2 -1)) nil)
(deftest logtest-fix4 (logtest 0 -1) nil)
(deftest logtest-big-big-nil (logtest #xaaaaaaaaaaaa #x55555555) nil)
(deftest logtest-big-big-t (not (logtest #xaaaaaaaaaaaa #x200000000)) nil)
(deftest logtest-big-fix-nil (logtest #xaaaaaaaaaaa #x5) nil)
(deftest logtest-fix-big-nil (logtest #x5 #xaaaaaaaaaaa) nil)
(deftest logtest-big-fix-t (not (logtest #xaaaaaaaaaaaa #x2)) nil)
(deftest logtest-fix-big-t (not (logtest #x2 #xaaaaaaaaaaaa)) nil)
(deftest logtest-big-minus-1 (not (logtest #x100000000000 -1)) nil)
(deftest logtest-minus-1-big (not (logtest -1 #x100000000000)) nil)

;;; LOGBITP
(deftest logbitp-fix1 (logbitp 1 1) nil)
(deftest logbitp-fix2 (not (logbitp 0 1)) nil)
(deftest logbitp-fix3 (not (logbitp 3 10)) nil)
;; #-(and cmu (not eclipse))
(deftest logbitp-fix4 (not (logbitp #xffffffff -1)) nil)
(deftest logbitp-fix5 (not (logbitp 2 6)) nil)
(deftest logbitp-fix6 (logbitp 0 6) nil)
(deftest logbitp-big1 (not (logbitp 31 #x80000000)) nil)
(deftest logbitp-big2 (logbitp 32 #x80000000) nil)
(deftest logbitp-big3 (logbitp 30 #x80000000) nil)
(deftest logbitp-big4 (not (logbitp 31 #x-80000000)) nil)
(deftest logbitp-big5 (not (logbitp 32 #x-80000000)) nil)
(deftest logbitp-big6 (logbitp 30 #x-80000000) nil)

;;; LOGCOUNT
(deftest logcount-fix-0 (logcount 0) 0)
(deftest logcount-fix-minus-1 (logcount -1) 0)
(deftest logcount-fix-7 (logcount 7) 3)
(deftest logcount-fix-13 (logcount 13) 3)
(deftest logcount-fix-minus-13 (logcount -13) 2)
(deftest logcount-fix-30 (logcount 30) 4)
(deftest logcount-fix-minus-30 (logcount -30) 4)
(deftest logcount-big-a (logcount (expt 2 100)) 1)
(deftest logcount-big-b (logcount (- (expt 2 100))) 100)
(deftest logcount-big-c (logcount (- (1+ (expt 2 100)))) 1)

;;; INTEGER-LENGTH
(deftest integer-length-fix-0 (integer-length 0) 0)
(deftest integer-length-fix-1 (integer-length 1) 1)
(deftest integer-length-fix-3 (integer-length 3) 2)
(deftest integer-length-fix-4 (integer-length 4) 3)
(deftest integer-length-fix-7 (integer-length 7) 3)
(deftest integer-length-fix-minus-1 (integer-length -1) 0)
(deftest integer-length-fix-minus-4 (integer-length -4) 2)
(deftest integer-length-fix-minus-7 (integer-length -7) 3)
(deftest integer-length-fix-minus-8 (integer-length -8) 3)
(deftest integer-length-fix-a (integer-length (expt 2 9)) 10)
(deftest integer-length-fix-b (integer-length (1- (expt 2 9))) 9)
(deftest integer-length-fix-c (integer-length (- (expt 2 9))) 9)
(deftest integer-length-fix-d (integer-length (- (1+ (expt 2 9)))) 10)
(deftest integer-length-big-a (integer-length (expt 2 31)) 32)
(deftest integer-length-big-b (integer-length (1- (expt 2 31))) 31)
(deftest integer-length-big-c (integer-length (- (expt 2 31))) 31)
(deftest integer-length-big-d (integer-length (- (1+ (expt 2 31)))) 32)
(deftest integer-length-big-e (integer-length (expt 2 32)) 33)
(deftest integer-length-big-f (integer-length (1- (expt 2 32))) 32)
(deftest integer-length-big-g (integer-length (- (expt 2 32))) 32)
(deftest integer-length-big-h (integer-length (- (1+ (expt 2 32)))) 33)
(deftest integer-length-big-i (integer-length (expt 2 33)) 34)
(deftest integer-length-big-j (integer-length (1- (expt 2 33))) 33)
(deftest integer-length-big-k (integer-length (- (expt 2 33))) 33)
(deftest integer-length-big-l (integer-length (- (1+ (expt 2 33)))) 34)

