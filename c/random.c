/* Generated by Eclipse Common Lisp 1.1-HOSTED on cad0.
   Monday the thirteenth of April, 1998, 3:44:20 pm CDT. */
#include <eclipse.h>

clObject clMINUS_FUNC(clProto), cl1PLUS_FUNC(clProto),
  cl1MINUS_FUNC(clProto), clAddInteger(clProto), clApply(clProto),
  clAsh(clProto), clBoundp(clProto),
  clCanonicalizeSpecializer(clProto), clCar(clProto), clCdr(clProto),
  clCharpSimpleBaseString __P((clCharp)), clClassp(clProto),
  clCons(clProto), clDoubleDoubleFloat __P((double)),
  clDoubleSingleFloat __P((double)), clEnsureGenericFunction(clProto),
  clEnsureMethod(clProto), clEq(clProto), clError(clProto),
  clExpandType(clProto), clExtraArgs(clProto), clFindClass(clProto),
  clFloat(clProto), clGeInteger(clProto), clGetUniversalTime(clProto),
  cl_SETF_GlobalDeclaration(clProto), clIntegerLength(clProto),
  clList(clProto), clLogand(clProto), clLogxor(clProto),
  clMakeArray(clProto), clMakeKeyword(clProto),
  clMakeLoadFormSavingSlots(clProto), clMakeRandomState(clProto),
  clMakeStructure(clProto), clMakeSymbol(clProto), clMinusp(clProto),
  clMissingArgs(clProto), clNot(clProto), clNull(clProto),
  clRandomChunk(clProto), cl_SETF_RandomStateJ(clProto),
  clRandomStateJ(clProto), cl_SETF_RandomStateK(clProto),
  clRandomStateK(clProto), clRandomStateSeed(clProto),
  clRedefineConstant(clProto), clRest(clProto),
  cl_SETF_Structref(clProto), clStructref(clProto), clSvref(clProto),
  cl_SETF_Svref(clProto);

extern clObject clampersandAUX, clampersandOPTIONAL, clDOUBLE_FLOAT,
  clEQ, clIF, clINTEGER, clLETstar, clSETQ, clSINGLE_FLOAT, clSPECIAL,
  clstarsymbol, clstarCONSTANT_CHECK_HOOKstar, clstarRANDOM_STATEstar,
  clplussymbol, cl1plussymbol, clADD, clCLASS_PROTOTYPE, clCONST_A,
  clCONST_C, clCONSTANT, clCOPY_SEQ, clDIV, clDOTIMES,
  clENSURE_STRUCTURE, clENVIRONMENT, clEQ_NUMBER, clFLOAT,
  clGET_UNIVERSAL_TIME, clGLOBAL_VARIABLE, clI, clINDEX, clJ, clK,
  clLE, clLOGAND, clMAKE_ARRAY, clMAKE_LOAD_FORM, clMAKE_RANDOM_STATE,
  clMASK, clMETHOD_FUNCTION, clMULT, clN, clNO_NEXT_METHOD, clOBJECT,
  clOR, clRAND_SEED, clRANDOM, clRANDOM_CHUNK, clRANDOM_CHUNK_LENGTH,
  clRANDOM_FIXNUM_MAX, clRANDOM_INTEGER_EXTRA_BITS,
  clRANDOM_INTEGER_OVERLAP, clRANDOM_MAX, clRANDOM_STATE,
  clRANDOM_STATE_J, clRANDOM_STATE_K, clRANDOM_STATE_P,
  clRANDOM_STATE_SEED, clRANDOM_UPPER_BOUND, clREM, clSEED, clSETF,
  clSOURCE, clSTANDARD_METHOD, clSTATE, clSUBT, clSVREF, clTYPE_ERROR,
  clTYPEP;

static clObject CONS_0, CONS_1, CONS_10, CONS_100, CONS_101, CONS_102,
  CONS_103, CONS_104, CONS_105, CONS_106, CONS_107, CONS_108, CONS_109,
  CONS_11, CONS_110, CONS_111, CONS_112, CONS_113, CONS_114, CONS_115,
  CONS_116, CONS_117, CONS_118, CONS_119, CONS_12, CONS_120, CONS_121,
  CONS_122, CONS_123, CONS_124, CONS_125, CONS_126, CONS_127, CONS_128,
  CONS_129, CONS_13, CONS_130, CONS_131, CONS_132, CONS_133, CONS_134,
  CONS_135, CONS_136, CONS_137, CONS_138, CONS_139, CONS_14, CONS_140,
  CONS_141, CONS_142, CONS_143, CONS_144, CONS_15, CONS_16, CONS_17,
  CONS_18, CONS_19, CONS_2, CONS_20, CONS_21, CONS_22, CONS_23,
  CONS_24, CONS_25, CONS_26, CONS_27, CONS_28, CONS_29, CONS_3,
  CONS_30, CONS_31, CONS_32, CONS_33, CONS_34, CONS_35, CONS_36,
  CONS_37, CONS_38, CONS_39, CONS_4, CONS_40, CONS_41, CONS_42,
  CONS_43, CONS_44, CONS_45, CONS_46, CONS_47, CONS_48, CONS_49,
  CONS_5, CONS_50, CONS_51, CONS_52, CONS_53, CONS_54, CONS_55,
  CONS_56, CONS_57, CONS_58, CONS_59, CONS_6, CONS_60, CONS_61,
  CONS_62, CONS_63, CONS_64, CONS_65, CONS_66, CONS_67, CONS_68,
  CONS_69, CONS_7, CONS_70, CONS_71, CONS_72, CONS_73, CONS_74,
  CONS_75, CONS_76, CONS_77, CONS_78, CONS_79, CONS_8, CONS_80,
  CONS_81, CONS_82, CONS_83, CONS_84, CONS_85, CONS_86, CONS_87,
  CONS_88, CONS_89, CONS_9, CONS_90, CONS_91, CONS_92, CONS_93,
  CONS_94, CONS_95, CONS_96, CONS_97, CONS_98, CONS_99, D_0_0d0, F_0_0,
  I_0, I_1, I_10, I_101010101, I_2, I_24, I_29, I_3, I_524287,
  I_536870908, I_536870911, I_54, I_8373, keyCONSTRUCTORS, keyCOPIER,
  keyDATUM, keyDECLARATIONS, keyDIRECT_SLOTS, keyDOCUMENTATION,
  keyENVIRONMENT, keyEXPECTED_TYPE, keyFUNCTION, keyINITFORM,
  keyLAMBDA_LIST, keyNAME, keyQUALIFIERS, keyREAD_ONLY,
  keySPECIALIZERS, keyTYPE, STR_CONSTRUCTORS__0, STR_COPIER__1,
  STR_DATUM__8, STR_DECLARATIONS__15, STR_DIRECT_SLOTS__2,
  STR_DOCUMENTATION__16, STR_ENVIRONMENT__14, STR_EXPECTED_TYPE__9,
  STR_FUNCTION__13, STR_INITFORM__4, STR_LAMBDA_LIST__11, STR_LTV__7,
  STR_NAME__3, STR_QUALIFIERS__10, STR_READ_ONLY__6,
  STR_SPECIALIZERS__12, STR_TYPE__5, SYM_0_LTV, SYM_1_LTV;

clDeclareEnv(clRandomStateP);
clObject clRandomStateP clVdecl(_ap)
{ clUseEnv(clRandomStateP);
  { clObject object;
    { clBeginParse(_ap);
      clSetq(object,
             (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
      if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
      clEndParse(_ap); }
    return(clClassp(object, clEnv(0, *L_g62), clEOA)); } }

clObject clMakeRandomState clVdecl(_ap)
{ clObject state, source, j, k, seed;
  { clBeginParse(_ap);
    clSetq(state, (_clVp(_ap) ? clVpop(_ap) : clNIL));
    { clObject L_g1184;
      clSetq(L_g1184, state);
      clSetq(source,
             (clTrue(L_g1184) ? L_g1184 :
              clSymbolValue(clstarRANDOM_STATEstar, clEOA))); }
    { clObject L_test;
      { clObject L_0;
        clSetq(L_0, source);
        clSetq(L_test, clEq(L_0, clT, clEOA)); }
      if (clTrue(L_test))
        clSetq(j, I_24);
      else
        { clObject L_0;
          clSetq(L_0, source);
          clSetq(j, clRandomStateJ(L_0, clEOA)); } }
    { clObject L_test;
      { clObject L_0;
        clSetq(L_0, source);
        clSetq(L_test, clEq(L_0, clT, clEOA)); }
      if (clTrue(L_test))
        clSetq(k, I_0);
      else
        { clObject L_0;
          clSetq(L_0, source);
          clSetq(k, clRandomStateK(L_0, clEOA)); } }
    { clObject L_test;
      { clObject L_0;
        clSetq(L_0, source);
        clSetq(L_test, clEq(L_0, clT, clEOA)); }
      if (clTrue(L_test))
        { clObject n, seed__R1, rand_seed, const_a, const_c, mask;
          clSetq(n, cl1PLUS_FUNC(I_54, clEOA));
          clSetq(seed__R1, clMakeArray(n, clEOA));
          clSetq(rand_seed, clGetUniversalTime(clEOA));
          clSetq(const_a, I_8373);
          clSetq(const_c, I_101010101);
          clSetq(mask, cl1PLUS_FUNC(I_536870908, clEOA));
          { clObject i;
            clSetq(i, I_0);
            clLabel(l_ITERATE1186);
            if (clTrue(clGeInteger(i, n, clEOA)))
              { clSetq(seed, seed__R1); clLocalReturn(NIL); }
            { clObject L_value1187;
              { clObject L_0;
                { clObject L_0__R1;
                  clSetq(L_0__R1,
                         clFuncallFunction(clSymbolFunctionValue(clMULT),
                                           rand_seed,
                                           const_a,
                                           clEOA));
                  clSetq(L_0,
                         clFuncallFunction(clSymbolFunctionValue(clADD),
                                           L_0__R1,
                                           const_c,
                                           clEOA)); }
                clSetq(L_value1187,
                       clSetq(rand_seed,
                              clLogand(L_0, mask, clEOA))); }
              cl_SETF_Svref(L_value1187, seed__R1, i, clEOA); }
            { clObject L_0;
              clSetq(L_0, i);
              clSetq(i, clAddInteger(L_0, I_1, clEOA)); }
            goto l_ITERATE1186; }
          clBlockEnd(NIL); }
      else
        { clObject L_0;
          { clObject L_0__R1;
            clSetq(L_0__R1, source);
            clSetq(L_0, clRandomStateSeed(L_0__R1, clEOA)); }
          clSetq(seed,
                 clFuncallFunction(clSymbolFunctionValue(clCOPY_SEQ),
                                   L_0,
                                   clEOA)); } }
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_3, L_2, L_1;
    clSetq(L_1, j);
    clSetq(L_2, k);
    clSetq(L_3, seed);
    return(clMakeStructure(clRANDOM_STATE, L_1, L_2, L_3, clEOA)); } }

clObject clRandomStateJ clVdecl(_ap)
{ clObject structure;
  { clBeginParse(_ap);
    clSetq(structure,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  return(clStructref(structure, I_0, clEOA)); }

clObject cl_SETF_RandomStateJ clVdecl(_ap)
{ clObject CL_new, structure;
  { clBeginParse(_ap);
    clSetq(CL_new,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(structure,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  return(cl_SETF_Structref(CL_new, structure, I_0, clEOA)); }

clObject clRandomStateK clVdecl(_ap)
{ clObject structure;
  { clBeginParse(_ap);
    clSetq(structure,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  return(clStructref(structure, I_1, clEOA)); }

clObject cl_SETF_RandomStateK clVdecl(_ap)
{ clObject CL_new, structure;
  { clBeginParse(_ap);
    clSetq(CL_new,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(structure,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  return(cl_SETF_Structref(CL_new, structure, I_1, clEOA)); }

clObject clRandomStateSeed clVdecl(_ap)
{ clObject structure;
  { clBeginParse(_ap);
    clSetq(structure,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  return(clStructref(structure, I_2, clEOA)); }

clObject cl_SETF_RandomStateSeed clVdecl(_ap)
{ clObject CL_new, structure;
  { clBeginParse(_ap);
    clSetq(CL_new,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(structure,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  return(cl_SETF_Structref(CL_new, structure, I_2, clEOA)); }

clObject clRandomChunk clVdecl(_ap)
{ clObject state;
  { clBeginParse(_ap);
    clSetq(state,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject seed, j, k, ja, ka, a;
    clSetq(seed, clRandomStateSeed(state, clEOA));
    clSetq(j, clRandomStateJ(state, clEOA));
    clSetq(k, clRandomStateK(state, clEOA));
    { clObject L_1;
      { clObject L_value1199;
        clSetq(L_value1199,
               (clTrue(clFuncallFunction(clSymbolFunctionValue(clEQ_NUMBER),
                                         j,
                                         I_0,
                                         clEOA)) ?
                I_54 : cl1MINUS_FUNC(j, clEOA)));
        { clObject L_0__R1;
          clSetq(L_0__R1, L_value1199);
          clSetq(L_1, cl_SETF_RandomStateJ(L_0__R1, state, clEOA)); } }
      clSetq(ja, clSvref(seed, L_1, clEOA)); }
    { clObject L_1;
      { clObject L_value1201;
        clSetq(L_value1201,
               (clTrue(clFuncallFunction(clSymbolFunctionValue(clEQ_NUMBER),
                                         k,
                                         I_0,
                                         clEOA)) ?
                I_54 : cl1MINUS_FUNC(k, clEOA)));
        { clObject L_0__R1;
          clSetq(L_0__R1, L_value1201);
          clSetq(L_1, cl_SETF_RandomStateK(L_0__R1, state, clEOA)); } }
      clSetq(ka, clSvref(seed, L_1, clEOA)); }
    clSetq(a, clMINUS_FUNC(I_536870908, ja, ka, clEOA));
    { clObject L_value1203;
      clSetq(L_value1203,
             (clTrue(clMinusp(a, clEOA)) ?
              clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                I_0,
                                a,
                                clEOA) :
              clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                I_536870908,
                                a,
                                clEOA)));
      { clObject L_0;
        clSetq(L_0, L_value1203);
        return(cl_SETF_Svref(L_0, seed, k, clEOA)); } } } }

clObject clRandom clVdecl(_ap)
{ clObject arg, state;
  { clBeginParse(_ap);
    clSetq(arg,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(state,
           (_clVp(_ap) ? clVpop(_ap) :
            clSymbolValue(clstarRANDOM_STATEstar, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  if (clTrue(clFuncallFunction(clSymbolFunctionValue(clTYPEP),
                               arg,
                               SYM_0_LTV,
                               clEOA)))
    if (clTrue(clFuncallFunction(clSymbolFunctionValue(clLE),
                                 arg,
                                 I_524287,
                                 clEOA)))
      { clObject L_0;
        { clObject L_0__R1;
          clSetq(L_0__R1, state);
          clSetq(L_0, clRandomChunk(L_0__R1, clEOA)); }
        return(clFuncallFunction(clSymbolFunctionValue(clREM),
                                 L_0,
                                 arg,
                                 clEOA)); }
    else
      { clObject shift;
        clSetq(shift,
               clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                 I_29,
                                 I_3,
                                 clEOA));
        { clObject bits, count;
          { clObject L_0;
            clSetq(L_0, state);
            clSetq(bits, clRandomChunk(L_0, clEOA)); }
          { clObject L_0;
            clSetq(L_0, clIntegerLength(arg, clEOA));
            clSetq(count,
                   clFuncallFunction(clSymbolFunctionValue(clADD),
                                     L_0,
                                     clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                                       I_10,
                                                       shift,
                                                       clEOA),
                                     clEOA)); }
          clLabel(l_ITERATE1210);
          if (clTrue(clMinusp(count, clEOA)))
            return(clFuncallFunction(clSymbolFunctionValue(clREM),
                                     bits,
                                     arg,
                                     clEOA));
          { clObject L_value1211, L_value1212;
            { clObject L_1, L_0;
              clSetq(L_0, clAsh(bits, shift, clEOA));
              { clObject L_0__R1;
                clSetq(L_0__R1, state);
                clSetq(L_1, clRandomChunk(L_0__R1, clEOA)); }
              clSetq(L_value1211, clLogxor(L_0, L_1, clEOA)); }
            clSetq(L_value1212,
                   clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                     count,
                                     shift,
                                     clEOA));
            clSetq(bits, L_value1211);
            clSetq(count, L_value1212); }
          goto l_ITERATE1210; } }
  else if (clTrue(clFuncallFunction(clSymbolFunctionValue(clTYPEP),
                                    arg,
                                    SYM_1_LTV,
                                    clEOA)))
    { clObject L_1;
      { clObject L_0__R1;
        { clObject L_0__R2;
          clSetq(L_0__R2, state);
          clSetq(L_0__R1, clRandomChunk(L_0__R2, clEOA)); }
        clSetq(L_1,
               clFuncallFunction(clSymbolFunctionValue(clDIV),
                                 L_0__R1,
                                 clFloat(I_536870908, arg, clEOA),
                                 clEOA)); }
      return(clFuncallFunction(clSymbolFunctionValue(clMULT),
                               arg,
                               L_1,
                               clEOA)); }
  else
    return(clError(clTYPE_ERROR, keyDATUM, arg, keyEXPECTED_TYPE,
                   CONS_135, clEOA)); }

clObject clMakeLoadForm_clRANDOM_STATE clVdecl(_ap)
{ clObject *L_args1213 = clMakeBinding(),
  *L_methods1214 = clMakeBinding();
  { clBeginParse(_ap);
    clSetq(*L_args1213,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(*L_methods1214,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_form1216, object, environment;
    clSetq(L_form1216, *L_args1213);
    if (clTrue(L_form1216))
      { clObject L_top1217;
        clSetq(L_top1217, clCar(L_form1216, clEOA));
        { clObject L_0;
          clSetq(L_0, L_form1216);
          clSetq(L_form1216, clCdr(L_0, clEOA)); }
        clSetq(object, L_top1217); }
    else clSetq(object, clMissingArgs(I_1, clEOA));
    if (clTrue(L_form1216))
      { clObject L_top1218;
        { clObject L_0;
          clSetq(L_0, L_form1216);
          clSetq(L_top1218, clCar(L_0, clEOA)); }
        { clObject L_0;
          clSetq(L_0, L_form1216);
          clSetq(L_form1216, clCdr(L_0, clEOA)); }
        clSetq(environment, L_top1218); }
    else clSetq(environment, clNIL);
    if (clTrue(L_form1216))
      { clObject L_0;
        clSetq(L_0, L_form1216);
        clExtraArgs(L_0, clEOA); }
    { clObject L_2;
      clSetq(L_2, environment);
      return(clMakeLoadFormSavingSlots(object,
                                       keyENVIRONMENT,
                                       L_2,
                                       clEOA)); } } }

void clInitRandom __P((void)) 
{ clDbind(clstarPACKAGEstar);
  clDbind(clstarREADTABLEstar);
  clDbind(clstarLOAD_TRUENAMEstar);
  clDbind(clstarLOAD_PATHNAMEstar);
  clSetq(I_536870911, clIntFixnum(536870911));
  clSetq(I_3, clIntFixnum(3));
  clSetq(I_536870908, clIntFixnum(536870908));
  clSetq(I_10, clIntFixnum(10));
  clSetq(I_54, clIntFixnum(54));
  clSetq(I_1, clIntFixnum(1));
  clSetq(I_29, clIntFixnum(29));
  clSetq(STR_CONSTRUCTORS__0,
         clCharpSimpleBaseString("CONSTRUCTORS"));
  clSetq(keyCONSTRUCTORS, clMakeKeyword(STR_CONSTRUCTORS__0, clEOA));
  clSetq(CONS_13, clCons(clstarRANDOM_STATEstar, clNIL, clEOA));
  clSetq(CONS_12, clCons(clSTATE, CONS_13, clEOA));
  clSetq(CONS_11, clCons(clOR, CONS_12, clEOA));
  clSetq(CONS_10, clCons(CONS_11, clNIL, clEOA));
  clSetq(CONS_9, clCons(clSOURCE, CONS_10, clEOA));
  clSetq(CONS_21, clCons(clT, clNIL, clEOA));
  clSetq(CONS_20, clCons(clSOURCE, CONS_21, clEOA));
  clSetq(CONS_19, clCons(clEQ, CONS_20, clEOA));
  clSetq(I_24, clIntFixnum(24));
  clSetq(CONS_25, clCons(clSOURCE, clNIL, clEOA));
  clSetq(CONS_24, clCons(clRANDOM_STATE_J, CONS_25, clEOA));
  clSetq(CONS_23, clCons(CONS_24, clNIL, clEOA));
  clSetq(CONS_22, clCons(I_24, CONS_23, clEOA));
  clSetq(CONS_18, clCons(CONS_19, CONS_22, clEOA));
  clSetq(CONS_17, clCons(clIF, CONS_18, clEOA));
  clSetq(CONS_16, clCons(CONS_17, clNIL, clEOA));
  clSetq(CONS_15, clCons(clJ, CONS_16, clEOA));
  clSetq(I_0, clIntFixnum(0));
  clSetq(CONS_33, clCons(clRANDOM_STATE_K, CONS_25, clEOA));
  clSetq(CONS_32, clCons(CONS_33, clNIL, clEOA));
  clSetq(CONS_31, clCons(I_0, CONS_32, clEOA));
  clSetq(CONS_30, clCons(CONS_19, CONS_31, clEOA));
  clSetq(CONS_29, clCons(clIF, CONS_30, clEOA));
  clSetq(CONS_28, clCons(CONS_29, clNIL, clEOA));
  clSetq(CONS_27, clCons(clK, CONS_28, clEOA));
  clSetq(CONS_46, clCons(clRANDOM_MAX, clNIL, clEOA));
  clSetq(CONS_45, clCons(cl1plussymbol, CONS_46, clEOA));
  clSetq(CONS_44, clCons(CONS_45, clNIL, clEOA));
  clSetq(CONS_43, clCons(clN, CONS_44, clEOA));
  clSetq(CONS_51, clCons(clN, clNIL, clEOA));
  clSetq(CONS_50, clCons(clMAKE_ARRAY, CONS_51, clEOA));
  clSetq(CONS_49, clCons(CONS_50, clNIL, clEOA));
  clSetq(CONS_48, clCons(clSEED, CONS_49, clEOA));
  clSetq(CONS_55, clCons(clGET_UNIVERSAL_TIME, clNIL, clEOA));
  clSetq(CONS_54, clCons(CONS_55, clNIL, clEOA));
  clSetq(CONS_53, clCons(clRAND_SEED, CONS_54, clEOA));
  clSetq(I_8373, clIntFixnum(8373));
  clSetq(CONS_58, clCons(I_8373, clNIL, clEOA));
  clSetq(CONS_57, clCons(clCONST_A, CONS_58, clEOA));
  clSetq(I_101010101, clIntFixnum(101010101));
  clSetq(CONS_61, clCons(I_101010101, clNIL, clEOA));
  clSetq(CONS_60, clCons(clCONST_C, CONS_61, clEOA));
  clSetq(CONS_66, clCons(clRANDOM_UPPER_BOUND, clNIL, clEOA));
  clSetq(CONS_65, clCons(cl1plussymbol, CONS_66, clEOA));
  clSetq(CONS_64, clCons(CONS_65, clNIL, clEOA));
  clSetq(CONS_63, clCons(clMASK, CONS_64, clEOA));
  clSetq(CONS_62, clCons(CONS_63, clNIL, clEOA));
  clSetq(CONS_59, clCons(CONS_60, CONS_62, clEOA));
  clSetq(CONS_56, clCons(CONS_57, CONS_59, clEOA));
  clSetq(CONS_52, clCons(CONS_53, CONS_56, clEOA));
  clSetq(CONS_47, clCons(CONS_48, CONS_52, clEOA));
  clSetq(CONS_42, clCons(CONS_43, CONS_47, clEOA));
  clSetq(CONS_72, clCons(clSEED, clNIL, clEOA));
  clSetq(CONS_71, clCons(clN, CONS_72, clEOA));
  clSetq(CONS_70, clCons(clI, CONS_71, clEOA));
  clSetq(CONS_78, clCons(clI, clNIL, clEOA));
  clSetq(CONS_77, clCons(clSEED, CONS_78, clEOA));
  clSetq(CONS_76, clCons(clSVREF, CONS_77, clEOA));
  clSetq(CONS_89, clCons(clCONST_A, clNIL, clEOA));
  clSetq(CONS_88, clCons(clRAND_SEED, CONS_89, clEOA));
  clSetq(CONS_87, clCons(clstarsymbol, CONS_88, clEOA));
  clSetq(CONS_90, clCons(clCONST_C, clNIL, clEOA));
  clSetq(CONS_86, clCons(CONS_87, CONS_90, clEOA));
  clSetq(CONS_85, clCons(clplussymbol, CONS_86, clEOA));
  clSetq(CONS_91, clCons(clMASK, clNIL, clEOA));
  clSetq(CONS_84, clCons(CONS_85, CONS_91, clEOA));
  clSetq(CONS_83, clCons(clLOGAND, CONS_84, clEOA));
  clSetq(CONS_82, clCons(CONS_83, clNIL, clEOA));
  clSetq(CONS_81, clCons(clRAND_SEED, CONS_82, clEOA));
  clSetq(CONS_80, clCons(clSETQ, CONS_81, clEOA));
  clSetq(CONS_79, clCons(CONS_80, clNIL, clEOA));
  clSetq(CONS_75, clCons(CONS_76, CONS_79, clEOA));
  clSetq(CONS_74, clCons(clSETF, CONS_75, clEOA));
  clSetq(CONS_73, clCons(CONS_74, clNIL, clEOA));
  clSetq(CONS_69, clCons(CONS_70, CONS_73, clEOA));
  clSetq(CONS_68, clCons(clDOTIMES, CONS_69, clEOA));
  clSetq(CONS_67, clCons(CONS_68, clNIL, clEOA));
  clSetq(CONS_41, clCons(CONS_42, CONS_67, clEOA));
  clSetq(CONS_40, clCons(clLETstar, CONS_41, clEOA));
  clSetq(CONS_95, clCons(clRANDOM_STATE_SEED, CONS_25, clEOA));
  clSetq(CONS_94, clCons(CONS_95, clNIL, clEOA));
  clSetq(CONS_93, clCons(clCOPY_SEQ, CONS_94, clEOA));
  clSetq(CONS_92, clCons(CONS_93, clNIL, clEOA));
  clSetq(CONS_39, clCons(CONS_40, CONS_92, clEOA));
  clSetq(CONS_38, clCons(CONS_19, CONS_39, clEOA));
  clSetq(CONS_37, clCons(clIF, CONS_38, clEOA));
  clSetq(CONS_36, clCons(CONS_37, clNIL, clEOA));
  clSetq(CONS_35, clCons(clSEED, CONS_36, clEOA));
  clSetq(CONS_34, clCons(CONS_35, clNIL, clEOA));
  clSetq(CONS_26, clCons(CONS_27, CONS_34, clEOA));
  clSetq(CONS_14, clCons(CONS_15, CONS_26, clEOA));
  clSetq(CONS_8, clCons(CONS_9, CONS_14, clEOA));
  clSetq(CONS_7, clCons(clampersandAUX, CONS_8, clEOA));
  clSetq(CONS_6, clCons(clSTATE, CONS_7, clEOA));
  clSetq(CONS_5, clCons(clampersandOPTIONAL, CONS_6, clEOA));
  clSetq(CONS_4, clCons(CONS_5, clNIL, clEOA));
  clSetq(CONS_3, clCons(clMAKE_RANDOM_STATE, CONS_4, clEOA));
  clSetq(CONS_2, clCons(CONS_3, clNIL, clEOA));
  clSetq(STR_COPIER__1,
         clCharpSimpleBaseString("COPIER"));
  clSetq(keyCOPIER, clMakeKeyword(STR_COPIER__1, clEOA));
  clSetq(STR_DIRECT_SLOTS__2,
         clCharpSimpleBaseString("DIRECT-SLOTS"));
  clSetq(keyDIRECT_SLOTS, clMakeKeyword(STR_DIRECT_SLOTS__2, clEOA));
  clSetq(STR_NAME__3,
         clCharpSimpleBaseString("NAME"));
  clSetq(keyNAME, clMakeKeyword(STR_NAME__3, clEOA));
  clSetq(STR_INITFORM__4,
         clCharpSimpleBaseString("INITFORM"));
  clSetq(keyINITFORM, clMakeKeyword(STR_INITFORM__4, clEOA));
  clSetq(STR_TYPE__5,
         clCharpSimpleBaseString("TYPE"));
  clSetq(keyTYPE, clMakeKeyword(STR_TYPE__5, clEOA));
  clSetq(STR_READ_ONLY__6,
         clCharpSimpleBaseString("READ-ONLY"));
  clSetq(keyREAD_ONLY, clMakeKeyword(STR_READ_ONLY__6, clEOA));
  clSetq(CONS_108, clCons(clNIL, clNIL, clEOA));
  clSetq(CONS_107, clCons(keyREAD_ONLY, CONS_108, clEOA));
  clSetq(CONS_106, clCons(clINDEX, CONS_107, clEOA));
  clSetq(CONS_105, clCons(keyTYPE, CONS_106, clEOA));
  clSetq(CONS_104, clCons(I_0, CONS_105, clEOA));
  clSetq(CONS_103, clCons(keyINITFORM, CONS_104, clEOA));
  clSetq(CONS_102, clCons(clJ, CONS_103, clEOA));
  clSetq(CONS_101, clCons(keyNAME, CONS_102, clEOA));
  clSetq(CONS_111, clCons(clK, CONS_103, clEOA));
  clSetq(CONS_110, clCons(keyNAME, CONS_111, clEOA));
  clSetq(CONS_118, clCons(clT, CONS_107, clEOA));
  clSetq(CONS_117, clCons(keyTYPE, CONS_118, clEOA));
  clSetq(CONS_116, clCons(clNIL, CONS_117, clEOA));
  clSetq(CONS_115, clCons(keyINITFORM, CONS_116, clEOA));
  clSetq(CONS_114, clCons(clSEED, CONS_115, clEOA));
  clSetq(CONS_113, clCons(keyNAME, CONS_114, clEOA));
  clSetq(CONS_112, clCons(CONS_113, clNIL, clEOA));
  clSetq(CONS_109, clCons(CONS_110, CONS_112, clEOA));
  clSetq(CONS_100, clCons(CONS_101, CONS_109, clEOA));
  clSetq(CONS_99, clCons(CONS_100, clNIL, clEOA));
  clSetq(CONS_98, clCons(keyDIRECT_SLOTS, CONS_99, clEOA));
  clSetq(CONS_97, clCons(clNIL, CONS_98, clEOA));
  clSetq(CONS_96, clCons(keyCOPIER, CONS_97, clEOA));
  clSetq(CONS_1, clCons(CONS_2, CONS_96, clEOA));
  clSetq(CONS_0, clCons(keyCONSTRUCTORS, CONS_1, clEOA));
  clSetq(I_2, clIntFixnum(2));
  clSetq(CONS_120, clCons(clRANDOM_STATE_J, clNIL, clEOA));
  clSetq(CONS_119, clCons(clSETF, CONS_120, clEOA));
  clSetq(CONS_122, clCons(clRANDOM_STATE_K, clNIL, clEOA));
  clSetq(CONS_121, clCons(clSETF, CONS_122, clEOA));
  clSetq(CONS_124, clCons(clRANDOM_STATE_SEED, clNIL, clEOA));
  clSetq(CONS_123, clCons(clSETF, CONS_124, clEOA));
  clSetq(STR_LTV__7,
         clCharpSimpleBaseString("LTV"));
  clSetq(SYM_0_LTV, clMakeSymbol(STR_LTV__7, clEOA));
  clSetq(CONS_127, clCons(clstarsymbol, clNIL, clEOA));
  clSetq(CONS_126, clCons(I_0, CONS_127, clEOA));
  clSetq(CONS_125, clCons(clINTEGER, CONS_126, clEOA));
  clSetq(SYM_0_LTV, clExpandType(CONS_125, clNIL, clEOA));
  clSetq(I_524287, clIntFixnum(524287));
  clSetq(SYM_1_LTV, clMakeSymbol(STR_LTV__7, clEOA));
  clSetq(F_0_0, clDoubleSingleFloat(0.0));
  clSetq(CONS_131, clCons(F_0_0, CONS_127, clEOA));
  clSetq(CONS_130, clCons(clSINGLE_FLOAT, CONS_131, clEOA));
  clSetq(D_0_0d0, clDoubleDoubleFloat(0.0));
  clSetq(CONS_134, clCons(D_0_0d0, CONS_127, clEOA));
  clSetq(CONS_133, clCons(clDOUBLE_FLOAT, CONS_134, clEOA));
  clSetq(CONS_132, clCons(CONS_133, clNIL, clEOA));
  clSetq(CONS_129, clCons(CONS_130, CONS_132, clEOA));
  clSetq(CONS_128, clCons(clOR, CONS_129, clEOA));
  clSetq(SYM_1_LTV, clExpandType(CONS_128, clNIL, clEOA));
  clSetq(STR_DATUM__8,
         clCharpSimpleBaseString("DATUM"));
  clSetq(keyDATUM, clMakeKeyword(STR_DATUM__8, clEOA));
  clSetq(STR_EXPECTED_TYPE__9,
         clCharpSimpleBaseString("EXPECTED-TYPE"));
  clSetq(keyEXPECTED_TYPE, clMakeKeyword(STR_EXPECTED_TYPE__9, clEOA));
  clSetq(CONS_138, clCons(I_0, clNIL, clEOA));
  clSetq(CONS_137, clCons(clINTEGER, CONS_138, clEOA));
  clSetq(CONS_141, clCons(F_0_0, clNIL, clEOA));
  clSetq(CONS_140, clCons(clFLOAT, CONS_141, clEOA));
  clSetq(CONS_139, clCons(CONS_140, clNIL, clEOA));
  clSetq(CONS_136, clCons(CONS_137, CONS_139, clEOA));
  clSetq(CONS_135, clCons(clOR, CONS_136, clEOA));
  clSetq(STR_QUALIFIERS__10,
         clCharpSimpleBaseString("QUALIFIERS"));
  clSetq(keyQUALIFIERS, clMakeKeyword(STR_QUALIFIERS__10, clEOA));
  clSetq(STR_LAMBDA_LIST__11,
         clCharpSimpleBaseString("LAMBDA-LIST"));
  clSetq(keyLAMBDA_LIST, clMakeKeyword(STR_LAMBDA_LIST__11, clEOA));
  clSetq(CONS_144, clCons(clENVIRONMENT, clNIL, clEOA));
  clSetq(CONS_143, clCons(clampersandOPTIONAL, CONS_144, clEOA));
  clSetq(CONS_142, clCons(clOBJECT, CONS_143, clEOA));
  clSetq(STR_SPECIALIZERS__12,
         clCharpSimpleBaseString("SPECIALIZERS"));
  clSetq(keySPECIALIZERS, clMakeKeyword(STR_SPECIALIZERS__12, clEOA));
  clSetq(STR_FUNCTION__13,
         clCharpSimpleBaseString("FUNCTION"));
  clSetq(keyFUNCTION, clMakeKeyword(STR_FUNCTION__13, clEOA));
  clSetq(STR_ENVIRONMENT__14,
         clCharpSimpleBaseString("ENVIRONMENT"));
  clSetq(keyENVIRONMENT, clMakeKeyword(STR_ENVIRONMENT__14, clEOA));
  clSetq(STR_DECLARATIONS__15,
         clCharpSimpleBaseString("DECLARATIONS"));
  clSetq(keyDECLARATIONS, clMakeKeyword(STR_DECLARATIONS__15, clEOA));
  clSetq(STR_DOCUMENTATION__16,
         clCharpSimpleBaseString("DOCUMENTATION"));
  clSetq(keyDOCUMENTATION,
         clMakeKeyword(STR_DOCUMENTATION__16, clEOA));


  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_UPPER_BOUND,
                            clGLOBAL_VARIABLE,
                            clSPECIAL,
                            clEOA);
  if (clTrue(clBoundp(clRANDOM_UPPER_BOUND, clEOA)))
    { if (clTrue(clSymbolValue(clstarCONSTANT_CHECK_HOOKstar, clEOA)))
        clRedefineConstant(clRANDOM_UPPER_BOUND,
                           clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                             I_536870911,
                                             I_3,
                                             clEOA),
                           clEOA); }
  else
    clSetSymbolValueValue(clRANDOM_UPPER_BOUND,
                          clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                            I_536870911,
                                            I_3,
                                            clEOA));
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_UPPER_BOUND,
                            clGLOBAL_VARIABLE,
                            clCONSTANT,
                            clEOA);
  (void) clRANDOM_UPPER_BOUND;
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_CHUNK_LENGTH,
                            clGLOBAL_VARIABLE,
                            clSPECIAL,
                            clEOA);
  if (clTrue(clBoundp(clRANDOM_CHUNK_LENGTH, clEOA)))
    { if (clTrue(clSymbolValue(clstarCONSTANT_CHECK_HOOKstar, clEOA)))
        clRedefineConstant(clRANDOM_CHUNK_LENGTH,
                           clIntegerLength(I_536870908, clEOA),
                           clEOA); }
  else
    clSetSymbolValueValue(clRANDOM_CHUNK_LENGTH,
                          clIntegerLength(I_536870908, clEOA));
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_CHUNK_LENGTH,
                            clGLOBAL_VARIABLE,
                            clCONSTANT,
                            clEOA);
  (void) clRANDOM_CHUNK_LENGTH;
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_INTEGER_EXTRA_BITS,
                            clGLOBAL_VARIABLE,
                            clSPECIAL,
                            clEOA);
  if (clTrue(clBoundp(clRANDOM_INTEGER_EXTRA_BITS, clEOA)))
    { if (clTrue(clSymbolValue(clstarCONSTANT_CHECK_HOOKstar, clEOA)))
        clRedefineConstant(clRANDOM_INTEGER_EXTRA_BITS, I_10, clEOA); }
  else clSetSymbolValueValue(clRANDOM_INTEGER_EXTRA_BITS, I_10);
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_INTEGER_EXTRA_BITS,
                            clGLOBAL_VARIABLE,
                            clCONSTANT,
                            clEOA);
  (void) clRANDOM_INTEGER_EXTRA_BITS;
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_MAX,
                            clGLOBAL_VARIABLE,
                            clSPECIAL,
                            clEOA);
  if (clTrue(clBoundp(clRANDOM_MAX, clEOA)))
    { if (clTrue(clSymbolValue(clstarCONSTANT_CHECK_HOOKstar, clEOA)))
        clRedefineConstant(clRANDOM_MAX, I_54, clEOA); }
  else clSetSymbolValueValue(clRANDOM_MAX, I_54);
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_MAX,
                            clGLOBAL_VARIABLE,
                            clCONSTANT,
                            clEOA);
  (void) clRANDOM_MAX;
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_INTEGER_OVERLAP,
                            clGLOBAL_VARIABLE,
                            clSPECIAL,
                            clEOA);
  if (clTrue(clBoundp(clRANDOM_INTEGER_OVERLAP, clEOA)))
    { if (clTrue(clSymbolValue(clstarCONSTANT_CHECK_HOOKstar, clEOA)))
        clRedefineConstant(clRANDOM_INTEGER_OVERLAP, I_3, clEOA); }
  else clSetSymbolValueValue(clRANDOM_INTEGER_OVERLAP, I_3);
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_INTEGER_OVERLAP,
                            clGLOBAL_VARIABLE,
                            clCONSTANT,
                            clEOA);
  (void) clRANDOM_INTEGER_OVERLAP;
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_FIXNUM_MAX,
                            clGLOBAL_VARIABLE,
                            clSPECIAL,
                            clEOA);
  if (clTrue(clBoundp(clRANDOM_FIXNUM_MAX, clEOA)))
    { if (clTrue(clSymbolValue(clstarCONSTANT_CHECK_HOOKstar, clEOA)))
        clRedefineConstant(clRANDOM_FIXNUM_MAX,
                           cl1MINUS_FUNC(clAsh(I_1,
                                               clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                                                 I_29,
                                                                 I_10,
                                                                 clEOA),
                                               clEOA),
                                         clEOA),
                           clEOA); }
  else
    clSetSymbolValueValue(clRANDOM_FIXNUM_MAX,
                          cl1MINUS_FUNC(clAsh(I_1,
                                              clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                                                I_29,
                                                                I_10,
                                                                clEOA),
                                              clEOA),
                                        clEOA));
  cl_SETF_GlobalDeclaration(clT,
                            clRANDOM_FIXNUM_MAX,
                            clGLOBAL_VARIABLE,
                            clCONSTANT,
                            clEOA);
  (void) clRANDOM_FIXNUM_MAX;
  cl_SETF_GlobalDeclaration(clT,
                            clstarRANDOM_STATEstar,
                            clGLOBAL_VARIABLE,
                            clSPECIAL,
                            clEOA);
  (void) clstarRANDOM_STATEstar;
  { clObject *L_g62 = clMakeBinding();
    { clObject L_0;
      clSetq(L_0, clSymbolFunctionValue(clENSURE_STRUCTURE));
      clSetq(*L_g62, clApply(L_0, clRANDOM_STATE, CONS_0, clEOA)); }
    { clObject L_1;
      clSetq(L_1,
             clMakeClosure(1,
                           clRandomStateP,
                           &clEnvHook(clRandomStateP),
                           &*L_g62));
      clSetSymbolFunctionValue(clRANDOM_STATE_P, L_1); }
    (void) clRANDOM_STATE_P;
    clSetSymbolFunctionValue(clMAKE_RANDOM_STATE,
                             clMakeClosure(0,
                                           clMakeRandomState,
                                           clNULL_HOOK));
    (void) clMAKE_RANDOM_STATE;
    clSetSymbolFunctionValue(clRANDOM_STATE_J,
                             clMakeClosure(0,
                                           clRandomStateJ,
                                           clNULL_HOOK));
    (void) clRANDOM_STATE_J;
    clSetSymbolSetfFunctionValue(clRANDOM_STATE_J,
                                 clMakeClosure(0,
                                               cl_SETF_RandomStateJ,
                                               clNULL_HOOK));
    (void) CONS_119;
    clSetSymbolFunctionValue(clRANDOM_STATE_K,
                             clMakeClosure(0,
                                           clRandomStateK,
                                           clNULL_HOOK));
    (void) clRANDOM_STATE_K;
    clSetSymbolSetfFunctionValue(clRANDOM_STATE_K,
                                 clMakeClosure(0,
                                               cl_SETF_RandomStateK,
                                               clNULL_HOOK));
    (void) CONS_121;
    clSetSymbolFunctionValue(clRANDOM_STATE_SEED,
                             clMakeClosure(0,
                                           clRandomStateSeed,
                                           clNULL_HOOK));
    (void) clRANDOM_STATE_SEED;
    clSetSymbolSetfFunctionValue(clRANDOM_STATE_SEED,
                                 clMakeClosure(0,
                                               cl_SETF_RandomStateSeed,
                                               clNULL_HOOK));
    (void) CONS_123;
    (void) clRANDOM_STATE; }
  clSetSymbolFunctionValue(clRANDOM_CHUNK,
                           clMakeClosure(0,
                                         clRandomChunk,
                                         clNULL_HOOK));
  (void) clRANDOM_CHUNK;
  clSetSymbolFunctionValue(clRANDOM,
                           clMakeClosure(0, clRandom, clNULL_HOOK));
  (void) clRANDOM;
  { clObject L_8, L_6, L_0;
    clSetq(L_0, clEnsureGenericFunction(clMAKE_LOAD_FORM, clEOA));
    clSetq(L_6,
           clList(clCanonicalizeSpecializer(clRANDOM_STATE, clEOA),
                  clEOA));
    clSetq(L_8,
           clMakeClosure(0,
                         clMakeLoadForm_clRANDOM_STATE,
                         clNULL_HOOK));
    clEnsureMethod(L_0, keyQUALIFIERS, clNIL, keyLAMBDA_LIST, CONS_142,
                   keySPECIALIZERS, L_6, keyFUNCTION, L_8,
                   keyDECLARATIONS, clNIL, keyDOCUMENTATION, clNIL,
                   clEOA); }
  clSetSymbolValueValue(clstarRANDOM_STATEstar,
                        clMakeRandomState(clT, clEOA));

  clUnwind(4); }
