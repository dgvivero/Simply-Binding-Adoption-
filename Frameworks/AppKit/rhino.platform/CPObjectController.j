I;25;Foundation/CPDictionary.ji;14;CPController.jc;17455;
var _1=objj_allocateClassPair(CPController,"CPObjectController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentObject"),new objj_ivar("_selection"),new objj_ivar("_objectClass"),new objj_ivar("_isEditable"),new objj_ivar("_automaticallyPreparesContent"),new objj_ivar("_observedKeys")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithContent:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPController")},"init");
if(_3){
objj_msgSend(_3,"setContent:",_5);
objj_msgSend(_3,"setEditable:",YES);
objj_msgSend(_3,"setObjectClass:",objj_msgSend(CPMutableDictionary,"class"));
}
return _3;
}
}),new objj_method(sel_getUid("content"),function(_6,_7){
with(_6){
return _contentObject;
}
}),new objj_method(sel_getUid("setContent:"),function(_8,_9,_a){
with(_8){
objj_msgSend(_8,"willChangeValueForKey:","contentObject");
objj_msgSend(_8,"_selectionWillChange");
_contentObject=_a;
objj_msgSend(_8,"didChangeValueForKey:","contentObject");
objj_msgSend(_8,"_selectionDidChange");
}
}),new objj_method(sel_getUid("_setContentObject:"),function(_b,_c,_d){
with(_b){
objj_msgSend(_b,"setContent:",_d);
}
}),new objj_method(sel_getUid("_contentObject"),function(_e,_f){
with(_e){
return objj_msgSend(_e,"content");
}
}),new objj_method(sel_getUid("setAutomaticallyPreparesContent:"),function(_10,_11,_12){
with(_10){
_automaticallyPreparesContent=_12;
}
}),new objj_method(sel_getUid("automaticallyPreparesContent"),function(_13,_14){
with(_13){
return _automaticallyPreparesContent;
}
}),new objj_method(sel_getUid("prepareContent"),function(_15,_16){
with(_15){
objj_msgSend(_15,"setContent:",objj_msgSend(_15,"newObject"));
}
}),new objj_method(sel_getUid("setObjectClass:"),function(_17,_18,_19){
with(_17){
_objectClass=_19;
}
}),new objj_method(sel_getUid("objectClass"),function(_1a,_1b){
with(_1a){
return _objectClass;
}
}),new objj_method(sel_getUid("newObject"),function(_1c,_1d){
with(_1c){
return objj_msgSend(objj_msgSend(objj_msgSend(_1c,"objectClass"),"alloc"),"init");
}
}),new objj_method(sel_getUid("addObject:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"setContent:",_20);
objj_msgSend(objj_msgSend(CPKeyValueBinding,"getBinding:forObject:","contentObject",_1e),"reverseSetValueFor:","contentObject");
}
}),new objj_method(sel_getUid("removeObject:"),function(_21,_22,_23){
with(_21){
if(objj_msgSend(_21,"content")===_23){
objj_msgSend(_21,"setContent:",nil);
}
objj_msgSend(objj_msgSend(CPKeyValueBinding,"getBinding:forObject:","contentObject",_21),"reverseSetValueFor:","contentObject");
}
}),new objj_method(sel_getUid("add:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"addObject:",objj_msgSend(_24,"newObject"));
}
}),new objj_method(sel_getUid("canAdd"),function(_27,_28){
with(_27){
return objj_msgSend(_27,"isEditable");
}
}),new objj_method(sel_getUid("remove:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_29,"removeObject:",objj_msgSend(_29,"content"));
}
}),new objj_method(sel_getUid("canRemove"),function(_2c,_2d){
with(_2c){
return objj_msgSend(_2c,"isEditable")&&objj_msgSend(objj_msgSend(_2c,"selectedObjects"),"count");
}
}),new objj_method(sel_getUid("setEditable:"),function(_2e,_2f,_30){
with(_2e){
_isEditable=_30;
}
}),new objj_method(sel_getUid("isEditable"),function(_31,_32){
with(_31){
return _isEditable;
}
}),new objj_method(sel_getUid("selectedObjects"),function(_33,_34){
with(_33){
return objj_msgSend(objj_msgSend(_CPObservableArray,"alloc"),"initWithObjects:count:",[_contentObject],1);
}
}),new objj_method(sel_getUid("selection"),function(_35,_36){
with(_35){
return _selection;
}
}),new objj_method(sel_getUid("_selectionWillChange"),function(_37,_38){
with(_37){
objj_msgSend(_selection,"controllerWillChange");
objj_msgSend(_37,"willChangeValueForKey:","selection");
}
}),new objj_method(sel_getUid("_selectionDidChange"),function(_39,_3a){
with(_39){
if(_selection===undefined||_selection===nil){
_selection=objj_msgSend(objj_msgSend(CPControllerSelectionProxy,"alloc"),"initWithController:",_39);
}
objj_msgSend(_selection,"controllerDidChange");
objj_msgSend(_39,"didChangeValueForKey:","selection");
}
}),new objj_method(sel_getUid("observedKeys"),function(_3b,_3c){
with(_3b){
return _observedKeys;
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_3d,_3e,_3f,_40,_41,_42){
with(_3d){
objj_msgSend(_observedKeys,"addObject:",_40);
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPController")},"addObserver:forKeyPath:options:context:",_3f,_40,_41,_42);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_43,_44,_45,_46){
with(_43){
objj_msgSend(_observedKeys,"removeObject:",_46);
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPController")},"removeObserver:forKeyPath:",_45,_46);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_47,_48){
with(_47){
objj_msgSend(_47,"exposeBinding:","editable");
objj_msgSend(_47,"exposeBinding:","contentObject");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForContentObject"),function(_49,_4a){
with(_49){
return objj_msgSend(CPSet,"setWithObjects:","content");
}
}),new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_4b,_4c,_4d){
with(_4b){
if(_4d==="contentObject"){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanAdd"),function(_4e,_4f){
with(_4e){
return objj_msgSend(CPSet,"setWithObject:","editable");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanInsert"),function(_50,_51){
with(_50){
return objj_msgSend(CPSet,"setWithObject:","editable");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanRemove"),function(_52,_53){
with(_52){
return objj_msgSend(CPSet,"setWithObjects:","editable","selection");
}
})]);
var _54="CPObjectControllerObjectClassNameKey",_55="CPObjectControllerIsEditableKey",_56="CPObjectControllerAutomaticallyPreparesContentKey";
var _1=objj_getClass("CPObjectController");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObjectController\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_57,_58,_59){
with(_57){
_57=objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPController")},"init");
if(_57){
var _5a=objj_msgSend(_59,"decodeObjectForKey:",_54),_5b=CPClassFromString(_5a);
objj_msgSend(_57,"setObjectClass:",_5b);
objj_msgSend(_57,"setEditable:",objj_msgSend(_59,"decodeBoolForKey:",_55));
objj_msgSend(_57,"setAutomaticallyPreparesContent:",objj_msgSend(_59,"decodeBoolForKey:",_56)||NO);
_observedKeys=objj_msgSend(objj_msgSend(CPCountedSet,"alloc"),"init");
}
return _57;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5e,"encodeObject:forKey:",CPStringFromClass(objectClass),_54);
objj_msgSend(_5e,"encodeObject:forKey:",objj_msgSend(_5c,"isEditable"),_55);
if(!objj_msgSend(_5c,"automaticallyPreparesContent")){
objj_msgSend(_5e,"encodeBOOL:forKey:",YES,_56);
}
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPObservationProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyPath"),new objj_ivar("_observer"),new objj_ivar("_object"),new objj_ivar("_notifyObject"),new objj_ivar("_context"),new objj_ivar("_options")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:observer:object:"),function(_5f,_60,_61,_62,_63){
with(_5f){
if(_5f=objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("CPObject")},"init")){
_keyPath=_61;
_observer=_62;
_object=_63;
}
return _5f;
}
}),new objj_method(sel_getUid("observer"),function(_64,_65){
with(_64){
return _observer;
}
}),new objj_method(sel_getUid("keyPath"),function(_66,_67){
with(_66){
return _keyPath;
}
}),new objj_method(sel_getUid("context"),function(_68,_69){
with(_68){
return _context;
}
}),new objj_method(sel_getUid("options"),function(_6a,_6b){
with(_6a){
return _options;
}
}),new objj_method(sel_getUid("setNotifyObject:"),function(_6c,_6d,_6e){
with(_6c){
_notifyObject=_6e;
}
}),new objj_method(sel_getUid("isEqual:"),function(_6f,_70,_71){
with(_6f){
if(objj_msgSend(_71,"class")===objj_msgSend(_6f,"class")){
if(_71._observer===_observer&&objj_msgSend(_71._keyPath,"isEqual:",_keyPath)&&objj_msgSend(_71._object,"isEqual:",_object)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_72,_73,_74,_75,_76,_77){
with(_72){
if(_notifyObject){
objj_msgSend(_object,"observeValueForKeyPath:ofObject:change:context:",_keyPath,_object,_76,_77);
}
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_keyPath,_object,_76,_77);
}
}),new objj_method(sel_getUid("description"),function(_78,_79){
with(_78){
return objj_msgSendSuper({receiver:_78,super_class:objj_getClass("CPObject")},"description")+objj_msgSend(CPString,"stringWithFormat:","observation proxy for %@ on key path %@",_observer,_keyPath);
}
})]);
var _1=objj_allocateClassPair(CPMutableArray,"_CPObservableArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_observationProxies")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("description"),function(_7a,_7b){
with(_7a){
return "<_CPObservableArray: "+objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPMutableArray")},"description")+" >";
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_7c,_7d,_7e,_7f){
with(_7c){
if(_7c=objj_msgSendSuper({receiver:_7c,super_class:objj_getClass("CPMutableArray")},"initWithObjects:count:",_7e,_7f)){
_observationProxies=[];
}
return _7c;
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_80,_81,_82,_83,_84,_85){
with(_80){
if(_83.indexOf("@")===0){
var _86=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_83,_82,_80);
_86._options=_84;
_86._context=_85;
objj_msgSend(_observationProxies,"addObject:",_86);
var _87=_83.indexOf("."),_88=_83.substring(_87+1),_89=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_80,"count")));
objj_msgSend(_80,"addObserver:toObjectsAtIndexes:forKeyPath:options:context:",_86,_89,_88,_84,_85);
}else{
var _89=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_80,"count")));
objj_msgSend(_80,"addObserver:toObjectsAtIndexes:forKeyPath:options:context:",_82,_89,_83,_84,_85);
}
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_8a,_8b,_8c,_8d){
with(_8a){
if(_8d.indexOf("@")===0){
var _8e=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_8d,_8c,_8a),_8f=objj_msgSend(_observationProxies,"indexOfObject:",_8e);
_8e=objj_msgSend(_observationProxies,"objectAtIndex:",_8f);
var _90=_8d.indexOf("."),_91=_8d.substring(_90+1),_92=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_8a,"count")));
objj_msgSend(_8a,"removeObserver:fromObjectsAtIndexes:forKeyPath:",_8e,_92,_91);
}else{
var _92=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_8a,"count")));
objj_msgSend(_8a,"removeObserver:fromObjectsAtIndexes:forKeyPath:",observer,_92,_8d);
}
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_93,_94,_95,_96){
with(_93){
for(var i=0,_98=objj_msgSend(_observationProxies,"count");i<_98;i++){
var _99=objj_msgSend(_observationProxies,"objectAtIndex:",i),_9a=objj_msgSend(_99,"keyPath"),_9b=_9a.indexOf(".")===0;
if(_9b){
objj_msgSend(_93,"willChangeValueForKey:",_9a);
}
objj_msgSend(_95,"addObserver:forKeyPath:options:context:",_99,_9a,objj_msgSend(_99,"options"),objj_msgSend(_99,"context"));
if(_9b){
objj_msgSend(_93,"didChangeValueForKey:",_9a);
}
}
objj_msgSend(_93,"insertObject:atIndex:",_95,_96);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_9c,_9d,_9e){
with(_9c){
for(var i=0,_a0=objj_msgSend(_observationProxies,"count");i<_a0;i++){
var _a1=objj_msgSend(_observationProxies,"objectAtIndex:",i),_a2=objj_msgSend(_a1,"keyPath"),_a3=_a2.indexOf(".")===0;
if(_a3){
objj_msgSend(_9c,"willChangeValueForKey:",_a2);
}
objj_msgSend(anObject,"removeObserver:forKeyPath:",_a1,_a2);
if(_a3){
objj_msgSend(_9c,"didChangeValueForKey:",_a2);
}
}
objj_msgSend(_9c,"removeObjectAtIndex:",_9e);
}
}),new objj_method(sel_getUid("addObject:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSend(_a4,"insertObject:atIndex:",_a6,objj_msgSend(_a4,"count"));
}
}),new objj_method(sel_getUid("removeLastObject"),function(_a7,_a8){
with(_a7){
objj_msgSend(_a7,"removeObjectAtIndex:",objj_msgSend(_a7,"count"));
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_a9,_aa,_ab,_ac){
with(_a9){
var _ad=objj_msgSend(_a9,"objectAtIndex:",_ab);
for(var i=0,_af=objj_msgSend(_observationProxies,"count");i<_af;i++){
var _b0=objj_msgSend(_observationProxies,"objectAtIndex:",i),_b1=objj_msgSend(_b0,"keyPath"),_b2=_b1.indexOf(".")===0;
if(_b2){
objj_msgSend(_a9,"willChangeValueForKey:",_b1);
}
objj_msgSend(_ad,"removeObserver:forKeyPath:",_b0,_b1);
objj_msgSend(_ac,"addObserver:forKeyPath:options:context:",_b0,_b1,objj_msgSend(_b0,"options"),objj_msgSend(_b0,"context"));
if(_b2){
objj_msgSend(_a9,"didChangeValueForKey:",_b1);
}
}
objj_msgSend(_a9,"replaceObjectAtIndex:withObject:",_ab,_ac);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_b3,_b4){
with(_b3){
var a=[];
a.isa=_b3;
var _b6=class_copyIvarList(_b3),_b7=_b6.length;
while(_b7--){
a[ivar_getName(_b6[_b7])]=nil;
}
return a;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPControllerSelectionProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_controller"),new objj_ivar("_keys"),new objj_ivar("_cachedValues"),new objj_ivar("_observationProxies")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithController:"),function(_b8,_b9,_ba){
with(_b8){
if(_b8=objj_msgSendSuper({receiver:_b8,super_class:objj_getClass("CPObject")},"init")){
_cachedValues=objj_msgSend(CPDictionary,"dictionary");
_observationProxies=objj_msgSend(CPArray,"array");
_controller=_ba;
}
return _b8;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_bb,_bc,_bd){
with(_bb){
var _be=objj_msgSend(_cachedValues,"objectForKey:",_bd);
if(_be!==undefined&&_be!==nil){
return _be;
}
var _bf=objj_msgSend(objj_msgSend(_controller,"selectedObjects"),"valueForKeyPath:",_bd),_c0=objj_msgSend(_bf,"count");
if(!_c0){
_be=CPNoSelectionMarker;
}else{
if(_c0===1){
_be=objj_msgSend(_bf,"objectAtIndex:",0);
}else{
if(objj_msgSend(_controller,"alwaysUsesMultipleValuesMarker")){
_be=CPMultipleValuesMarker;
}else{
_be=objj_msgSend(_bf,"objectAtIndex:",0);
for(var i=0,_c0=objj_msgSend(_bf,"count");i<_c0&&_be!=CPMultipleValuesMarker;i++){
if(!objj_msgSend(values,"isEqual:",objj_msgSend(_bf,"objectAtIndex:",i))){
_be=CPMultipleValuesMarker;
}
}
}
}
}
objj_msgSend(_cachedValues,"setValue:forKey:",_be,_bd);
return _be;
}
}),new objj_method(sel_getUid("count"),function(_c2,_c3){
with(_c2){
return objj_msgSend(_cachedValues,"count");
}
}),new objj_method(sel_getUid("keyEnumerator"),function(_c4,_c5){
with(_c4){
return objj_msgSend(_cachedValues,"keyEnumerator");
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_c6,_c7,_c8,_c9){
with(_c6){
objj_msgSend(objj_msgSend(_controller,"selectedObjects"),"setValue:forKey:",_c8,_c9);
}
}),new objj_method(sel_getUid("controllerWillChange"),function(_ca,_cb){
with(_ca){
_keys=objj_msgSend(_cachedValues,"allKeys");
if(!_keys){
return;
}
for(var i=0,_cd=_keys.length;i<_cd;i++){
objj_msgSend(_ca,"willChangeValueForKey:",_keys[i]);
}
objj_msgSend(_cachedValues,"removeAllObjects");
}
}),new objj_method(sel_getUid("controllerDidChange"),function(_ce,_cf){
with(_ce){
objj_msgSend(_cachedValues,"removeAllObjects");
if(!_keys){
return;
}
for(var i=0,_d1=_keys.length;i<_d1;i++){
objj_msgSend(_ce,"didChangeValueForKey:",_keys[i]);
}
_keys=nil;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_d2,_d3,_d4,_d5,_d6,_d7){
with(_d2){
objj_msgSend(_cachedValues,"removeObjectForKey:",_d4);
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_d8,_d9,_da,_db,_dc,_dd){
with(_d8){
var _de=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_db,_da,_d8);
objj_msgSend(_de,"setNotifyObject:",YES);
objj_msgSend(_observationProxies,"addObject:",_de);
objj_msgSend(objj_msgSend(_controller,"selectedObjects"),"addObserver:forKeyPath:options:context:",_de,_db,_dc,_dd);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_df,_e0,_e1,_e2){
with(_df){
var _e3=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_e2,_e1,_df),_e4=objj_msgSend(_observationProxies,"indexOfObject:",_e3);
objj_msgSend(objj_msgSend(_controller,"selectedObjects"),"removeObserver:forKeyPath:",objj_msgSend(_observationProxies,"objectAtIndex:",_e4),_e2);
objj_msgSend(_observationProxies,"removeObjectAtIndex:",_e4);
}
})]);
