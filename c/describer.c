/* Generated by Eclipse Common Lisp 1.1-HOSTED on cad0.
   Thursday the twenty-eighth of May, 1998, 10:44:24 am CDT. */
#include <eclipse.h>

clObject cl1PLUS_FUNC(clProto), clApply(clProto), clAtom(clProto),
  clCanonicalizeSpecializer(clProto), clCar(clProto), clCddr(clProto),
  clCdr(clProto), clCharpSimpleBaseString __P((clCharp)),
  clCons(clProto), clDescribeHeader(clProto),
  clDescribeTrailer(clProto), clEnsureGenericFunction(clProto),
  clEnsureMethod(clProto), clEq(clProto), clEql(clProto),
  clError(clProto), clExtraArgs(clProto), clFindClass(clProto),
  clFormatGroupedInteger(clProto), clIntInteger __P((int)),
  clKeyArg(clProto), clLength(clProto), clList(clProto),
  clMakeKeyword(clProto), clMissingArgs(clProto), clNot(clProto),
  clNull(clProto), clOutputStream(clProto), clPprintNewline(clProto),
  clPprintToplevel(clProto), clRest(clProto), clRplacd(clProto),
  clTerpri(clProto), clTypeOf(clProto), clWriteChar(clProto),
  clWriteToplevel(clProto);

extern clObject clstarDEFAULT_RIGHT_MARGINstar, clstarPRINT_ESCAPEstar,
  clstarPRINT_RIGHT_MARGINstar, clCLASS_PROTOTYPE, clDESCRIBE_HEADER,
  clDESCRIBE_OBJECT, clDESCRIBE_TRAILER, clFORMAT, clGE,
  clINSPECT_OBJECT, clMETHOD_FUNCTION, clNO_NEXT_METHOD, clOBJECT,
  clSCHAR, clSTANDARD_METHOD, clSTREAM, clSTREAM_LINE_COLUMN,
  clSTREAM_WRITE_STRING, clSUBT, clWRAP, clWRITE_TO_STRING;

static clObject C_comma, C_dot, C_Newline, C_Space, CONS_0, CONS_1,
  CONS_2, CONS_3, I_0, I_1, I_16, I_2, I_3, keyDECLARATIONS,
  keyDOCUMENTATION, keyFILL, keyFUNCTION, keyLAMBDA_LIST,
  keyQUALIFIERS, keyRIGHT_MARGIN, keySPECIALIZERS, keySTREAM, STR____0,
  STR_DECLARATIONS__9, STR_DOCUMENTATION__10, STR_FILL__1,
  STR_FUNCTION__7, STR_LAMBDA_LIST__4, STR_QUALIFIERS__5,
  STR_RIGHT_MARGIN__12, STR_SPECIALIZERS__6, STR_STREAM__11, STR___8,
  STR_at_hashx__3, STR_is_a___2, STRn_13;

static clObject clDescribeHeader_Lambda clVdecl(_ap)
{ clObject xp, L_args;
  { clBeginParse(_ap);
    clSetq(xp, (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_args, clVargs(_ap));
    clEndParse(_ap); }
  { clObject STARprint_escapeSTAR, arg;
    clSetq(STARprint_escapeSTAR, clT);
    { clObject L_top395;
      clSetq(L_top395, clCar(L_args, clEOA));
      { clObject L_0;
        clSetq(L_0, L_args);
        clSetq(L_args, clCdr(L_0, clEOA)); }
      clSetq(arg, L_top395); }
    clDbind(clstarPRINT_ESCAPEstar);
    clSetSymbolValueValue(clstarPRINT_ESCAPEstar,
                          STARprint_escapeSTAR);
    { clObject L_1;
      clSetq(L_1, xp);
      clWriteToplevel(arg, L_1, clEOA); }
    clUnwind(1); }
  { clObject L_0;
    clSetq(L_0, xp);
    clFuncallFunction(clSymbolFunctionValue(clSTREAM_WRITE_STRING),
                      L_0,
                      STR____0,
                      clEOA); }
  { clObject L_1;
    clSetq(L_1, xp);
    clPprintNewline(keyFILL, L_1, clEOA); }
  { clObject L_0;
    clSetq(L_0, xp);
    clFuncallFunction(clSymbolFunctionValue(clSTREAM_WRITE_STRING),
                      L_0,
                      STR_is_a___2,
                      clEOA); }
  { clObject STARprint_escapeSTAR, arg;
    clSetq(STARprint_escapeSTAR, clT);
    { clObject L_top396;
      { clObject L_0;
        clSetq(L_0, L_args);
        clSetq(L_top396, clCar(L_0, clEOA)); }
      { clObject L_0;
        clSetq(L_0, L_args);
        clSetq(L_args, clCdr(L_0, clEOA)); }
      clSetq(arg, L_top396); }
    clDbind(clstarPRINT_ESCAPEstar);
    clSetSymbolValueValue(clstarPRINT_ESCAPEstar,
                          STARprint_escapeSTAR);
    { clObject L_1;
      clSetq(L_1, xp);
      clWriteToplevel(arg, L_1, clEOA); }
    clUnwind(1); }
  { clObject L_0;
    clSetq(L_0, xp);
    clFuncallFunction(clSymbolFunctionValue(clSTREAM_WRITE_STRING),
                      L_0,
                      STR____0,
                      clEOA); }
  { clObject L_1;
    clSetq(L_1, xp);
    clPprintNewline(keyFILL, L_1, clEOA); }
  { clObject L_0;
    clSetq(L_0, xp);
    clFuncallFunction(clSymbolFunctionValue(clSTREAM_WRITE_STRING),
                      L_0,
                      STR_at_hashx__3,
                      clEOA); }
  { clObject L_6, L_2;
    { clObject L_top397;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_args);
        clSetq(L_top397, clCar(L_0__R1, clEOA)); }
      { clObject L_0__R1;
        clSetq(L_0__R1, L_args);
        clSetq(L_args, clCdr(L_0__R1, clEOA)); }
      clSetq(L_2, L_top397); }
    clSetq(L_6, xp);
    clFormatGroupedInteger(C_comma,
                           I_3,
                           L_2,
                           I_16,
                           clNIL,
                           clNIL,
                           L_6,
                           clEOA); }
  return(clValues1(L_args)); }

clObject clDescribeHeader clVdecl(_ap)
{ clObject object, stream, type;
  { clBeginParse(_ap);
    clSetq(object,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(stream,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    clSetq(type,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_3, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_4, L_3, L_2, L_1, L_0;
    clSetq(L_0, stream);
    clSetq(L_1,
           clMakeClosure(0, clDescribeHeader_Lambda, clNULL_HOOK));
    clSetq(L_2, object);
    clSetq(L_3, type);
    { int L_0__R1;
      { clObject L_0__R2;
        clSetq(L_0__R2, object);
        L_0__R1 = clObjectWord(L_0__R2); }
      clSetq(L_4, clIntInteger(L_0__R1)); }
    return(clFuncallFunction(clSymbolFunctionValue(clFORMAT),
                             L_0,
                             L_1,
                             L_2,
                             L_3,
                             L_4,
                             clEOA)); } }

clObject clDescribeTrailer clVdecl(_ap)
{ clObject stream;
  { clBeginParse(_ap);
    clSetq(stream,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    clSetq(L_1, stream);
    clWriteChar(C_dot, L_1, clEOA); }
  { clObject L_0; clSetq(L_0, stream); clTerpri(L_0, clEOA); }
  return(clValues1(clNIL)); }

clDeclareEnv(clDescribeObject_clT_clT_l_LogicalBlock);
static clObject clDescribeObject_clT_clT_l_LogicalBlock clVdecl(_ap)
{ clUseEnv(clDescribeObject_clT_clT_l_LogicalBlock);
  { clObject L_args, stream;
    { clBeginParse(_ap);
      clSetq(L_args,
             (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
      clSetq(stream,
             (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
      if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
      clEndParse(_ap); }
    { clObject L_2, L_1, L_0;
      clSetq(L_0, clEnv(0, *object));
      clSetq(L_1, stream);
      { clObject L_0__R1;
        clSetq(L_0__R1, clEnv(0, *object));
        clSetq(L_2, clTypeOf(L_0__R1, clEOA)); }
      clDescribeHeader(L_0, L_1, L_2, clEOA); }
    { clObject L_0;
      clSetq(L_0, stream);
      return(clDescribeTrailer(L_0, clEOA)); } } }

clObject clDescribeObject_clT_clT clVdecl(_ap)
{ clObject *L_args399 = clMakeBinding(),
  *L_methods400 = clMakeBinding();
  { clBeginParse(_ap);
    clSetq(*L_args399,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(*L_methods400,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_form404, *object = clMakeBinding(), stream;
    clSetq(L_form404, *L_args399);
    if (clTrue(L_form404))
      { clObject L_top405;
        clSetq(L_top405, clCar(L_form404, clEOA));
        { clObject L_0;
          clSetq(L_0, L_form404);
          clSetq(L_form404, clCdr(L_0, clEOA)); }
        clSetq(*object, L_top405); }
    else clSetq(*object, clMissingArgs(I_1, clEOA));
    if (clTrue(L_form404))
      { clObject L_top406;
        { clObject L_0;
          clSetq(L_0, L_form404);
          clSetq(L_top406, clCar(L_0, clEOA)); }
        { clObject L_0;
          clSetq(L_0, L_form404);
          clSetq(L_form404, clCdr(L_0, clEOA)); }
        clSetq(stream, L_top406); }
    else clSetq(stream, clMissingArgs(I_2, clEOA));
    if (clTrue(L_form404))
      { clObject L_0;
        clSetq(L_0, L_form404);
        clExtraArgs(L_0, clEOA); }
    { clObject _l_LogicalBlock_;
      clSetq(_l_LogicalBlock_,
             clMakeClosure(1,
                           clDescribeObject_clT_clT_l_LogicalBlock,
                           &clEnvHook(clDescribeObject_clT_clT_l_LogicalBlock),
                           &*object));
      { clObject L_1;
        { clObject L_0__R1;
          clSetq(L_0__R1, stream);
          clSetq(L_1, clOutputStream(L_0__R1, clEOA)); }
        return(clPprintToplevel(clNIL,
                                L_1,
                                STR___8,
                                STR___8,
                                clNIL,
                                _l_LogicalBlock_,
                                clEOA)); } } } }

clObject clInspectObject_clT_clT clVdecl(_ap)
{ clObject *L_args408 = clMakeBinding(),
  *L_methods409 = clMakeBinding();
  { clBeginParse(_ap);
    clSetq(*L_args408,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(*L_methods409,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_form411, object, stream;
    clSetq(L_form411, *L_args408);
    if (clTrue(L_form411))
      { clObject L_top412;
        clSetq(L_top412, clCar(L_form411, clEOA));
        { clObject L_0;
          clSetq(L_0, L_form411);
          clSetq(L_form411, clCdr(L_0, clEOA)); }
        clSetq(object, L_top412); }
    else clSetq(object, clMissingArgs(I_1, clEOA));
    if (clTrue(L_form411))
      { clObject L_top413;
        { clObject L_0;
          clSetq(L_0, L_form411);
          clSetq(L_top413, clCar(L_0, clEOA)); }
        { clObject L_0;
          clSetq(L_0, L_form411);
          clSetq(L_form411, clCdr(L_0, clEOA)); }
        clSetq(stream, L_top413); }
    else clSetq(stream, clMissingArgs(I_2, clEOA));
    if (clTrue(L_form411))
      { clObject L_0;
        clSetq(L_0, L_form411);
        clExtraArgs(L_0, clEOA); }
    { clObject L_1, L_0;
      clSetq(L_0, object);
      clSetq(L_1, stream);
      return(clFuncallFunction(clSymbolFunctionValue(clDESCRIBE_OBJECT),
                               L_0,
                               L_1,
                               clEOA)); } } }

clObject clWrap clVdecl(_ap)
{ clObject L_ap, object, keys, stream, right_margin;
  { clBeginParse(_ap);
    clSetq(object,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(keys, clVargs(_ap));
    if (clTrue(clSetq(L_ap, clKeyArg(keySTREAM, keys, clEOA))))
      { clObject L_0;
        clSetq(L_0, L_ap);
        clSetq(stream, clCar(L_0, clEOA)); }
    else clSetq(stream, clNIL);
    if (clTrue(clSetq(L_ap, clKeyArg(keyRIGHT_MARGIN, keys, clEOA))))
      { clObject L_0;
        clSetq(L_0, L_ap);
        clSetq(right_margin, clCar(L_0, clEOA)); }
    else
      clSetq(right_margin,
             clSymbolValue(clstarPRINT_RIGHT_MARGINstar, clEOA));
    clEndParse(_ap); }
  { clObject stream__R1;
    { clObject L_0;
      clSetq(L_0, stream);
      clSetq(stream__R1, clOutputStream(L_0, clEOA)); }
    { clObject L_value414;
      clSetq(L_value414, keys);
      { clObject L_local416, L_local417;
        clSetq(L_local416, L_value414);
        clSetq(L_local417, clNIL);
        clLabel(l_ITERATE418);
        if (clTrue(clAtom(L_local416, clEOA))) clLocalReturn(NIL);
        if (clTrue(clAtom(clCdr(L_local416, clEOA), clEOA)))
          clError(STRn_13, clEOA);
        else
          { clObject L_test__R1;
            { clObject L_0;
              clSetq(L_0, clCar(L_local416, clEOA));
              clSetq(L_test__R1, clEq(L_0, keySTREAM, clEOA)); }
            if (clTrue(L_test__R1))
              if (clTrue(L_local417))
                { { clObject L_0;
                    clSetq(L_0, clCdr(L_local417, clEOA));
                    clRplacd(L_0, clCddr(L_local416, clEOA), clEOA); }
                  (void) clT;
                  clLocalReturn(NIL); }
              else
                { { clObject L_0;
                    clSetq(L_0, L_value414);
                    clSetq(L_value414, clCddr(L_0, clEOA)); }
                  clSetq(keys, L_value414);
                  (void) clT;
                  clLocalReturn(NIL); } }
        { clObject L_value419, L_value420;
          clSetq(L_value419, clCddr(L_local416, clEOA));
          clSetq(L_value420, L_local416);
          clSetq(L_local416, L_value419);
          clSetq(L_local417, L_value420); }
        goto l_ITERATE418; }
      clBlockEnd(NIL); }
    { clObject string;
      { clObject L_4, L_3, L_1, L_0;
        clSetq(L_0, clSymbolFunctionValue(clWRITE_TO_STRING));
        clSetq(L_1, object);
        { clObject L_0__R1;
          { clObject L_g421;
            clSetq(L_g421, right_margin);
            clSetq(L_0__R1,
                   (clTrue(L_g421) ? L_g421 :
                    clSymbolValue(clstarDEFAULT_RIGHT_MARGINstar,
                                  clEOA))); }
          clSetq(L_3,
                 clFuncallFunction(clSymbolFunctionValue(clSUBT),
                                   L_0__R1,
                                   clFuncallFunction(clSymbolFunctionValue(clSTREAM_LINE_COLUMN),
                                                     stream__R1,
                                                     clEOA),
                                   clEOA)); }
        clSetq(L_4, keys);
        clSetq(string,
               clApply(L_0, L_1, keyRIGHT_MARGIN, L_3, L_4, clEOA)); }
      { clObject L_g0, i;
        clSetq(L_g0, clLength(string, clEOA));
        clSetq(i, I_0);
        { clObject CL_char;
          clSetq(CL_char, clNIL);
          clLabel(NEXT_LOOP);
          if (clTrue(clFuncallFunction(clSymbolFunctionValue(clGE),
                                       i,
                                       L_g0,
                                       clEOA)))
            goto END_LOOP;
          clSetq(CL_char,
                 clFuncallFunction(clSymbolFunctionValue(clSCHAR),
                                   string,
                                   i,
                                   clEOA));
          { clObject L_0;
            clSetq(L_0, CL_char);
            clWriteChar(L_0, stream__R1, clEOA); }
          { clObject L_test;
            { clObject L_test__R1;
              { clObject L_0;
                clSetq(L_0, CL_char);
                clSetq(L_test__R1, clEql(L_0, C_Space, clEOA)); }
              if (clTrue(L_test__R1))
                { clObject L_0;
                  { clObject L_item422;
                    clSetq(L_item422,
                           clFuncallFunction(clSymbolFunctionValue(clSCHAR),
                                             string,
                                             cl1PLUS_FUNC(i, clEOA),
                                             clEOA));
                    clSetq(L_0,
                           (_clEq(L_item422, C_Newline) ?
                            CONS_2 :
                            (_clEq(L_item422, C_Space) ?
                             CONS_3 :
                             clNIL))); }
                  clSetq(L_test, clNot(L_0, clEOA)); }
              else clSetq(L_test, clNIL); }
            if (clTrue(L_test))
              clPprintNewline(keyFILL, stream__R1, clEOA); }
          { clObject L_0;
            clSetq(L_0, i);
            clSetq(i, cl1PLUS_FUNC(L_0, clEOA)); }
          goto NEXT_LOOP;
          clLabel(END_LOOP);
          return(clValues1(clNIL)); } } } } }

void clInitDescriber __P((void)) 
{ clDbind(clstarPACKAGEstar);
  clDbind(clstarREADTABLEstar);
  clDbind(clstarLOAD_TRUENAMEstar);
  clDbind(clstarLOAD_PATHNAMEstar);
  clSetq(I_1, clIntFixnum(1));
  clSetq(I_2, clIntFixnum(2));
  clSetq(I_3, clIntFixnum(3));
  clSetq(STR____0, clCharpSimpleBaseString(" "));
  clSetq(STR_FILL__1, clCharpSimpleBaseString("FILL"));
  clSetq(keyFILL, clMakeKeyword(STR_FILL__1, clEOA));
  clSetq(STR_is_a___2, clCharpSimpleBaseString("is a "));
  clSetq(STR_at_hashx__3, clCharpSimpleBaseString("at #x"));
  clSetq(C_comma, clIntCharacter(','));
  clSetq(I_16, clIntFixnum(16));
  clSetq(C_dot, clIntCharacter('.'));
  clSetq(STR_LAMBDA_LIST__4, clCharpSimpleBaseString("LAMBDA-LIST"));
  clSetq(keyLAMBDA_LIST, clMakeKeyword(STR_LAMBDA_LIST__4, clEOA));
  clSetq(CONS_1, clCons(clSTREAM, clNIL, clEOA));
  clSetq(CONS_0, clCons(clOBJECT, CONS_1, clEOA));
  clSetq(STR_QUALIFIERS__5, clCharpSimpleBaseString("QUALIFIERS"));
  clSetq(keyQUALIFIERS, clMakeKeyword(STR_QUALIFIERS__5, clEOA));
  clSetq(STR_SPECIALIZERS__6, clCharpSimpleBaseString("SPECIALIZERS"));
  clSetq(keySPECIALIZERS, clMakeKeyword(STR_SPECIALIZERS__6, clEOA));
  clSetq(STR_FUNCTION__7, clCharpSimpleBaseString("FUNCTION"));
  clSetq(keyFUNCTION, clMakeKeyword(STR_FUNCTION__7, clEOA));
  clSetq(STR___8, clCharpSimpleBaseString(""));
  clSetq(STR_DECLARATIONS__9, clCharpSimpleBaseString("DECLARATIONS"));
  clSetq(keyDECLARATIONS, clMakeKeyword(STR_DECLARATIONS__9, clEOA));
  clSetq(STR_DOCUMENTATION__10,
         clCharpSimpleBaseString("DOCUMENTATION"));
  clSetq(keyDOCUMENTATION,
         clMakeKeyword(STR_DOCUMENTATION__10, clEOA));
  clSetq(STR_STREAM__11, clCharpSimpleBaseString("STREAM"));
  clSetq(keySTREAM, clMakeKeyword(STR_STREAM__11, clEOA));
  clSetq(STR_RIGHT_MARGIN__12,
         clCharpSimpleBaseString("RIGHT-MARGIN"));
  clSetq(keyRIGHT_MARGIN, clMakeKeyword(STR_RIGHT_MARGIN__12, clEOA));
  clSetq(STRn_13,
         clCharpSimpleBaseString("Odd-length property list in REMF."));
  clSetq(I_0, clIntFixnum(0));
  clSetq(C_Space, clIntCharacter(' '));
  clSetq(C_Newline, clIntCharacter('\n'));
  clSetq(CONS_3, clCons(C_Space, clNIL, clEOA));
  clSetq(CONS_2, clCons(C_Newline, CONS_3, clEOA));

  clSetSymbolFunctionValue(clDESCRIBE_HEADER,
                           clMakeClosure(0,
                                         clDescribeHeader,
                                         clNULL_HOOK));
  (void) clDESCRIBE_HEADER;
  clSetSymbolFunctionValue(clDESCRIBE_TRAILER,
                           clMakeClosure(0,
                                         clDescribeTrailer,
                                         clNULL_HOOK));
  (void) clDESCRIBE_TRAILER;
  clEnsureGenericFunction(clDESCRIBE_OBJECT,
                          keyLAMBDA_LIST,
                          CONS_0,
                          clEOA);
  { clObject L_8, L_6, L_0;
    clSetq(L_0, clEnsureGenericFunction(clDESCRIBE_OBJECT, clEOA));
    { clObject L_0__R1;
      clSetq(L_0__R1, clCanonicalizeSpecializer(clT, clEOA));
      clSetq(L_6,
             clList(L_0__R1, clCanonicalizeSpecializer(clT, clEOA),
                    clEOA)); }
    clSetq(L_8,
           clMakeClosure(0, clDescribeObject_clT_clT, clNULL_HOOK));
    clEnsureMethod(L_0, keyQUALIFIERS, clNIL, keyLAMBDA_LIST, CONS_0,
                   keySPECIALIZERS, L_6, keyFUNCTION, L_8,
                   keyDECLARATIONS, clNIL, keyDOCUMENTATION, clNIL,
                   clEOA); }
  clEnsureGenericFunction(clINSPECT_OBJECT,
                          keyLAMBDA_LIST,
                          CONS_0,
                          clEOA);
  { clObject L_8, L_6, L_0;
    clSetq(L_0, clEnsureGenericFunction(clINSPECT_OBJECT, clEOA));
    { clObject L_0__R1;
      clSetq(L_0__R1, clCanonicalizeSpecializer(clT, clEOA));
      clSetq(L_6,
             clList(L_0__R1, clCanonicalizeSpecializer(clT, clEOA),
                    clEOA)); }
    clSetq(L_8,
           clMakeClosure(0, clInspectObject_clT_clT, clNULL_HOOK));
    clEnsureMethod(L_0, keyQUALIFIERS, clNIL, keyLAMBDA_LIST, CONS_0,
                   keySPECIALIZERS, L_6, keyFUNCTION, L_8,
                   keyDECLARATIONS, clNIL, keyDOCUMENTATION, clNIL,
                   clEOA); }
  clSetSymbolFunctionValue(clWRAP,
                           clMakeClosure(0, clWrap, clNULL_HOOK));
  (void) clWRAP;
  clUnwind(4); }
