#define cl_ECLIPSE_STATIC_DEFINITIONS	1
#include "eclipse.h"
#include "statics.h"

clStaticStandardInstance(clT,1);
clStaticStandardInstance(clUNKNOWN_OBJECT,2);
clStaticStandardInstance(clSYMBOL,3);
clStaticStandardInstance(clCHARACTER,4);
clStaticStandardInstance(clNUMBER,5);
clStaticStandardInstance(clCOMPLEX,6);
clStaticStandardInstance(clREAL,7);
clStaticStandardInstance(clFLOAT,8);
clStaticStandardInstance(clSINGLE_FLOAT,9);
clStaticStandardInstance(clDOUBLE_FLOAT,10);
clStaticStandardInstance(clRATIONAL,11);
clStaticStandardInstance(clRATIO,12);
clStaticStandardInstance(clINTEGER,13);
clStaticStandardInstance(clSEQUENCE,14);
clStaticStandardInstance(clLIST,15);
clStaticStandardInstance(clNULL,16);
clStaticStandardInstance(clCONS,17);
clStaticStandardInstance(clARRAY,18);
clStaticStandardInstance(clVECTOR,19);
clStaticStandardInstance(clBIT_VECTOR,20);
clStaticStandardInstance(clSTRING,21);
clStaticStandardInstance(clBASE_STRING,22);
clStaticStandardInstance(clEXTENDED_STRING,23);
clStaticStandardInstance(clGENERAL_VECTOR,24);
clStaticStandardInstance(clSIMPLE_ARRAY,25);
clStaticStandardInstance(clCOMPLEX_ARRAY,26);
clStaticStandardInstance(clSIMPLE_BASIC_VECTOR,27);
clStaticStandardInstance(clSIMPLE_BIT_VECTOR,28);
clStaticStandardInstance(clSIMPLE_STRING,29);
clStaticStandardInstance(clSIMPLE_BASE_STRING,30);
clStaticStandardInstance(clSIMPLE_EXTENDED_STRING,31);
clStaticStandardInstance(clSIMPLE_VECTOR,32);
clStaticStandardInstance(clCOMPLEX_BASIC_VECTOR,33);
clStaticStandardInstance(clCOMPLEX_BIT_VECTOR,34);
clStaticStandardInstance(clCOMPLEX_STRING,35);
clStaticStandardInstance(clCOMPLEX_BASE_STRING,36);
clStaticStandardInstance(clCOMPLEX_EXTENDED_STRING,37);
clStaticStandardInstance(clCOMPLEX_VECTOR,38);
clStaticStandardInstance(clSTANDARD_OBJECT,39);
clStaticStandardInstance(clFUNCTION,40);
clStaticStandardInstance(clMACRO_FUNCTION,41);
clStaticStandardInstance(clCOMPILED_FUNCTION,42);
clStaticStandardInstance(clBUILT_IN_FUNCTION,43);
clStaticStandardInstance(clPACKAGED_FUNCTION,44);
clStaticStandardInstance(clINTERPRETED_FUNCTION,45);
clStaticStandardInstance(clBYTE_COMPILED_FUNCTION,46);
clStaticStandardInstance(clFUNCALLABLE_STANDARD_OBJECT,47);
clStaticStandardInstance(clHASH_TABLE,48);
clStaticStandardInstance(clOPEN_ADDRESS_HASH_TABLE,49);
clStaticStandardInstance(clOPEN_ADDRESS_EQ_HASH_TABLE,50);
clStaticStandardInstance(clOPEN_ADDRESS_EQL_HASH_TABLE,51);
clStaticStandardInstance(clOPEN_ADDRESS_EQUAL_HASH_TABLE,52);
clStaticStandardInstance(clOPEN_ADDRESS_EQUALP_HASH_TABLE,53);
clStaticStandardInstance(clMETAOBJECT,54);
clStaticStandardInstance(clSLOT_DEFINITION,55);
clStaticStandardInstance(clDIRECT_SLOT_DEFINITION,56);
clStaticStandardInstance(clEFFECTIVE_SLOT_DEFINITION,57);
clStaticStandardInstance(clSTANDARD_SLOT_DEFINITION,58);
clStaticStandardInstance(clSTANDARD_DIRECT_SLOT_DEFINITION,59);
clStaticStandardInstance(clSTANDARD_EFFECTIVE_SLOT_DEFINITION,60);
clStaticStandardInstance(clTYPE,61);
clStaticStandardInstance(clSPECIALIZER,62);
clStaticStandardInstance(clCLASS,63);
clStaticStandardInstance(clBUILT_IN_CLASS,64);
clStaticStandardInstance(clFORWARD_REFERENCED_CLASS,65);
clStaticStandardInstance(clSTANDARD_CLASS,66);
clStaticStandardInstance(clFUNCALLABLE_STANDARD_CLASS,67);
clStaticStandardInstance(clINTERNED_STANDARD_CLASS,68);
clStaticStandardInstance(clSTANDARD_SYSTEM_CLASS,69);
clStaticStandardInstance(clFUNCALLABLE_STANDARD_SYSTEM_CLASS,70);
clStaticStandardInstance(clMETHOD,71);
clStaticStandardInstance(clSTANDARD_METHOD,72);
clStaticStandardInstance(clSTANDARD_ACCESSOR_METHOD,73);
clStaticStandardInstance(clSTANDARD_READER_METHOD,74);
clStaticStandardInstance(clSTANDARD_WRITER_METHOD,75);
clStaticStandardInstance(clMETHOD_COMBINATION_TYPE,76);
clStaticStandardInstance(clMETHOD_COMBINATION,77);
clStaticStandardInstance(clGENERIC_FUNCTION,78);
clStaticStandardInstance(clSTANDARD_GENERIC_FUNCTION,79);
clStaticStandardInstance(clSTANDARD_SYSTEM_GENERIC_FUNCTION,80);

void clInitStaticClass __P((void))
{
  clClassInit(clT);
  clClassInit(clUNKNOWN_OBJECT);
  clClassInit(clSYMBOL);
  clClassInit(clCHARACTER);
  clClassInit(clNUMBER);
  clClassInit(clCOMPLEX);
  clClassInit(clREAL);
  clClassInit(clFLOAT);
  clClassInit(clSINGLE_FLOAT);
  clClassInit(clDOUBLE_FLOAT);
  clClassInit(clRATIONAL);
  clClassInit(clRATIO);
  clClassInit(clINTEGER);
  clClassInit(clSEQUENCE);
  clClassInit(clLIST);
  clClassInit(clNULL);
  clClassInit(clCONS);
  clClassInit(clARRAY);
  clClassInit(clVECTOR);
  clClassInit(clBIT_VECTOR);
  clClassInit(clSTRING);
  clClassInit(clBASE_STRING);
  clClassInit(clEXTENDED_STRING);
  clClassInit(clGENERAL_VECTOR);
  clClassInit(clSIMPLE_ARRAY);
  clClassInit(clCOMPLEX_ARRAY);
  clClassInit(clSIMPLE_BASIC_VECTOR);
  clClassInit(clSIMPLE_BIT_VECTOR);
  clClassInit(clSIMPLE_STRING);
  clClassInit(clSIMPLE_BASE_STRING);
  clClassInit(clSIMPLE_EXTENDED_STRING);
  clClassInit(clSIMPLE_VECTOR);
  clClassInit(clCOMPLEX_BASIC_VECTOR);
  clClassInit(clCOMPLEX_BIT_VECTOR);
  clClassInit(clCOMPLEX_STRING);
  clClassInit(clCOMPLEX_BASE_STRING);
  clClassInit(clCOMPLEX_EXTENDED_STRING);
  clClassInit(clCOMPLEX_VECTOR);
  clClassInit(clSTANDARD_OBJECT);
  clClassInit(clFUNCTION);
  clClassInit(clMACRO_FUNCTION);
  clClassInit(clCOMPILED_FUNCTION);
  clClassInit(clBUILT_IN_FUNCTION);
  clClassInit(clPACKAGED_FUNCTION);
  clClassInit(clINTERPRETED_FUNCTION);
  clClassInit(clBYTE_COMPILED_FUNCTION);
  clClassInit(clFUNCALLABLE_STANDARD_OBJECT);
  clClassInit(clHASH_TABLE);
  clClassInit(clOPEN_ADDRESS_HASH_TABLE);
  clClassInit(clOPEN_ADDRESS_EQ_HASH_TABLE);
  clClassInit(clOPEN_ADDRESS_EQL_HASH_TABLE);
  clClassInit(clOPEN_ADDRESS_EQUAL_HASH_TABLE);
  clClassInit(clOPEN_ADDRESS_EQUALP_HASH_TABLE);
  clClassInit(clMETAOBJECT);
  clClassInit(clSLOT_DEFINITION);
  clClassInit(clDIRECT_SLOT_DEFINITION);
  clClassInit(clEFFECTIVE_SLOT_DEFINITION);
  clClassInit(clSTANDARD_SLOT_DEFINITION);
  clClassInit(clSTANDARD_DIRECT_SLOT_DEFINITION);
  clClassInit(clSTANDARD_EFFECTIVE_SLOT_DEFINITION);
  clClassInit(clTYPE);
  clClassInit(clSPECIALIZER);
  clClassInit(clCLASS);
  clClassInit(clBUILT_IN_CLASS);
  clClassInit(clFORWARD_REFERENCED_CLASS);
  clClassInit(clSTANDARD_CLASS);
  clClassInit(clFUNCALLABLE_STANDARD_CLASS);
  clClassInit(clINTERNED_STANDARD_CLASS);
  clClassInit(clSTANDARD_SYSTEM_CLASS);
  clClassInit(clFUNCALLABLE_STANDARD_SYSTEM_CLASS);
  clClassInit(clMETHOD);
  clClassInit(clSTANDARD_METHOD);
  clClassInit(clSTANDARD_ACCESSOR_METHOD);
  clClassInit(clSTANDARD_READER_METHOD);
  clClassInit(clSTANDARD_WRITER_METHOD);
  clClassInit(clMETHOD_COMBINATION_TYPE);
  clClassInit(clMETHOD_COMBINATION);
  clClassInit(clGENERIC_FUNCTION);
  clClassInit(clSTANDARD_GENERIC_FUNCTION);
  clClassInit(clSTANDARD_SYSTEM_GENERIC_FUNCTION);

  clFlagInit(clFLAG0, 0);
  clFlagInit(clFLAG1, -1);
}
