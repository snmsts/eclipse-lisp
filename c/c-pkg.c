/* Generated by Eclipse Common Lisp 1.1-HOSTED on cad0.
   Friday the first of May, 1998, 6:45:31 pm CDT. */
#include <eclipse.h>

clObject clCar(clProto), clCdr(clProto),
  clCharpSimpleBaseString __P((clCharp)), clCons(clProto),
  clEndp(clProto), clExport(clProto), clFindPackage(clProto),
  clIntern(clProto), clMakeKeyword(clProto), clMakePackage(clProto),
  clRenamePackage(clProto);

static clObject CONS_0, CONS_1, CONS_10, CONS_11, CONS_12, CONS_13,
  CONS_14, CONS_15, CONS_16, CONS_17, CONS_18, CONS_19, CONS_2,
  CONS_20, CONS_21, CONS_22, CONS_23, CONS_24, CONS_25, CONS_26,
  CONS_27, CONS_28, CONS_29, CONS_3, CONS_30, CONS_31, CONS_32,
  CONS_33, CONS_34, CONS_35, CONS_36, CONS_37, CONS_38, CONS_39,
  CONS_4, CONS_40, CONS_41, CONS_42, CONS_43, CONS_44, CONS_45,
  CONS_46, CONS_47, CONS_48, CONS_49, CONS_5, CONS_50, CONS_51,
  CONS_52, CONS_53, CONS_54, CONS_55, CONS_56, CONS_57, CONS_58,
  CONS_59, CONS_6, CONS_60, CONS_61, CONS_62, CONS_63, CONS_7, CONS_8,
  CONS_9, I_211, I_62, clEXTERNAL_SIZE, clINTERNAL_SIZE,
  keyNICKNAMES, keyUSE, STR_percent__62, STR_star__66, STR_plus__65,
  STR____64, STR_slash__63, STR_lessequal__58, STR_less__60,
  STR_equalequal__61, STR_greaterequal__57, STR_greater__59,
  STR_ACOSH__28, STR_ACOS__35, STR_AINT__26, STR_ASINH__29,
  STR_ASIN__36, STR_ATAN2__33, STR_ATANH__27, STR_ATAN__34,
  STR_CEIL__25, STR_CHAR__55, STR_COSH__31, STR_COS__38, STR_C__1,
  STR_DOUBLE__49, STR_ECLIPSE_C__0, STR_EC__2, STR_EXIT__7,
  STR_EXP__44, STR_EXTERNAL_SIZE__6, STR_FLOAT__50, STR_FLOOR__24,
  STR_FUNCTION__68, STR_HYPOT__40, STR_INTERNAL_SIZE__5, STR_INT__53,
  STR_ISALNUM__18, STR_ISALPHA__21, STR_ISLOWER__19, STR_ISPRINT__22,
  STR_ISUPPER__20, STR_ISWALNUM__11, STR_ISWALPHA__14,
  STR_ISWLOWER__12, STR_ISWPRINT__15, STR_ISWUPPER__13, STR_LDEXP__23,
  STR_LOG__42, STR_LONG__47, STR_MACRO__67, STR_NICKNAMES__3,
  STR_POW__43, STR_RETURN__45, STR_SHORT__46, STR_SINH__32,
  STR_SIN__39, STR_SLEEP__8, STR_SQRT__41, STR_TANH__30, STR_TAN__37,
  STR_TOLOWER__16, STR_TOUPPER__17, STR_TOWLOWER__9, STR_TOWUPPER__10,
  STR_UNSIGNED__51, STR_USE__4, STR_VA__LIST__48, STR_VOID__56,
  STR_WCHAR__T__54, STR_WINT__T__52;

void clInitCPkg __P((void)) 
{ clDbind(clstarPACKAGEstar);
  clDbind(clstarREADTABLEstar);
  clDbind(clstarLOAD_TRUENAMEstar);
  clDbind(clstarLOAD_PATHNAMEstar);
  clSetq(STR_ECLIPSE_C__0,
         clCharpSimpleBaseString("ECLIPSE-C"));
  clSetq(STR_C__1,
         clCharpSimpleBaseString("C"));
  clSetq(STR_EC__2,
         clCharpSimpleBaseString("EC"));
  clSetq(CONS_1, clCons(STR_EC__2, clNIL, clEOA));
  clSetq(CONS_0, clCons(STR_C__1, CONS_1, clEOA));
  clSetq(STR_NICKNAMES__3,
         clCharpSimpleBaseString("NICKNAMES"));
  clSetq(keyNICKNAMES, clMakeKeyword(STR_NICKNAMES__3, clEOA));
  clSetq(STR_USE__4,
         clCharpSimpleBaseString("USE"));
  clSetq(keyUSE, clMakeKeyword(STR_USE__4, clEOA));
  clSetq(STR_INTERNAL_SIZE__5,
         clCharpSimpleBaseString("INTERNAL-SIZE"));
  clSetq(clINTERNAL_SIZE, clIntern(STR_INTERNAL_SIZE__5, clEOA));
  clSetq(I_211, clIntFixnum(211));
  clSetq(STR_EXTERNAL_SIZE__6,
         clCharpSimpleBaseString("EXTERNAL-SIZE"));
  clSetq(clEXTERNAL_SIZE, clIntern(STR_EXTERNAL_SIZE__6, clEOA));
  clSetq(I_62, clIntFixnum(62));
  clSetq(STR_EXIT__7,
         clCharpSimpleBaseString("EXIT"));
  clSetq(STR_SLEEP__8,
         clCharpSimpleBaseString("SLEEP"));
  clSetq(STR_TOWLOWER__9,
         clCharpSimpleBaseString("TOWLOWER"));
  clSetq(STR_TOWUPPER__10,
         clCharpSimpleBaseString("TOWUPPER"));
  clSetq(STR_ISWALNUM__11,
         clCharpSimpleBaseString("ISWALNUM"));
  clSetq(STR_ISWLOWER__12,
         clCharpSimpleBaseString("ISWLOWER"));
  clSetq(STR_ISWUPPER__13,
         clCharpSimpleBaseString("ISWUPPER"));
  clSetq(STR_ISWALPHA__14,
         clCharpSimpleBaseString("ISWALPHA"));
  clSetq(STR_ISWPRINT__15,
         clCharpSimpleBaseString("ISWPRINT"));
  clSetq(STR_TOLOWER__16,
         clCharpSimpleBaseString("TOLOWER"));
  clSetq(STR_TOUPPER__17,
         clCharpSimpleBaseString("TOUPPER"));
  clSetq(STR_ISALNUM__18,
         clCharpSimpleBaseString("ISALNUM"));
  clSetq(STR_ISLOWER__19,
         clCharpSimpleBaseString("ISLOWER"));
  clSetq(STR_ISUPPER__20,
         clCharpSimpleBaseString("ISUPPER"));
  clSetq(STR_ISALPHA__21,
         clCharpSimpleBaseString("ISALPHA"));
  clSetq(STR_ISPRINT__22,
         clCharpSimpleBaseString("ISPRINT"));
  clSetq(STR_LDEXP__23,
         clCharpSimpleBaseString("LDEXP"));
  clSetq(STR_FLOOR__24,
         clCharpSimpleBaseString("FLOOR"));
  clSetq(STR_CEIL__25,
         clCharpSimpleBaseString("CEIL"));
  clSetq(STR_AINT__26,
         clCharpSimpleBaseString("AINT"));
  clSetq(STR_ATANH__27,
         clCharpSimpleBaseString("ATANH"));
  clSetq(STR_ACOSH__28,
         clCharpSimpleBaseString("ACOSH"));
  clSetq(STR_ASINH__29,
         clCharpSimpleBaseString("ASINH"));
  clSetq(STR_TANH__30,
         clCharpSimpleBaseString("TANH"));
  clSetq(STR_COSH__31,
         clCharpSimpleBaseString("COSH"));
  clSetq(STR_SINH__32,
         clCharpSimpleBaseString("SINH"));
  clSetq(STR_ATAN2__33,
         clCharpSimpleBaseString("ATAN2"));
  clSetq(STR_ATAN__34,
         clCharpSimpleBaseString("ATAN"));
  clSetq(STR_ACOS__35,
         clCharpSimpleBaseString("ACOS"));
  clSetq(STR_ASIN__36,
         clCharpSimpleBaseString("ASIN"));
  clSetq(STR_TAN__37,
         clCharpSimpleBaseString("TAN"));
  clSetq(STR_COS__38,
         clCharpSimpleBaseString("COS"));
  clSetq(STR_SIN__39,
         clCharpSimpleBaseString("SIN"));
  clSetq(STR_HYPOT__40,
         clCharpSimpleBaseString("HYPOT"));
  clSetq(STR_SQRT__41,
         clCharpSimpleBaseString("SQRT"));
  clSetq(STR_LOG__42,
         clCharpSimpleBaseString("LOG"));
  clSetq(STR_POW__43,
         clCharpSimpleBaseString("POW"));
  clSetq(STR_EXP__44,
         clCharpSimpleBaseString("EXP"));
  clSetq(STR_RETURN__45,
         clCharpSimpleBaseString("RETURN"));
  clSetq(STR_SHORT__46,
         clCharpSimpleBaseString("SHORT"));
  clSetq(STR_LONG__47,
         clCharpSimpleBaseString("LONG"));
  clSetq(STR_VA__LIST__48,
         clCharpSimpleBaseString("VA_LIST"));
  clSetq(STR_DOUBLE__49,
         clCharpSimpleBaseString("DOUBLE"));
  clSetq(STR_FLOAT__50,
         clCharpSimpleBaseString("FLOAT"));
  clSetq(STR_UNSIGNED__51,
         clCharpSimpleBaseString("UNSIGNED"));
  clSetq(STR_WINT__T__52,
         clCharpSimpleBaseString("WINT_T"));
  clSetq(STR_INT__53,
         clCharpSimpleBaseString("INT"));
  clSetq(STR_WCHAR__T__54,
         clCharpSimpleBaseString("WCHAR_T"));
  clSetq(STR_CHAR__55,
         clCharpSimpleBaseString("CHAR"));
  clSetq(STR_VOID__56,
         clCharpSimpleBaseString("VOID"));
  clSetq(STR_greaterequal__57,
         clCharpSimpleBaseString(">="));
  clSetq(STR_lessequal__58,
         clCharpSimpleBaseString("<="));
  clSetq(STR_greater__59,
         clCharpSimpleBaseString(">"));
  clSetq(STR_less__60,
         clCharpSimpleBaseString("<"));
  clSetq(STR_equalequal__61,
         clCharpSimpleBaseString("=="));
  clSetq(STR_percent__62,
         clCharpSimpleBaseString("%"));
  clSetq(STR_slash__63,
         clCharpSimpleBaseString("/"));
  clSetq(STR____64,
         clCharpSimpleBaseString("-"));
  clSetq(STR_plus__65,
         clCharpSimpleBaseString("+"));
  clSetq(STR_star__66,
         clCharpSimpleBaseString("*"));
  clSetq(STR_MACRO__67,
         clCharpSimpleBaseString("MACRO"));
  clSetq(STR_FUNCTION__68,
         clCharpSimpleBaseString("FUNCTION"));
  clSetq(CONS_63, clCons(STR_FUNCTION__68, clNIL, clEOA));
  clSetq(CONS_62, clCons(STR_MACRO__67, CONS_63, clEOA));
  clSetq(CONS_61, clCons(STR_star__66, CONS_62, clEOA));
  clSetq(CONS_60, clCons(STR_plus__65, CONS_61, clEOA));
  clSetq(CONS_59, clCons(STR____64, CONS_60, clEOA));
  clSetq(CONS_58, clCons(STR_slash__63, CONS_59, clEOA));
  clSetq(CONS_57, clCons(STR_percent__62, CONS_58, clEOA));
  clSetq(CONS_56, clCons(STR_equalequal__61, CONS_57, clEOA));
  clSetq(CONS_55, clCons(STR_less__60, CONS_56, clEOA));
  clSetq(CONS_54, clCons(STR_greater__59, CONS_55, clEOA));
  clSetq(CONS_53, clCons(STR_lessequal__58, CONS_54, clEOA));
  clSetq(CONS_52, clCons(STR_greaterequal__57, CONS_53, clEOA));
  clSetq(CONS_51, clCons(STR_VOID__56, CONS_52, clEOA));
  clSetq(CONS_50, clCons(STR_CHAR__55, CONS_51, clEOA));
  clSetq(CONS_49, clCons(STR_WCHAR__T__54, CONS_50, clEOA));
  clSetq(CONS_48, clCons(STR_INT__53, CONS_49, clEOA));
  clSetq(CONS_47, clCons(STR_WINT__T__52, CONS_48, clEOA));
  clSetq(CONS_46, clCons(STR_UNSIGNED__51, CONS_47, clEOA));
  clSetq(CONS_45, clCons(STR_FLOAT__50, CONS_46, clEOA));
  clSetq(CONS_44, clCons(STR_DOUBLE__49, CONS_45, clEOA));
  clSetq(CONS_43, clCons(STR_VA__LIST__48, CONS_44, clEOA));
  clSetq(CONS_42, clCons(STR_LONG__47, CONS_43, clEOA));
  clSetq(CONS_41, clCons(STR_SHORT__46, CONS_42, clEOA));
  clSetq(CONS_40, clCons(STR_RETURN__45, CONS_41, clEOA));
  clSetq(CONS_39, clCons(STR_EXP__44, CONS_40, clEOA));
  clSetq(CONS_38, clCons(STR_POW__43, CONS_39, clEOA));
  clSetq(CONS_37, clCons(STR_LOG__42, CONS_38, clEOA));
  clSetq(CONS_36, clCons(STR_SQRT__41, CONS_37, clEOA));
  clSetq(CONS_35, clCons(STR_HYPOT__40, CONS_36, clEOA));
  clSetq(CONS_34, clCons(STR_SIN__39, CONS_35, clEOA));
  clSetq(CONS_33, clCons(STR_COS__38, CONS_34, clEOA));
  clSetq(CONS_32, clCons(STR_TAN__37, CONS_33, clEOA));
  clSetq(CONS_31, clCons(STR_ASIN__36, CONS_32, clEOA));
  clSetq(CONS_30, clCons(STR_ACOS__35, CONS_31, clEOA));
  clSetq(CONS_29, clCons(STR_ATAN__34, CONS_30, clEOA));
  clSetq(CONS_28, clCons(STR_ATAN2__33, CONS_29, clEOA));
  clSetq(CONS_27, clCons(STR_SINH__32, CONS_28, clEOA));
  clSetq(CONS_26, clCons(STR_COSH__31, CONS_27, clEOA));
  clSetq(CONS_25, clCons(STR_TANH__30, CONS_26, clEOA));
  clSetq(CONS_24, clCons(STR_ASINH__29, CONS_25, clEOA));
  clSetq(CONS_23, clCons(STR_ACOSH__28, CONS_24, clEOA));
  clSetq(CONS_22, clCons(STR_ATANH__27, CONS_23, clEOA));
  clSetq(CONS_21, clCons(STR_AINT__26, CONS_22, clEOA));
  clSetq(CONS_20, clCons(STR_CEIL__25, CONS_21, clEOA));
  clSetq(CONS_19, clCons(STR_FLOOR__24, CONS_20, clEOA));
  clSetq(CONS_18, clCons(STR_LDEXP__23, CONS_19, clEOA));
  clSetq(CONS_17, clCons(STR_ISPRINT__22, CONS_18, clEOA));
  clSetq(CONS_16, clCons(STR_ISALPHA__21, CONS_17, clEOA));
  clSetq(CONS_15, clCons(STR_ISUPPER__20, CONS_16, clEOA));
  clSetq(CONS_14, clCons(STR_ISLOWER__19, CONS_15, clEOA));
  clSetq(CONS_13, clCons(STR_ISALNUM__18, CONS_14, clEOA));
  clSetq(CONS_12, clCons(STR_TOUPPER__17, CONS_13, clEOA));
  clSetq(CONS_11, clCons(STR_TOLOWER__16, CONS_12, clEOA));
  clSetq(CONS_10, clCons(STR_ISWPRINT__15, CONS_11, clEOA));
  clSetq(CONS_9, clCons(STR_ISWALPHA__14, CONS_10, clEOA));
  clSetq(CONS_8, clCons(STR_ISWUPPER__13, CONS_9, clEOA));
  clSetq(CONS_7, clCons(STR_ISWLOWER__12, CONS_8, clEOA));
  clSetq(CONS_6, clCons(STR_ISWALNUM__11, CONS_7, clEOA));
  clSetq(CONS_5, clCons(STR_TOWUPPER__10, CONS_6, clEOA));
  clSetq(CONS_4, clCons(STR_TOWLOWER__9, CONS_5, clEOA));
  clSetq(CONS_3, clCons(STR_SLEEP__8, CONS_4, clEOA));
  clSetq(CONS_2, clCons(STR_EXIT__7, CONS_3, clEOA));

  { clObject L_pkg0;
    clSetq(L_pkg0, clFindPackage(STR_ECLIPSE_C__0, clEOA));
    if (clTrue(L_pkg0))
      clRenamePackage(L_pkg0, STR_ECLIPSE_C__0, CONS_0, clEOA);
    else
      clSetq(L_pkg0,
             clMakePackage(STR_ECLIPSE_C__0,
                           keyNICKNAMES,
                           CONS_0,
                           keyUSE,
                           clNIL,
                           clINTERNAL_SIZE,
                           I_211,
                           clEXTERNAL_SIZE,
                           I_62,
                           clEOA));
    { clObject L_sublist395, L_sym1;
      clSetq(L_sublist395, CONS_2);
      clSetq(L_sym1, clCar(L_sublist395, clEOA));
      clLabel(l_ITERATE396);
      if (clTrue(clEndp(L_sublist395, clEOA))) clLocalReturn(NIL);
      { clObject L_1, L_0;
        { clObject L_1__R1;
          clSetq(L_1__R1, L_pkg0);
          clSetq(L_0, clIntern(L_sym1, L_1__R1, clEOA)); }
        clSetq(L_1, L_pkg0);
        clExport(L_0, L_1, clEOA); }
      { clObject L_0;
        clSetq(L_0, L_sublist395);
        clSetq(L_sublist395, clCdr(L_0, clEOA)); }
      { clObject L_0;
        clSetq(L_0, L_sublist395);
        clSetq(L_sym1, clCar(L_0, clEOA)); }
      goto l_ITERATE396; }
    clBlockEnd(NIL);
    (void) L_pkg0; }

  clUnwind(4); }
