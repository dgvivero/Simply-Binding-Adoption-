I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jc;12644;
var _1=objj_msgSend(CPDictionary,"new"),_2=objj_msgSend(CPDictionary,"new");
var _3=0,_4=1;
var _5=objj_allocateClassPair(CPObject,"CPKeyValueBinding"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_info"),new objj_ivar("_source")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"),function(_7,_8,_9,_a,_b,_c,_d,_e){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
_source=_e;
_info=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_b,_c],[CPObservedObjectKey,CPObservedKeyPathKey]);
if(_d){
objj_msgSend(_info,"setObject:forKey:",_d,CPOptionsKey);
}
objj_msgSend(_b,"addObserver:forKeyPath:options:context:",_7,_c,CPKeyValueObservingOptionNew,_9);
var _f=objj_msgSend(_2,"objectForKey:",objj_msgSend(_source,"hash"));
if(!_f){
_f=objj_msgSend(CPDictionary,"new");
objj_msgSend(_2,"setObject:forKey:",_f,objj_msgSend(_source,"hash"));
}
objj_msgSend(_f,"setObject:forKey:",_7,_a);
objj_msgSend(_7,"setValueFor:",_9);
}
return _7;
}
}),new objj_method(sel_getUid("setValueFor:"),function(_10,_11,_12){
with(_10){
var _13=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_14=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey),_15=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_16=objj_msgSend(_13,"valueForKeyPath:",_14);
_16=objj_msgSend(_10,"transformValue:withOptions:",_16,_15);
objj_msgSend(_source,"setValue:forKey:",_16,_12);
}
}),new objj_method(sel_getUid("reverseSetValueFor:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_1b=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey),_1c=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_1d=objj_msgSend(_source,"valueForKeyPath:",_19);
_1d=objj_msgSend(_17,"reverseTransformValue:withOptions:",_1d,_1c);
objj_msgSend(_1a,"setValue:forKeyPath:",_1d,_1b);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_1e,_1f,_20,_21,_22,_23){
with(_1e){
if(!_22){
return;
}
objj_msgSend(_1e,"setValueFor:",_23);
}
}),new objj_method(sel_getUid("transformValue:withOptions:"),function(_24,_25,_26,_27){
with(_24){
var _28,_29,_2a;
switch(_26){
case CPMultipleValuesMarker:
return objj_msgSend(_27,"objectForKey:",CPMultipleValuesPlaceholderBindingOption)||"Multiple Values";
case CPNoSelectionMarker:
return objj_msgSend(_27,"objectForKey:",CPNoSelectionPlaceholderBindingOption)||"No Selection";
case CPNotApplicableMarker:
if(objj_msgSend(_27,"objectForKey:",CPRaisesForNotApplicableKeysBindingOption)){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"can't transform non applicable key on: "+_source+" value: "+_26);
}
return objj_msgSend(_27,"objectForKey:",CPNotApplicablePlaceholderBindingOption)||"Not Applicable";
case nil:
case undefined:
return objj_msgSend(_27,"objectForKey:",CPNullPlaceholderBindingOption)||"";
}
var _28=objj_msgSend(_27,"objectForKey:",CPValueTransformerNameBindingOption),_29;
if(_28){
_29=objj_msgSend(CPValueTransformer,"valueTransformerForName:",_28);
}else{
_29=objj_msgSend(_27,"objectForKey:",CPValueTransformerBindingOption);
}
if(_29){
_26=objj_msgSend(_29,"transformedValue:",_26);
}
return _26;
}
}),new objj_method(sel_getUid("reverseTransformValue:withOptions:"),function(_2b,_2c,_2d,_2e){
with(_2b){
var _2f=objj_msgSend(_2e,"objectForKey:",CPValueTransformerNameBindingOption),_30;
if(_2f){
_30=objj_msgSend(CPValueTransformer,"valueTransformerForName:",_2f);
}else{
_30=objj_msgSend(_2e,"objectForKey:",CPValueTransformerBindingOption);
}
if(_30&&objj_msgSend(objj_msgSend(_30,"class"),"allowsReverseTransformation")){
_2d=objj_msgSend(_30,"transformedValue:",_2d);
}
return _2d;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("exposeBinding:forClass:"),function(_31,_32,_33,_34){
with(_31){
var _35=objj_msgSend(_1,"objectForKey:",objj_msgSend(_34,"hash"));
if(!_35){
_35=[];
objj_msgSend(_1,"setObject:forKey:",_35,objj_msgSend(_34,"hash"));
}
_35.push(_33);
}
}),new objj_method(sel_getUid("exposedBindingsForClass:"),function(_36,_37,_38){
with(_36){
return objj_msgSend(objj_msgSend(_1,"objectForKey:",objj_msgSend(_38,"hash")),"copy");
}
}),new objj_method(sel_getUid("getBinding:forObject:"),function(_39,_3a,_3b,_3c){
with(_39){
return objj_msgSend(objj_msgSend(_2,"objectForKey:",objj_msgSend(_3c,"hash")),"objectForKey:",_3b);
}
}),new objj_method(sel_getUid("infoForBinding:forObject:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=objj_msgSend(_3d,"getBinding:forObject:",_3f,_40);
if(_41){
return _41._info;
}
return nil;
}
}),new objj_method(sel_getUid("unbind:forObject:"),function(_42,_43,_44,_45){
with(_42){
var _46=objj_msgSend(_2,"objectForKey:",objj_msgSend(_45,"hash"));
if(!_46){
return;
}
var _47=objj_msgSend(_46,"objectForKey:",_44);
if(!_47){
return;
}
var _48=_47._info,_49=objj_msgSend(_48,"objectForKey:",CPObservedObjectKey),_4a=objj_msgSend(_48,"objectForKey:",CPObservedKeyPathKey);
objj_msgSend(_49,"removeObserver:forKeyPath:",_47,_4a);
objj_msgSend(_46,"removeObjectForKey:",_44);
}
}),new objj_method(sel_getUid("unbindAllForObject:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=objj_msgSend(_2,"objectForKey:",objj_msgSend(_4d,"hash"));
if(!_4e){
return;
}
var _4f=objj_msgSend(_4e,"allKeys"),_50=_4f.length;
while(_50--){
objj_msgSend(_4d,"unbind:",objj_msgSend(_4e,"objectForKey:",_4f[_50]));
}
objj_msgSend(_2,"removeObjectForKey:",objj_msgSend(_4d,"hash"));
}
})]);
var _5=objj_getClass("CPObject");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("exposedBindings"),function(_51,_52){
with(_51){
var _53=[],_54=objj_msgSend(_51,"class");
while(_54&&_54!==objj_msgSend(CPObject,"class")){
var _55=objj_msgSend(CPKeyValueBinding,"exposedBindingsForClass:",_54);
if(_55){
objj_msgSend(_53,"addObjectsFromArray:",_55);
}
_54=objj_msgSend(_54,"superclass");
}
return _53;
}
}),new objj_method(sel_getUid("valueClassForBinding:"),function(_56,_57,_58){
with(_56){
return objj_msgSend(CPString,"class");
}
}),new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"),function(_59,_5a,_5b,_5c,_5d,_5e){
with(_59){
if(!_5c||!_5d){
return CPLog.error("Invalid object or path on "+_59+" for "+_5b);
}
if(!objj_msgSend(objj_msgSend(_59,"exposedBindings"),"containsObject:",_5b)){
CPLog.warn("No binding exposed on "+_59+" for "+_5b);
}
objj_msgSend(_59,"unbind:",_5b);
objj_msgSend(objj_msgSend(CPKeyValueBinding,"alloc"),"initWithBinding:name:to:keyPath:options:from:",objj_msgSend(_5c,"_replacementKeyPathForBinding:",_5b),_5b,_5c,_5d,_5e,_59);
}
}),new objj_method(sel_getUid("infoForBinding:"),function(_5f,_60,_61){
with(_5f){
return objj_msgSend(CPKeyValueBinding,"infoForBinding:forObject:",_61,_5f);
}
}),new objj_method(sel_getUid("unbind:"),function(_62,_63,_64){
with(_62){
objj_msgSend(CPKeyValueBinding,"unbind:forObject:",_64,_62);
}
}),new objj_method(sel_getUid("_replacementKeyPathForBinding:"),function(_65,_66,_67){
with(_65){
if(objj_msgSend(_67,"isEqual:","value")){
return "objectValue";
}
return _67;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("exposeBinding:"),function(_68,_69,_6a){
with(_68){
objj_msgSend(CPKeyValueBinding,"exposeBinding:forClass:",_6a,objj_msgSend(_68,"class"));
}
})]);
var _5=objj_allocateClassPair(CPKeyValueBinding,"_CPKeyValueOrBinding"),_6=_5.isa;
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("setValueFor:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=objj_msgSend(_2,"valueForKey:",objj_msgSend(_source,"hash"));
if(!_6e){
return;
}
objj_msgSend(_source,"setValue:forKey:",_6f(_6d,_6e,_4),_6d);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_70,_71,_72,_73,_74,_75){
with(_70){
objj_msgSend(_70,"setValueFor:",_75);
}
})]);
var _5=objj_allocateClassPair(CPKeyValueBinding,"_CPKeyValueAndBinding"),_6=_5.isa;
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("setValueFor:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_2,"objectForKey:",objj_msgSend(_source,"hash"));
if(!_79){
return;
}
objj_msgSend(_source,"setValue:forKey:",_6f(_78,_79,_3),_78);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_7a,_7b,_7c,_7d,_7e,_7f){
with(_7a){
objj_msgSend(_7a,"setValueFor:",_7f);
}
})]);
var _6f=_6f=function(key,_81,_82){
var _83=key,_84,_85=1;
while(_84=objj_msgSend(_81,"objectForKey:",_83)){
var _86=_84._info,_87=objj_msgSend(_86,"objectForKey:",CPObservedObjectKey),_88=objj_msgSend(_86,"objectForKey:",CPObservedKeyPathKey),_89=objj_msgSend(_86,"objectForKey:",CPOptionsKey);
var _8a=objj_msgSend(_84,"transformValue:withOptions:",objj_msgSend(_87,"valueForKeyPath:",_88),_89);
if(_8a==_82){
return _82;
}
_83=objj_msgSend(CPString,"stringWithFormat:","%@%i",key,++_85);
}
return !_82;
};
var _8b=_8b=function(_8c,_8d,_8e){
var _8f=objj_msgSend(_8e,"objectForKey:",_8c),_90=_8f._info,_91=objj_msgSend(_90,"objectForKey:",CPObservedObjectKey),_92=objj_msgSend(_90,"objectForKey:",CPObservedKeyPathKey),_93=objj_msgSend(_90,"objectForKey:",CPOptionsKey),_94=objj_msgSend(_91,"valueForKeyPath:",_92),_95=objj_msgSend(_93,"objectForKey:",CPSelectorNameBindingOption);
if(!_94||!_95){
return;
}
var _96=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",objj_msgSend(_94,"methodSignatureForSelector:",_95));
objj_msgSend(_96,"setSelector:",_95);
var _97=_8d;
count=1;
while(_8f=objj_msgSend(_8e,"objectForKey:",_97)){
_90=_8f._info;
_92=objj_msgSend(_90,"objectForKey:",CPObserverKeyPathKey);
_91=objj_msgSend(objj_msgSend(_90,"objectForKey:",CPObservedObjectKey),"valueForKeyPath:",_92);
if(_91){
objj_msgSend(_96,"setArgument:atIndex:",_91,++count);
}
_97=objj_msgSend(CPString,"stringWithFormat:","%@%i",_8d,count);
}
objj_msgSend(_96,"invoke");
};
CPObservedObjectKey="CPObservedObjectKey";
CPObservedKeyPathKey="CPObservedKeyPathKey";
CPOptionsKey="CPOptionsKey";
CPMultipleValuesMarker="CPMultipleValuesMarker";
CPNoSelectionMarker="CPNoSelectionMarker";
CPNotApplicableMarker="CPNotApplicableMarker";
CPAlignmentBinding="CPAlignmentBinding";
CPEditableBinding="CPEditableBinding";
CPEnabledBinding="CPEnabledBinding";
CPFontBinding="CPFontBinding";
CPHiddenBinding="CPHiddenBinding";
CPSelectedIndexBinding="CPSelectedIndexBinding";
CPTextColorBinding="CPTextColorBinding";
CPToolTipBinding="CPToolTipBinding";
CPValueBinding="value";
CPAllowsEditingMultipleValuesSelectionBindingOption="CPAllowsEditingMultipleValuesSelectionBindingOption";
CPAllowsNullArgumentBindingOption="CPAllowsNullArgumentBindingOption";
CPConditionallySetsEditableBindingOption="CPConditionallySetsEditableBindingOption";
CPConditionallySetsEnabledBindingOption="CPConditionallySetsEnabledBindingOption";
CPConditionallySetsHiddenBindingOption="CPConditionallySetsHiddenBindingOption";
CPContinuouslyUpdatesValueBindingOption="CPContinuouslyUpdatesValueBindingOption";
CPCreatesSortDescriptorBindingOption="CPCreatesSortDescriptorBindingOption";
CPDeletesObjectsOnRemoveBindingsOption="CPDeletesObjectsOnRemoveBindingsOption";
CPDisplayNameBindingOption="CPDisplayNameBindingOption";
CPDisplayPatternBindingOption="CPDisplayPatternBindingOption";
CPHandlesContentAsCompoundValueBindingOption="CPHandlesContentAsCompoundValueBindingOption";
CPInsertsNullPlaceholderBindingOption="CPInsertsNullPlaceholderBindingOption";
CPInvokesSeparatelyWithArrayObjectsBindingOption="CPInvokesSeparatelyWithArrayObjectsBindingOption";
CPMultipleValuesPlaceholderBindingOption="CPMultipleValuesPlaceholderBindingOption";
CPNoSelectionPlaceholderBindingOption="CPNoSelectionPlaceholderBindingOption";
CPNotApplicablePlaceholderBindingOption="CPNotApplicablePlaceholderBindingOption";
CPNullPlaceholderBindingOption="CPNullPlaceholderBindingOption";
CPPredicateFormatBindingOption="CPPredicateFormatBindingOption";
CPRaisesForNotApplicableKeysBindingOption="CPRaisesForNotApplicableKeysBindingOption";
CPSelectorNameBindingOption="CPSelectorNameBindingOption";
CPSelectsAllWhenSettingContentBindingOption="CPSelectsAllWhenSettingContentBindingOption";
CPValidatesImmediatelyBindingOption="CPValidatesImmediatelyBindingOption";
CPValueTransformerNameBindingOption="CPValueTransformerNameBindingOption";
CPValueTransformerBindingOption="CPValueTransformerBindingOption";
