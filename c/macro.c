/* Generated by Eclipse Common Lisp 1.1-HOSTED on cad0.
   Tuesday the twenty-sixth of May, 1998, 3:46:21 pm CDT. */
#include <eclipse.h>

clObject clBindingValue(clProto), clCar(clProto), clCarEq(clProto),
  clCdr(clProto), clCharpSimpleBaseString __P((clCharp)),
  clCheckTypef(clProto), clCons(clProto), clConsp(clProto),
  clEq(clProto), clEql(clProto), clError(clProto), clExpand(clProto),
  clExtraArgs(clProto), clFuncall(clProto),
  clFunctionInformation(clProto), clFunctionNameKey(clProto),
  clGensym(clProto), clGetMacroFunction(clProto),
  clGetSetfExpansion(clProto), clGetSymbolMacroFunction(clProto),
  clGetf(clProto), clGlobalMacroFunction(clProto),
  clGlobalSymbolMacroFunction(clProto), clList(clProto),
  clMacroFunctionFunction(clProto), clMacroexpand(clProto),
  clMacroexpand1(clProto), clMakeKeyword(clProto),
  clMissingArgs(clProto), clNot(clProto), clSetfFunctionNameP(clProto),
  clSymbolFunction(clProto), clSymbolp(clProto), clValues(clProto),
  clVariableInformation(clProto);

extern clObject clCOMPILER_MACRO, clINLINE, clLAMBDA, clNOTINLINE,
  clSETQ, clSYMBOL, clstarMACROEXPAND_HOOKstar,
  clCOMPILER_MACRO_FUNCTION, clEXPAND, clFORM_INFORMATION, clFUNCALL,
  clFUNCTION, clGENERATE_SETF_METHOD, clGET_MACRO_FUNCTION,
  clGET_SETF_EXPANSION, clGET_SYMBOL_MACRO_FUNCTION,
  clGLOBAL_COMPILER_MACRO_FUNCTION, clGLOBAL_MACRO_FUNCTION, clLIST,
  clMACRO_FUNCTION, clMACROEXPAND, clMACROEXPAND_1, clMEMBER, clSETF,
  clSETF_COMPILER_MACRO, clTYPE_ERROR;

static clObject CONS_0, CONS_1, CONS_2, CONS_3, CONS_4, CONS_5, CONS_6,
  CONS_7, I_1, I_2, I_3, keyDATUM, keyEXPECTED_TYPE, keyFUNCTION,
  keyLEXICAL, keyMACRO, keySPECIAL, keySYMBOL_MACRO, STR_DATUM__6,
  STR_EXPECTED_TYPE__7, STR_FUNCTION__1, STR_LEXICAL__4, STR_MACRO__0,
  STR_SPECIAL__2, STR_SYMBOL_MACRO__3, STR_VALUE__5;

clObject clGlobalMacroFunction clVdecl(_ap)
{ clObject name;
  { clBeginParse(_ap);
    clSetq(name,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_1, L_0;
    clSetq(L_0, name);
    { clObject L_0__R1;
      clSetq(L_0__R1, name);
      clSetq(L_1, clSymbolFunction(L_0__R1, clEOA)); }
    return(clMacroFunctionFunction(L_0, L_1, clEOA)); } }

clObject clGlobalCompilerMacroFunction clVdecl(_ap)
{ clObject function_name;
  { clBeginParse(_ap);
    clSetq(function_name,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject setfp;
    { clObject L_0;
      clSetq(L_0, function_name);
      clSetq(setfp, clSetfFunctionNameP(L_0, clEOA)); }
    { clObject L_1, L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, function_name);
        clSetq(L_0, clFunctionNameKey(L_0__R1, setfp, clEOA)); }
      clSetq(L_1,
             (clTrue(setfp) ? clSETF_COMPILER_MACRO :
              clCOMPILER_MACRO));
      return(clValues1(clSystemProperty(L_0, L_1, clNIL))); } } }

clObject clGetMacroFunction clVdecl(_ap)
{ clObject local_def, name;
  { clBeginParse(_ap);
    clSetq(local_def,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(name,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  if (clTrue(local_def))
    { clObject L_0;
      clSetq(L_0, local_def);
      return(clBindingValue(L_0, clEOA)); }
  else
    { clObject L_0;
      clSetq(L_0, name);
      return(clGlobalMacroFunction(L_0, clEOA)); } }

clObject clGetSymbolMacroFunction clVdecl(_ap)
{ clObject local_def, name;
  { clBeginParse(_ap);
    clSetq(local_def,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(name,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  if (clTrue(local_def))
    { clObject L_0;
      clSetq(L_0, local_def);
      return(clBindingValue(L_0, clEOA)); }
  else
    { clObject L_0;
      clSetq(L_0, name);
      return(clGlobalSymbolMacroFunction(L_0, clEOA)); } }

clObject clMacroFunction clVdecl(_ap)
{ clObject symbol, env;
  { clBeginParse(_ap);
    clSetq(symbol,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(env, (_clVp(_ap) ? clVpop(_ap) : clNIL));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_values395, function_type, local_def;
    { clMultipleValueCall(MVC);
      clSetq(MVC, clSymbolFunctionValue(clLIST));
      { clObject L_1, L_0;
        { clObject L_0__R1;
          clSetq(L_0__R1, symbol);
          clSetq(L_0, clCheckTypef(L_0__R1, clSYMBOL, clEOA)); }
        clSetq(L_1, env);
        clFunctionInformation(L_0, L_1, clEOA); }
      clAccumulateValues(MVC);
      clSetq(L_values395, clMultipleValueFuncall(MVC)); }
    clSetq(function_type, clCar(L_values395, clEOA));
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values395);
        clSetq(L_0, clSetq(L_values395, clCdr(L_0__R1, clEOA))); }
      clSetq(local_def, clCar(L_0, clEOA)); }
    if (_clEq(function_type, keyMACRO))
      { clObject L_1;
        clSetq(L_1, symbol);
        return(clGetMacroFunction(local_def, L_1, clEOA)); }
    else return(clValues1(clNIL)); } }

clObject clExpand clVdecl(_ap)
{ clObject func, form, env;
  { clBeginParse(_ap);
    clSetq(func,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    clSetq(env,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_3, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_3, L_2, L_1, L_0;
    clSetq(L_0, clSymbolValue(clstarMACROEXPAND_HOOKstar, clEOA));
    clSetq(L_1, func);
    clSetq(L_2, form);
    clSetq(L_3, env);
    return(clFuncall(L_0, L_1, L_2, L_3, clEOA)); } }

clObject clFormInformation clVdecl(_ap)
{ clObject form, environment;
  { clBeginParse(_ap);
    clSetq(form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(environment,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_2, clEOA)));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject consp, key;
    { clObject L_0;
      clSetq(L_0, form);
      clSetq(consp, clConsp(L_0, clEOA)); }
    if (clTrue(consp))
      { clObject L_0;
        clSetq(L_0, form);
        clSetq(key, clCar(L_0, clEOA)); }
    else clSetq(key, form);
    { clObject L_test;
      { clObject L_g397;
        { clObject L_0;
          clSetq(L_0, key);
          clSetq(L_g397, clSymbolp(L_0, clEOA)); }
        if (clTrue(L_g397))
          clSetq(L_test, L_g397);
        else
          { clObject L_0;
            clSetq(L_0, key);
            clSetq(L_test, clCarEq(L_0, clLAMBDA, clEOA)); } }
      if (clTrue(L_test))
        { clObject L_values398, type, binding;
          { clMultipleValueCall(MVC);
            clSetq(MVC, clSymbolFunctionValue(clLIST));
            if (clTrue(consp))
              { clObject L_1, L_0;
                clSetq(L_0, key);
                clSetq(L_1, environment);
                clFunctionInformation(L_0, L_1, clEOA); }
            else
              { clObject L_1, L_0;
                clSetq(L_0, key);
                clSetq(L_1, environment);
                clVariableInformation(L_0, L_1, clEOA); }
            clAccumulateValues(MVC);
            clSetq(L_values398, clMultipleValueFuncall(MVC)); }
          clSetq(type, clCar(L_values398, clEOA));
          { clObject L_0;
            { clObject L_0__R1;
              clSetq(L_0__R1, L_values398);
              clSetq(L_0,
                     clSetq(L_values398, clCdr(L_0__R1, clEOA))); }
            clSetq(binding, clCar(L_0, clEOA)); }
          { clObject L_2, L_0;
            clSetq(L_0,
                   (clTrue(type) ? type :
                    (clTrue(consp) ? keyFUNCTION : keySPECIAL)));
            clSetq(L_2, key);
            return(clValues(L_0, binding, L_2, clEOA)); } }
      else return(clValues1(clNIL)); } } }

clObject clMacroexpand1 clVdecl(_ap)
{ clObject form, env;
  { clBeginParse(_ap);
    clSetq(form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(env, (_clVp(_ap) ? clVpop(_ap) : clNIL));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_values400, function_type, binding, key;
    { clMultipleValueCall(MVC);
      clSetq(MVC, clSymbolFunctionValue(clLIST));
      { clObject L_1, L_0;
        clSetq(L_0, form);
        clSetq(L_1, env);
        clFuncallFunction(clSymbolFunctionValue(clFORM_INFORMATION),
                          L_0,
                          L_1,
                          clEOA); }
      clAccumulateValues(MVC);
      clSetq(L_values400, clMultipleValueFuncall(MVC)); }
    clSetq(function_type, clCar(L_values400, clEOA));
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values400);
        clSetq(L_0, clSetq(L_values400, clCdr(L_0__R1, clEOA))); }
      clSetq(binding, clCar(L_0, clEOA)); }
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values400);
        clSetq(L_0, clSetq(L_values400, clCdr(L_0__R1, clEOA))); }
      clSetq(key, clCar(L_0, clEOA)); }
    if (_clEq(function_type, keyMACRO))
      { clObject L_0;
        { clObject L_2, L_1__R1, L_0__R1;
          clSetq(L_0__R1, clGetMacroFunction(binding, key, clEOA));
          clSetq(L_1__R1, form);
          clSetq(L_2, env);
          clSetq(L_0, clExpand(L_0__R1, L_1__R1, L_2, clEOA)); }
        return(clValues(L_0, clT, clEOA)); }
    else if (_clEq(function_type, keySYMBOL_MACRO))
      { clObject L_0;
        { clObject L_2, L_1__R1, L_0__R1;
          clSetq(L_0__R1,
                 clGetSymbolMacroFunction(binding, key, clEOA));
          clSetq(L_1__R1, form);
          clSetq(L_2, env);
          clSetq(L_0, clExpand(L_0__R1, L_1__R1, L_2, clEOA)); }
        return(clValues(L_0, clT, clEOA)); }
    else
      { clObject L_0;
        clSetq(L_0, form);
        return(clValues(L_0, clNIL, clEOA)); } } }

clObject clMacroexpand clVdecl(_ap)
{ clObject form, env;
  { clBeginParse(_ap);
    clSetq(form,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(env, (_clVp(_ap) ? clVpop(_ap) : clNIL));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_values402, form__R1, expanded_p;
    { clMultipleValueCall(MVC);
      clSetq(MVC, clSymbolFunctionValue(clLIST));
      { clObject L_1, L_0;
        clSetq(L_0, form);
        clSetq(L_1, env);
        clMacroexpand1(L_0, L_1, clEOA); }
      clAccumulateValues(MVC);
      clSetq(L_values402, clMultipleValueFuncall(MVC)); }
    clSetq(form__R1, clCar(L_values402, clEOA));
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values402);
        clSetq(L_0, clSetq(L_values402, clCdr(L_0__R1, clEOA))); }
      clSetq(expanded_p, clCar(L_0, clEOA)); }
    if (clTrue(expanded_p))
      { clObject L_0;
        { clObject L_1__R1;
          clSetq(L_1__R1, env);
          clSetq(L_0, clMacroexpand(form__R1, L_1__R1, clEOA)); }
        return(clValues(L_0, clT, clEOA)); }
    else return(clValues(form__R1, clNIL, clEOA)); } }

clObject clGetSetfExpansion clVdecl(_ap)
{ clObject place, environment;
  { clBeginParse(_ap);
    clSetq(place,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(environment, (_clVp(_ap) ? clVpop(_ap) : clNIL));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_values403, type, binding, key;
    { clMultipleValueCall(MVC);
      clSetq(MVC, clSymbolFunctionValue(clLIST));
      { clObject L_1, L_0;
        clSetq(L_0, place);
        clSetq(L_1, environment);
        clFuncallFunction(clSymbolFunctionValue(clFORM_INFORMATION),
                          L_0,
                          L_1,
                          clEOA); }
      clAccumulateValues(MVC);
      clSetq(L_values403, clMultipleValueFuncall(MVC)); }
    clSetq(type, clCar(L_values403, clEOA));
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values403);
        clSetq(L_0, clSetq(L_values403, clCdr(L_0__R1, clEOA))); }
      clSetq(binding, clCar(L_0, clEOA)); }
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values403);
        clSetq(L_0, clSetq(L_values403, clCdr(L_0__R1, clEOA))); }
      clSetq(key, clCar(L_0, clEOA)); }
    { clObject expander;
      { clObject L_test;
        { clObject L_0;
          if (clTrue(binding))
            clSetq(L_0, binding);
          else
            { clObject L_1;
              clSetq(L_1, place);
              clSetq(L_0, clEq(key, L_1, clEOA)); }
          clSetq(L_test, clNot(L_0, clEOA)); }
        clSetq(expander,
               (clTrue(L_test) ? clSetfExpander(key) : clNIL)); }
      if (clTrue(expander))
        { clObject L_2, L_1, L_0;
          clSetq(L_0, expander);
          clSetq(L_1, place);
          clSetq(L_2, environment);
          return(clFuncall(L_0, L_1, L_2, clEOA)); }
      else if (_clEq(type, keyMACRO))
        { clObject L_1, L_0;
          { clObject L_2, L_1__R1, L_0__R1;
            clSetq(L_0__R1, clGetMacroFunction(binding, key, clEOA));
            clSetq(L_1__R1, place);
            clSetq(L_2, environment);
            clSetq(L_0, clExpand(L_0__R1, L_1__R1, L_2, clEOA)); }
          clSetq(L_1, environment);
          return(clGetSetfExpansion(L_0, L_1, clEOA)); }
      else if (_clEq(type, keySYMBOL_MACRO))
        { clObject L_1, L_0;
          { clObject L_2, L_1__R1, L_0__R1;
            clSetq(L_0__R1,
                   clGetSymbolMacroFunction(binding, key, clEOA));
            clSetq(L_1__R1, place);
            clSetq(L_2, environment);
            clSetq(L_0, clExpand(L_0__R1, L_1__R1, L_2, clEOA)); }
          clSetq(L_1, environment);
          return(clGetSetfExpansion(L_0, L_1, clEOA)); }
      else if (clTrue((_clEq(type, keySPECIAL) ?
                       CONS_0 :
                       (_clEq(type, keyLEXICAL) ? CONS_1 : clNIL))))
        { clObject var;
          clSetq(var, clGensym(STR_VALUE__5, clEOA));
          { clObject L_4, L_3, L_2;
            clSetq(L_2, clList(var, clEOA));
            { clObject L_1__R1;
              clSetq(L_1__R1, place);
              clSetq(L_3, clList(clSETQ, L_1__R1, var, clEOA)); }
            clSetq(L_4, place);
            return(clValues(clNIL, clNIL, L_2, L_3, L_4, clEOA)); } }
      else if (_clEq(type, keyFUNCTION))
        { clObject L_1, L_0;
          clSetq(L_0, place);
          clSetq(L_1,
                 clList(clFUNCALL,
                        clList(clFUNCTION,
                               clList(clSETF, key, clEOA),
                               clEOA),
                        clEOA));
          return(clFuncallFunction(clSymbolFunctionValue(clGENERATE_SETF_METHOD),
                                   L_0,
                                   L_1,
                                   clT,
                                   clEOA)); }
      else
        return(clError(clTYPE_ERROR,
                       keyDATUM,
                       type,
                       keyEXPECTED_TYPE,
                       CONS_2,
                       clEOA)); } } }

clObject clCompilerMacroFunction clVdecl(_ap)
{ clObject name, env;
  { clBeginParse(_ap);
    clSetq(name,
           (_clVp(_ap) ? clVpop(_ap) : clMissingArgs(I_1, clEOA)));
    clSetq(env, (_clVp(_ap) ? clVpop(_ap) : clNIL));
    if (_clVp(_ap)) clExtraArgs(clVargs(_ap), clEOA);
    clEndParse(_ap); }
  { clObject L_values408, function_type, local_def, declarations;
    { clMultipleValueCall(MVC);
      clSetq(MVC, clSymbolFunctionValue(clLIST));
      { clObject L_1, L_0;
        clSetq(L_0, name);
        clSetq(L_1, env);
        clFunctionInformation(L_0, L_1, clEOA); }
      clAccumulateValues(MVC);
      clSetq(L_values408, clMultipleValueFuncall(MVC)); }
    clSetq(function_type, clCar(L_values408, clEOA));
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values408);
        clSetq(L_0, clSetq(L_values408, clCdr(L_0__R1, clEOA))); }
      clSetq(local_def, clCar(L_0, clEOA)); }
    { clObject L_0;
      { clObject L_0__R1;
        clSetq(L_0__R1, L_values408);
        clSetq(L_0, clSetq(L_values408, clCdr(L_0__R1, clEOA))); }
      clSetq(declarations, clCar(L_0, clEOA)); }
    { clObject L_test;
      { clObject L_0;
        if (clTrue(local_def))
          clSetq(L_0, local_def);
        else
          { clObject L_0__R1;
            clSetq(L_0__R1, clGetf(declarations, clINLINE, clEOA));
            clSetq(L_0, clEql(L_0__R1, clNOTINLINE, clEOA)); }
        clSetq(L_test, clNot(L_0, clEOA)); }
      if (clTrue(L_test))
        { clObject L_0;
          clSetq(L_0, name);
          return(clFuncallFunction(clSymbolFunctionValue(clGLOBAL_COMPILER_MACRO_FUNCTION),
                                   L_0,
                                   clEOA)); }
      else return(clValues1(clNIL)); } } }

void clInitMacro __P((void)) 
{ clDbind(clstarPACKAGEstar);
  clDbind(clstarREADTABLEstar);
  clDbind(clstarLOAD_TRUENAMEstar);
  clDbind(clstarLOAD_PATHNAMEstar);
  clSetq(I_1, clIntFixnum(1));
  clSetq(I_2, clIntFixnum(2));
  clSetq(STR_MACRO__0, clCharpSimpleBaseString("MACRO"));
  clSetq(keyMACRO, clMakeKeyword(STR_MACRO__0, clEOA));
  clSetq(I_3, clIntFixnum(3));
  clSetq(STR_FUNCTION__1, clCharpSimpleBaseString("FUNCTION"));
  clSetq(keyFUNCTION, clMakeKeyword(STR_FUNCTION__1, clEOA));
  clSetq(STR_SPECIAL__2, clCharpSimpleBaseString("SPECIAL"));
  clSetq(keySPECIAL, clMakeKeyword(STR_SPECIAL__2, clEOA));
  clSetq(STR_SYMBOL_MACRO__3, clCharpSimpleBaseString("SYMBOL-MACRO"));
  clSetq(keySYMBOL_MACRO, clMakeKeyword(STR_SYMBOL_MACRO__3, clEOA));
  clSetq(STR_LEXICAL__4, clCharpSimpleBaseString("LEXICAL"));
  clSetq(keyLEXICAL, clMakeKeyword(STR_LEXICAL__4, clEOA));
  clSetq(CONS_1, clCons(keyLEXICAL, clNIL, clEOA));
  clSetq(CONS_0, clCons(keySPECIAL, CONS_1, clEOA));
  clSetq(STR_VALUE__5, clCharpSimpleBaseString("VALUE"));
  clSetq(STR_DATUM__6, clCharpSimpleBaseString("DATUM"));
  clSetq(keyDATUM, clMakeKeyword(STR_DATUM__6, clEOA));
  clSetq(STR_EXPECTED_TYPE__7,
         clCharpSimpleBaseString("EXPECTED-TYPE"));
  clSetq(keyEXPECTED_TYPE, clMakeKeyword(STR_EXPECTED_TYPE__7, clEOA));
  clSetq(CONS_7, clCons(keyFUNCTION, clNIL, clEOA));
  clSetq(CONS_6, clCons(keyLEXICAL, CONS_7, clEOA));
  clSetq(CONS_5, clCons(keySPECIAL, CONS_6, clEOA));
  clSetq(CONS_4, clCons(keySYMBOL_MACRO, CONS_5, clEOA));
  clSetq(CONS_3, clCons(keyMACRO, CONS_4, clEOA));
  clSetq(CONS_2, clCons(clMEMBER, CONS_3, clEOA));

  clSetSymbolFunctionValue(clGLOBAL_MACRO_FUNCTION,
                           clMakeClosure(0,
                                         clGlobalMacroFunction,
                                         clNULL_HOOK));
  (void) clGLOBAL_MACRO_FUNCTION;
  clSetSymbolFunctionValue(clGLOBAL_COMPILER_MACRO_FUNCTION,
                           clMakeClosure(0,
                                         clGlobalCompilerMacroFunction,
                                         clNULL_HOOK));
  (void) clGLOBAL_COMPILER_MACRO_FUNCTION;
  clSetSymbolFunctionValue(clGET_MACRO_FUNCTION,
                           clMakeClosure(0,
                                         clGetMacroFunction,
                                         clNULL_HOOK));
  (void) clGET_MACRO_FUNCTION;
  clSetSymbolFunctionValue(clGET_SYMBOL_MACRO_FUNCTION,
                           clMakeClosure(0,
                                         clGetSymbolMacroFunction,
                                         clNULL_HOOK));
  (void) clGET_SYMBOL_MACRO_FUNCTION;
  clSetSymbolFunctionValue(clMACRO_FUNCTION,
                           clMakeClosure(0,
                                         clMacroFunction,
                                         clNULL_HOOK));
  (void) clMACRO_FUNCTION;
  clSetSymbolFunctionValue(clEXPAND,
                           clMakeClosure(0, clExpand, clNULL_HOOK));
  (void) clEXPAND;
  clSetSymbolFunctionValue(clFORM_INFORMATION,
                           clMakeClosure(0,
                                         clFormInformation,
                                         clNULL_HOOK));
  (void) clFORM_INFORMATION;
  clSetSymbolFunctionValue(clMACROEXPAND_1,
                           clMakeClosure(0,
                                         clMacroexpand1,
                                         clNULL_HOOK));
  (void) clMACROEXPAND_1;
  clSetSymbolFunctionValue(clMACROEXPAND,
                           clMakeClosure(0,
                                         clMacroexpand,
                                         clNULL_HOOK));
  (void) clMACROEXPAND;
  clSetSymbolFunctionValue(clGET_SETF_EXPANSION,
                           clMakeClosure(0,
                                         clGetSetfExpansion,
                                         clNULL_HOOK));
  (void) clGET_SETF_EXPANSION;
  clSetSymbolFunctionValue(clCOMPILER_MACRO_FUNCTION,
                           clMakeClosure(0,
                                         clCompilerMacroFunction,
                                         clNULL_HOOK));
  (void) clCOMPILER_MACRO_FUNCTION;
  clUnwind(4); }
