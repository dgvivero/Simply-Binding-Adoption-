i;9;CPArray.jc;11460;
var _1=objj_getClass("CPObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("mutableArrayValueForKey:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_CPKVCArray,"alloc"),"initWithKey:forProxyObject:",_5,_3);
}
}),new objj_method(sel_getUid("mutableArrayValueForKeyPath:"),function(_6,_7,_8){
with(_6){
var _9=_8.indexOf(".");
if(_9<0){
return objj_msgSend(_6,"mutableArrayValueForKey:",_8);
}
var _a=_8.substring(0,_9),_b=_8.substring(_9+1);
return objj_msgSend(objj_msgSend(_6,"valueForKeyPath:",_a),"valueForKeyPath:",_b);
}
})]);
var _1=objj_allocateClassPair(CPArray,"_CPKVCArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_proxyObject"),new objj_ivar("_key"),new objj_ivar("_insertSEL"),new objj_ivar("_insert"),new objj_ivar("_removeSEL"),new objj_ivar("_remove"),new objj_ivar("_replaceSEL"),new objj_ivar("_replace"),new objj_ivar("_insertManySEL"),new objj_ivar("_insertMany"),new objj_ivar("_removeManySEL"),new objj_ivar("_removeMany"),new objj_ivar("_replaceManySEL"),new objj_ivar("_replaceMany"),new objj_ivar("_objectAtIndexSEL"),new objj_ivar("_objectAtIndex"),new objj_ivar("_countSEL"),new objj_ivar("_count"),new objj_ivar("_accessSEL"),new objj_ivar("_access"),new objj_ivar("_setSEL"),new objj_ivar("_set")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:forProxyObject:"),function(_c,_d,_e,_f){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPArray")},"init");
_key=_e;
_proxyObject=_f;
var _10=_key.charAt(0).toUpperCase()+_key.substring(1);
_insertSEL=sel_getName("insertObject:in"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertSEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertSEL);
}
_removeSEL=sel_getName("removeObjectFrom"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeSEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeSEL);
}
_replaceSEL=sel_getName("replaceObjectFrom"+_10+"AtIndex:withObject:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceSEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceSEL);
}
_insertManySEL=sel_getName("insertObjects:in"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertManySEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertManySEL);
}
_removeManySEL=sel_getName("removeObjectsFrom"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeManySEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeManySEL);
}
_replaceManySEL=sel_getName("replaceObjectsFrom"+_10+"AtIndexes:withObjects:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceManySEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceManySEL);
}
_objectAtIndexSEL=sel_getName("objectIn"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_objectAtIndexSEL)){
_objectAtIndex=objj_msgSend(_proxyObject,"methodForSelector:",_objectAtIndexSEL);
}
_countSEL=sel_getName("countOf"+_10);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_countSEL)){
_count=objj_msgSend(_proxyObject,"methodForSelector:",_countSEL);
}
_accessSEL=sel_getName(_key);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_accessSEL)){
_access=objj_msgSend(_proxyObject,"methodForSelector:",_accessSEL);
}
_setSEL=sel_getName("set"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_setSEL)){
_set=objj_msgSend(_proxyObject,"methodForSelector:",_setSEL);
}
return _c;
}
}),new objj_method(sel_getUid("copy"),function(_11,_12){
with(_11){
var _13=[],_14=objj_msgSend(_11,"count");
for(var i=0;i<_14;i++){
objj_msgSend(_13,"addObject:",objj_msgSend(_11,"objectAtIndex:",i));
}
return _13;
}
}),new objj_method(sel_getUid("_representedObject"),function(_16,_17){
with(_16){
if(_access){
return _access(_proxyObject,_accessSEL);
}
return objj_msgSend(_proxyObject,"valueForKey:",_key);
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_18,_19,_1a){
with(_18){
if(_set){
return _set(_proxyObject,_setSEL,_1a);
}
objj_msgSend(_proxyObject,"setValue:forKey:",_1a,_key);
}
}),new objj_method(sel_getUid("count"),function(_1b,_1c){
with(_1b){
if(_count){
return _count(_proxyObject,_countSEL);
}
return objj_msgSend(objj_msgSend(_1b,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_1d,_1e,_1f){
with(_1d){
if(_objectAtIndex){
return _objectAtIndex(_proxyObject,_objectAtIndexSEL,_1f);
}
return objj_msgSend(objj_msgSend(_1d,"_representedObject"),"objectAtIndex:",_1f);
}
}),new objj_method(sel_getUid("addObject:"),function(_20,_21,_22){
with(_20){
if(_insert){
return _insert(_proxyObject,_insertSEL,_22,objj_msgSend(_20,"count"));
}
var _23=objj_msgSend(objj_msgSend(_20,"_representedObject"),"copy");
objj_msgSend(_23,"addObject:",_22);
objj_msgSend(_20,"_setRepresentedObject:",_23);
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_24,_25,_26,_27){
with(_24){
if(_insert){
return _insert(_proxyObject,_insertSEL,_26,_27);
}
var _28=objj_msgSend(objj_msgSend(_24,"_representedObject"),"copy");
objj_msgSend(_28,"insertObject:atIndex:",_26,_27);
objj_msgSend(_24,"_setRepresentedObject:",_28);
}
}),new objj_method(sel_getUid("removeLastObject"),function(_29,_2a){
with(_29){
if(_remove){
return _remove(_proxyObject,_removeSEL,objj_msgSend(_29,"count")-1);
}
var _2b=objj_msgSend(objj_msgSend(_29,"_representedObject"),"copy");
objj_msgSend(_2b,"removeLastObject");
objj_msgSend(_29,"_setRepresentedObject:",_2b);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_2c,_2d,_2e){
with(_2c){
if(_remove){
return _remove(_proxyObject,_removeSEL,_2e);
}
var _2f=objj_msgSend(objj_msgSend(_2c,"_representedObject"),"copy");
objj_msgSend(_2f,"removeObjectAtIndex:",_2e);
objj_msgSend(_2c,"_setRepresentedObject:",_2f);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_30,_31,_32,_33){
with(_30){
if(_replace){
return _replace(_proxyObject,_replaceSEL,_32,_33);
}
var _34=objj_msgSend(objj_msgSend(_30,"_representedObject"),"copy");
objj_msgSend(_34,"replaceObjectAtIndex:withObject:",_32,_33);
objj_msgSend(_30,"_setRepresentedObject:",_34);
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_37,"firstIndex"),_39=[];
while(_38!=CPNotFound){
objj_msgSend(_39,"addObject:",objj_msgSend(_35,"objectAtIndex:",_38));
_38=objj_msgSend(_37,"indexGreaterThanIndex:",_38);
}
return _39;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_3a,_3b){
with(_3a){
var a=[];
a.isa=_3a;
var _3d=class_copyIvarList(_3a),_3e=_3d.length;
while(_3e--){
a[ivar_getName(_3d[_3e])]=nil;
}
return a;
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKey:"),function(_3f,_40,_41){
with(_3f){
if(_41.indexOf("@")===0){
if(_41.indexOf(".")!==-1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"called valueForKey: on an array with a complex key ("+_41+"). use valueForKeyPath:");
}
if(_41=="@count"){
return length;
}
return nil;
}else{
var _42=[],_43=objj_msgSend(_3f,"objectEnumerator"),_44;
while((_44=objj_msgSend(_43,"nextObject"))!==nil){
var _45=objj_msgSend(_44,"valueForKey:",_41);
if(_45===nil||_45===undefined){
_45=objj_msgSend(CPNull,"null");
}
_42.push(_45);
}
return _42;
}
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_46,_47,_48){
with(_46){
if(_48.indexOf("@")===0){
var _49=_48.indexOf("."),_4a=_48.substring(1,_49),_4b=_48.substring(_49+1);
if(_4c[_4a]){
return _4c[_4a](_46,_47,_4b);
}
return nil;
}else{
return objj_msgSendSuper({receiver:_46,super_class:objj_getClass("CPArray").super_class},"valueForKeyPath:",_48);
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_4d,_4e,_4f,_50){
with(_4d){
var _51=objj_msgSend(_4d,"objectEnumerator"),_52;
while(_52=objj_msgSend(_51,"nextObject")){
objj_msgSend(_52,"setValue:forKey:",_4f,_50);
}
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_53,_54,_55,_56){
with(_53){
var _57=objj_msgSend(_53,"objectEnumerator"),_58;
while(_58=objj_msgSend(_57,"nextObject")){
objj_msgSend(_58,"setValue:forKeyPath:",_55,_56);
}
}
})]);
var _4c=[];
_4c["avg"]=avgOperator=function(_59,_5a,_5b){
var _5c=objj_msgSend(_59,"valueForKeyPath:",_5b),_5d=objj_msgSend(_5c,"count"),_5e=_5d;
average=0;
if(!_5d){
return 0;
}
while(_5e--){
average+=objj_msgSend(_5c[_5e],"doubleValue");
}
return average/_5d;
};
_4c["max"]=maxOperator=function(_5f,_60,_61){
var _62=objj_msgSend(_5f,"valueForKeyPath:",_61),_63=objj_msgSend(_62,"count")-1,max=objj_msgSend(_62,"lastObject");
while(_63--){
var _65=_62[_63];
if(objj_msgSend(max,"compare:",_65)<0){
max=_65;
}
}
return max;
};
_4c["min"]=minOperator=function(_66,_67,_68){
var _69=objj_msgSend(_66,"valueForKeyPath:",_68),_6a=objj_msgSend(_69,"count")-1,min=objj_msgSend(_69,"lastObject");
while(_6a--){
var _6c=_69[_6a];
if(objj_msgSend(min,"compare:",_6c)>0){
min=_6c;
}
}
return min;
};
_4c["count"]=countOperator=function(_6d,_6e,_6f){
return objj_msgSend(_6d,"count");
};
_4c["sum"]=sumOperator=function(_70,_71,_72){
var _73=objj_msgSend(_70,"valueForKeyPath:",_72),_74=objj_msgSend(_73,"count"),sum=0;
while(_74--){
sum+=objj_msgSend(_73[_74],"doubleValue");
}
return sum;
};
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"),function(_76,_77,_78,_79,_7a,_7b,_7c){
with(_76){
var _7d=objj_msgSend(_79,"firstIndex");
while(_7d>=0){
objj_msgSend(_76[_7d],"addObserver:forKeyPath:options:context:",_78,_7a,_7b,_7c);
_7d=objj_msgSend(_79,"indexGreaterThanIndex:",_7d);
}
}
}),new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"),function(_7e,_7f,_80,_81,_82){
with(_7e){
var _83=objj_msgSend(_81,"firstIndex");
while(_83>=0){
objj_msgSend(_7e[_83],"removeObserver:forKeyPath:",_80,_82);
_83=objj_msgSend(_81,"indexGreaterThanIndex:",_83);
}
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_84,_85,_86,_87,_88,_89){
with(_84){
if(objj_msgSend(isa,"instanceMethodForSelector:",_85)===objj_msgSend(CPArray,"instanceMethodForSelector:",_85)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unsupported method on CPArray");
}else{
objj_msgSendSuper({receiver:_84,super_class:objj_getClass("CPArray").super_class},"addObserver:forKeyPath:options:context:",_86,_87,_88,_89);
}
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_8a,_8b,_8c,_8d){
with(_8a){
if(objj_msgSend(isa,"instanceMethodForSelector:",_8b)===objj_msgSend(CPArray,"instanceMethodForSelector:",_8b)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unsupported method on CPArray");
}else{
objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("CPArray").super_class},"removeObserver:forKeyPath:",_8c,_8d);
}
}
})]);
