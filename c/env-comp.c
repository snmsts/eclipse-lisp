/* Generated by Eclipse Common Lisp 1.1-HOSTED on cad0.
   Friday the twenty-second of May, 1998, 12:34:13 am CDT. */
#include <eclipse.h>

clObject clCar(clProto), clCdr(clProto),
  clCharpSimpleBaseString __P((clCharp)), clCons(clProto),
  clConsp(clProto), clDelete(clProto), clEndp(clProto),
  clError(clProto), clExtraArgs(clProto), clFind(clProto),
  clIntern(clProto), clList(clProto), clListSTAR(clProto),
  clListp(clProto), cl_SETF_MacroFunction(clProto),
  clMakeKeyword(clProto), clMapcar(clProto), clMissingArgs(clProto),
  clParseMacro(clProto), clPkg(clProto), clValues(clProto);

extern clObject clCOMPILATION_SPEED, clDECLARATION, clDYNAMIC_EXTENT,
  clFTYPE, clIGNORABLE, clIGNORE, clINLINE, clNOTINLINE, clOPTIMIZE,
  clQUOTE, clSAFETY, clSPACE, clSPECIAL, clSPEED, clTYPE,
  clstarDECLARATION_HANDLERSstar, clCONTROL_ERROR,
  clDEFINE_DECLARATION, clFUNCTION, clGETHASH, clSETF,
  clTYPE_ABBREVIATION, clDEBUG;

static clObject CONS_0, CONS_1, CONS_2, CONS_3, CONS_4,  I_1,
  I_2, I_3, keyDECLARE, keyFORMAT_ARGUMENTS, keyFORMAT_CONTROL,
  keyFUNCTION, keyKEY, keyVARIABLE, 
  STR_DECLARE__3, STR_FORMAT_ARGUMENTS__8,
  STR_FORMAT_CONTROL__6, STR_FUNCTION__1, STR_KEY__2, STR_VARIABLE__0,
  STRn_7;

clObject clDefineDeclaration clVdecl(_ap)
{ clObject L_form, L_ignored, decl_name, lambda_list, form;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    if (clTrue(L_form))
      { clObject L_top397;
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_top397, clCar(L_0, clEOA)); }
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_form, clCdr(L_0, clEOA)); }
        clSetq(decl_name, L_top397); }
    else clSetq(decl_name, clMissingArgs(I_1, clEOA));
    if (clTrue(L_form))
      { clObject L_top398;
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_top398, clCar(L_0, clEOA)); }
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_form, clCdr(L_0, clEOA)); }
        clSetq(lambda_list, L_top398); }
    else clSetq(lambda_list, clMissingArgs(I_2, clEOA));
    clSetq(form, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_2, L_1;
    { clObject L_1__R1;
      { clObject L_1__R2;
        clSetq(L_1__R2, decl_name);
        clSetq(L_1__R1, clList(clQUOTE, L_1__R2, clEOA)); }
      clSetq(L_1, clListSTAR(clGETHASH, L_1__R1, CONS_0, clEOA)); }
    { clObject L_1__R1;
      { clObject L_1__R2, L_0__R2;
        clSetq(L_0__R2, decl_name);
        clSetq(L_1__R2, lambda_list);
        clSetq(L_1__R1, clParseMacro(L_0__R2, L_1__R2, form, clEOA)); }
      clSetq(L_2, clList(clFUNCTION, L_1__R1, clEOA)); }
    return(clList(clSETF, L_1, L_2, clEOA)); } }

static clObject clLambda_Lambda clVdecl(_ap)
{ clObject variable;
  { clBeginParse(_ap);
    clSetq(variable,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_0;
    clSetq(L_0, variable);
    return(clListSTAR(L_0, CONS_1, clEOA)); } }

static clObject clLambda clVdecl(_ap)
{ clObject L_form, L_ignored, variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1, clMakeClosure(0, clLambda_Lambda, clNULL_HOOK));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyVARIABLE, L_1, clEOA)); } }

static clObject clLambda_r1_Lambda clVdecl(_ap)
{ clObject variable;
  { clBeginParse(_ap);
    clSetq(variable,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_0;
    clSetq(L_0, variable);
    return(clList(L_0, clIGNORE, clT, clEOA)); } }

static clObject clLambda_r1 clVdecl(_ap)
{ clObject L_form, L_ignored, variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(0, clLambda_r1_Lambda, clNULL_HOOK));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyVARIABLE, L_1, clEOA)); } }

static clObject clLambda_r2_Lambda clVdecl(_ap)
{ clObject variable;
  { clBeginParse(_ap);
    clSetq(variable,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_0;
    clSetq(L_0, variable);
    return(clList(L_0, clIGNORABLE, clT, clEOA)); } }

static clObject clLambda_r2 clVdecl(_ap)
{ clObject L_form, L_ignored, variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(0, clLambda_r2_Lambda, clNULL_HOOK));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyVARIABLE, L_1, clEOA)); } }

static clObject clLambda_r3_Lambda clVdecl(_ap)
{ clObject variable;
  { clBeginParse(_ap);
    clSetq(variable,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_0;
    clSetq(L_0, variable);
    return(clList(L_0, clDYNAMIC_EXTENT, clT, clEOA)); } }

static clObject clLambda_r3 clVdecl(_ap)
{ clObject L_form, L_ignored, variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(0, clLambda_r3_Lambda, clNULL_HOOK));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyVARIABLE, L_1, clEOA)); } }

static clObject clLambda_r4_Lambda clVdecl(_ap)
{ clObject variable;
  { clBeginParse(_ap);
    clSetq(variable,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_0;
    clSetq(L_0, variable);
    return(clList(L_0, clINLINE, clINLINE, clEOA)); } }

static clObject clLambda_r4 clVdecl(_ap)
{ clObject L_form, L_ignored, variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(0, clLambda_r4_Lambda, clNULL_HOOK));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyFUNCTION, L_1, clEOA)); } }

static clObject clLambda_r5_Lambda clVdecl(_ap)
{ clObject variable;
  { clBeginParse(_ap);
    clSetq(variable,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_0;
    clSetq(L_0, variable);
    return(clList(L_0, clINLINE, clNOTINLINE, clEOA)); } }

static clObject clLambda_r5 clVdecl(_ap)
{ clObject L_form, L_ignored, variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(0, clLambda_r5_Lambda, clNULL_HOOK));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyFUNCTION, L_1, clEOA)); } }

clDeclareEnv(clLambda_r6_Lambda);
static clObject clLambda_r6_Lambda clVdecl(_ap)
{ clUseEnv(clLambda_r6_Lambda);
  { clObject variable;
    { clBeginParse(_ap);
      clSetq(variable,
             (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
      if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
      clEndParse(_ap); }
    { clObject L_2, L_0;
      clSetq(L_0, variable);
      clSetq(L_2, clEnv(0, *type));
      return(clList(L_0, clTYPE, L_2, clEOA)); } } }

static clObject clLambda_r6 clVdecl(_ap)
{ clObject L_form, L_ignored, *type = clMakeBinding(), variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    if (clTrue(L_form))
      { clObject L_top444;
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_top444, clCar(L_0, clEOA)); }
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_form, clCdr(L_0, clEOA)); }
        clSetq(*type, L_top444); }
    else clSetq(*type, clMissingArgs(I_1, clEOA));
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(1,
                           clLambda_r6_Lambda,
                           &clEnvHook(clLambda_r6_Lambda),
                           &*type));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyVARIABLE, L_1, clEOA)); } }

clDeclareEnv(clLambda_r7_Lambda);
static clObject clLambda_r7_Lambda clVdecl(_ap)
{ clUseEnv(clLambda_r7_Lambda);
  { clObject variable;
    { clBeginParse(_ap);
      clSetq(variable,
             (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
      if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
      clEndParse(_ap); }
    { clObject L_2, L_0;
      clSetq(L_0, variable);
      clSetq(L_2, clEnv(0, *type));
      return(clList(L_0, clFTYPE, L_2, clEOA)); } } }

static clObject clLambda_r7 clVdecl(_ap)
{ clObject L_form, L_ignored, *type = clMakeBinding(), variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    if (clTrue(L_form))
      { clObject L_top452;
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_top452, clCar(L_0, clEOA)); }
        { clObject L_0;
          clSetq(L_0, L_form);
          clSetq(L_form, clCdr(L_0, clEOA)); }
        clSetq(*type, L_top452); }
    else clSetq(*type, clMissingArgs(I_1, clEOA));
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(1,
                           clLambda_r7_Lambda,
                           &clEnvHook(clLambda_r7_Lambda),
                           &*type));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyFUNCTION, L_1, clEOA)); } }

clDeclareEnv(clLambda_r8_Lambda);
static clObject clLambda_r8_Lambda clVdecl(_ap)
{ clUseEnv(clLambda_r8_Lambda);
  { clObject variable;
    { clBeginParse(_ap);
      clSetq(variable,
             (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
      if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
      clEndParse(_ap); }
    { clObject L_0;
      clSetq(L_0, variable);
      return(clList(L_0, clTYPE, clCar(clEnv(0, *form), clEOA),
                    clEOA)); } } }

static clObject clLambda_r8 clVdecl(_ap)
{ clObject L_form, L_ignored, *form = clMakeBinding(), variables;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    clSetq(*form, L_form);
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(variables, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1;
    { clObject L_0__R1;
      clSetq(L_0__R1,
             clMakeClosure(1,
                           clLambda_r8_Lambda,
                           &clEnvHook(clLambda_r8_Lambda),
                           &*form));
      clSetq(L_1, clMapcar(L_0__R1, variables, clEOA)); }
    return(clValues(keyVARIABLE, L_1, clEOA)); } }

static clObject clLambda_r9_Item_Lambda clVdecl(_ap)
{ clObject obj;
  { clBeginParse(_ap);
    clSetq(obj,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_test;
    { clObject L_0;
      clSetq(L_0, obj);
      clSetq(L_test, clConsp(L_0, clEOA)); }
    if (clTrue(L_test))
      { clObject L_0; clSetq(L_0, obj); return(clCar(L_0, clEOA)); }
    else return(clValues1(obj)); } }

static clObject clLambda_r9_Item clVdecl(_ap)
{ clObject name, data;
  { clBeginParse(_ap);
    clSetq(name,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(data,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject found;
    { clObject L_1, L_0;
      clSetq(L_0, name);
      clSetq(L_1, data);
      clSetq(found,
             clFind(L_0, L_1, keyKEY,
                    clMakeClosure(0,
                                  clLambda_r9_Item_Lambda,
                                  clNULL_HOOK),
                    clEOA)); }
    if (clTrue(clListp(found, clEOA)))
      return(clValues1(found));
    else return(clList(found, I_3, clEOA)); } }

static clObject clLambda_r9 clVdecl(_ap)
{ clObject L_form, L_ignored, data;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(L_ignored,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(data, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject _Item_;
    clSetq(_Item_, clMakeClosure(0, clLambda_r9_Item, clNULL_HOOK));
    { clObject L_1;
      { clObject L_1__R1;
        { clObject L_4, L_3, L_2, L_1__R2;
          clSetq(L_1__R2,
                 clFuncallFunction(_Item_, clSPEED, data, clEOA));
          clSetq(L_2,
                 clFuncallFunction(_Item_, clSAFETY, data, clEOA));
          clSetq(L_3,
                 clFuncallFunction(_Item_,
                                   clCOMPILATION_SPEED,
                                   data,
                                   clEOA));
          clSetq(L_4, clFuncallFunction(_Item_, clSPACE, data, clEOA));
          clSetq(L_1__R1,
                 clList(clOPTIMIZE,
                        L_1__R2,
                        L_2,
                        L_3,
                        L_4,
                        clFuncallFunction(_Item_,
                                          clDEBUG,
                                          data,
                                          clEOA),
                        clEOA)); }
        clSetq(L_1, clDelete(clNIL, L_1__R1, clEOA)); }
      return(clValues(keyDECLARE, L_1, clEOA)); } } }

static clObject clLambda_r10_Lambda clVdecl(_ap)
{ clObject ignore;
  { clBeginParse(_ap); clSetq(ignore, clVargs(_ap)); clEndParse(_ap); }
  return(clValues1(clNIL)); }

static clObject clLambda_r10 clVdecl(_ap)
{ clObject L_form, env, names;
  { clBeginParse(_ap);
    clSetq(L_form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(env,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    { clObject L_0;
      clSetq(L_0, L_form);
      clSetq(L_form, clCdr(L_0, clEOA)); }
    clSetq(names, L_form);
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  if (clTrue(env))
    clError(clCONTROL_ERROR, keyFORMAT_CONTROL, STRn_7,
            keyFORMAT_ARGUMENTS,
            clList(clListSTAR(clDECLARATION, names, clEOA), clEOA),
            clEOA);
  { clObject L_sublist462, name;
    clSetq(L_sublist462, names);
    clSetq(name, clCar(L_sublist462, clEOA));
    clLabel(l_ITERATE463);
    if (clTrue(clEndp(L_sublist462, clEOA))) return(clValues1(clNIL));
    { clObject L_arg466, L_value464;
      clSetq(L_arg466,
             clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
      clSetq(L_value464,
             clMakeClosure(0, clLambda_r10_Lambda, clNULL_HOOK));
      clFuncallFunction(clFdefinition(CONS_3, clEOA),
                        L_value464,
                        name,
                        L_arg466,
                        clEOA); }
    { clObject L_0;
      clSetq(L_0, L_sublist462);
      clSetq(L_sublist462, clCdr(L_0, clEOA)); }
    { clObject L_0;
      clSetq(L_0, L_sublist462);
      clSetq(name, clCar(L_0, clEOA)); }
    goto l_ITERATE463; } }

void clInitEnvComp __P((void)) 
{ clDbind(clstarPACKAGEstar);
  clDbind(clstarREADTABLEstar);
  clDbind(clstarLOAD_TRUENAMEstar);
  clDbind(clstarLOAD_PATHNAMEstar);
  clSetq(I_1, clIntFixnum(1));
  clSetq(I_2, clIntFixnum(2));
  clSetq(CONS_0, clCons(clstarDECLARATION_HANDLERSstar, clNIL, clEOA));
  clSetq(STR_VARIABLE__0, clCharpSimpleBaseString("VARIABLE"));
  clSetq(keyVARIABLE, clMakeKeyword(STR_VARIABLE__0, clEOA));
  clSetq(CONS_2, clCons(clT, clNIL, clEOA));
  clSetq(CONS_1, clCons(clSPECIAL, CONS_2, clEOA));
  clSetq(CONS_4, clCons(clGETHASH, clNIL, clEOA));
  clSetq(CONS_3, clCons(clSETF, CONS_4, clEOA));
  clSetq(STR_FUNCTION__1, clCharpSimpleBaseString("FUNCTION"));
  clSetq(keyFUNCTION, clMakeKeyword(STR_FUNCTION__1, clEOA));
  clSetq(STR_KEY__2, clCharpSimpleBaseString("KEY"));
  clSetq(keyKEY, clMakeKeyword(STR_KEY__2, clEOA));
  clSetq(I_3, clIntFixnum(3));
  clSetq(STR_DECLARE__3, clCharpSimpleBaseString("DECLARE"));
  clSetq(keyDECLARE, clMakeKeyword(STR_DECLARE__3, clEOA));
  clSetq(STR_FORMAT_CONTROL__6,
         clCharpSimpleBaseString("FORMAT-CONTROL"));
  clSetq(keyFORMAT_CONTROL,
         clMakeKeyword(STR_FORMAT_CONTROL__6, clEOA));
  clSetq(STRn_7,
         clCharpSimpleBaseString("~s can only be used as a proclamation."));
  clSetq(STR_FORMAT_ARGUMENTS__8,
         clCharpSimpleBaseString("FORMAT-ARGUMENTS"));
  clSetq(keyFORMAT_ARGUMENTS,
         clMakeKeyword(STR_FORMAT_ARGUMENTS__8, clEOA));


  { clObject L_value395;
    clSetq(L_value395,
           clMakeClosure(0, clDefineDeclaration, clNULL_HOOK));
    cl_SETF_MacroFunction(L_value395, clDEFINE_DECLARATION, clEOA); }
  (void) clDEFINE_DECLARATION;
  { clObject L_arg401, L_value399;
    clSetq(L_arg401,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value399, clMakeClosure(0, clLambda, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value399,
                      clSPECIAL,
                      L_arg401,
                      clEOA); }
  { clObject L_arg408, L_value406;
    clSetq(L_arg408,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value406, clMakeClosure(0, clLambda_r1, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value406,
                      clIGNORE,
                      L_arg408,
                      clEOA); }
  { clObject L_arg415, L_value413;
    clSetq(L_arg415,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value413, clMakeClosure(0, clLambda_r2, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value413,
                      clIGNORABLE,
                      L_arg415,
                      clEOA); }
  { clObject L_arg422, L_value420;
    clSetq(L_arg422,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value420, clMakeClosure(0, clLambda_r3, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value420,
                      clDYNAMIC_EXTENT,
                      L_arg422,
                      clEOA); }
  { clObject L_arg429, L_value427;
    clSetq(L_arg429,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value427, clMakeClosure(0, clLambda_r4, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value427,
                      clINLINE,
                      L_arg429,
                      clEOA); }
  { clObject L_arg436, L_value434;
    clSetq(L_arg436,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value434, clMakeClosure(0, clLambda_r5, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value434,
                      clNOTINLINE,
                      L_arg436,
                      clEOA); }
  { clObject L_arg443, L_value441;
    clSetq(L_arg443,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value441, clMakeClosure(0, clLambda_r6, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value441,
                      clTYPE,
                      L_arg443,
                      clEOA); }
  { clObject L_arg451, L_value449;
    clSetq(L_arg451,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value449, clMakeClosure(0, clLambda_r7, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value449,
                      clFTYPE,
                      L_arg451,
                      clEOA); }
  { clObject L_arg455, L_value453;
    clSetq(L_arg455,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value453, clMakeClosure(0, clLambda_r8, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value453,
                      clTYPE_ABBREVIATION,
                      L_arg455,
                      clEOA); }
  { clObject L_arg458, L_value456;
    clSetq(L_arg458,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value456, clMakeClosure(0, clLambda_r9, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value456,
                      clOPTIMIZE,
                      L_arg458,
                      clEOA); }
  { clObject L_arg461, L_value459;
    clSetq(L_arg461,
           clSymbolValue(clstarDECLARATION_HANDLERSstar, clEOA));
    clSetq(L_value459, clMakeClosure(0, clLambda_r10, clNULL_HOOK));
    clFuncallFunction(clFdefinition(CONS_3, clEOA),
                      L_value459,
                      clDECLARATION,
                      L_arg461,
                      clEOA); }

  clUnwind(4); }
