I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jc;4755;
var _1=objj_msgSend(CPDictionary,"dictionary");
var _2=objj_allocateClassPair(CPObject,"CPValueTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_4,_5,_6){
with(_4){
if(objj_msgSend(objj_msgSend(_4,"class"),"allowsReverseTransformation")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,(_4+" is not reversible."));
}
return objj_msgSend(_4,"transformedValue:",_6);
}
}),new objj_method(sel_getUid("transformedValue:"),function(_7,_8,_9){
with(_7){
return nil;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("setValueTransformer:forName:"),function(_a,_b,_c,_d){
with(_a){
objj_msgSend(_1,"setObject:forKey:",_c,_d);
}
}),new objj_method(sel_getUid("valueTransformerForName:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_1,"objectForKey:",_10);
}
}),new objj_method(sel_getUid("valueTransformerNames"),function(_11,_12){
with(_11){
return objj_msgSend(_1,"allKeys");
}
}),new objj_method(sel_getUid("allowsReverseTransformation"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_15,_16){
with(_15){
return objj_msgSend(CPObject,"class");
}
})]);
var _2=objj_allocateClassPair(Nil,"CPNegateBooleanTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_17,_18,_19){
with(_17){
return !objj_msgSend(_19,"boolValue");
}
}),new objj_method(sel_getUid("transformedValue:"),function(_1a,_1b,_1c){
with(_1a){
return !objj_msgSend(_1c,"boolValue");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_1d,_1e){
with(_1d){
return YES;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_1f,_20){
with(_1f){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(Nil,"CPIsNilTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_21,_22,_23){
with(_21){
return _23===nil||_23===undefined;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_24,_25){
with(_24){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_26,_27){
with(_26){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(Nil,"CPIsNotNilTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_28,_29,_2a){
with(_28){
return _2a!==nil&&_2a!==undefined;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_2b,_2c){
with(_2b){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_2d,_2e){
with(_2d){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(Nil,"CPUnarchiveFromDataTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_31);
}
}),new objj_method(sel_getUid("transformedValue:"),function(_32,_33,_34){
with(_32){
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_34);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_35,_36){
with(_35){
return YES;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_37,_38){
with(_37){
return objj_msgSend(CPData,"class");
}
})]);
CPNegateBooleanTransformerName="CPNegateBooleanTransformerName";
CPIsNilTransformerName="CPIsNilTransformerName";
CPIsNotNilTransformerName="CPIsNotNilTransformerName";
CPUnarchiveFromDataTransformerName="CPUnarchiveFromDataTransformerName";
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(CPNegateBooleanTransformer,"new"),CPNegateBooleanTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(CPIsNilTransformer,"new"),CPIsNilTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(CPIsNotNilTransformer,"new"),CPIsNotNilTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(CPUnarchiveFromDataTransformer,"new"),CPUnarchiveFromDataTransformerName);
