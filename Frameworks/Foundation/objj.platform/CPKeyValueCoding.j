i;9;CPArray.ji;10;CPObject.ji;14;CPDictionary.jc;6064;
var _1=nil,_2=nil;
CPUndefinedKeyException="CPUndefinedKeyException";
CPTargetObjectUserInfoKey="CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey="CPUnknownUserInfoKey";
var _3=objj_getClass("CPObject");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("_ivarForKey:"),function(_5,_6,_7){
with(_5){
var _8="_"+_7;
if(typeof _5[_8]!="undefined"){
return _8;
}
var _9="is"+_7.charAt(0).toUpperCase()+_7.substr(1);
_8="_"+_9;
if(typeof _5[_8]!="undefined"){
return _8;
}
_8=_7;
if(typeof _5[_8]!="undefined"){
return _8;
}
_8=_9;
if(typeof _5[_8]!="undefined"){
return _8;
}
return nil;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(_a,"class"),_e=objj_msgSend(_d,"_accessorForKey:",_c);
if(_e){
return objj_msgSend(_a,_e);
}
if(objj_msgSend(_d,"accessInstanceVariablesDirectly")){
var _f=objj_msgSend(_a,"_ivarForKey:",_c);
if(_f){
return _a[_f];
}
}
return objj_msgSend(_a,"valueForUndefinedKey:",_c);
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_10,_11,_12){
with(_10){
var _13=_12.indexOf(".");
if(_13===CPNotFound){
return objj_msgSend(_10,"valueForKey:",_12);
}
var _14=_12.substring(0,_13),_15=_12.substring(_13+1);
return objj_msgSend(objj_msgSend(_10,"valueForKey:",_14),"valueForKeyPath:",_15);
}
}),new objj_method(sel_getUid("dictionaryWithValuesForKeys:"),function(_16,_17,_18){
with(_16){
var _19=0,_1a=_18.length,_1b=objj_msgSend(CPDictionary,"dictionary");
for(;_19<_1a;++_19){
var key=_18[_19],_1d=objj_msgSend(_16,"valueForKey:",key);
if(_1d===nil){
objj_msgSend(_1b,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
}else{
objj_msgSend(_1b,"setObject:forKey:",_1d,key);
}
}
return _1b;
}
}),new objj_method(sel_getUid("valueForUndefinedKey:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_1e,"description")+" is not key value coding-compliant for the key "+_20,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_1e,_20],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_21,_22,_23,_24){
with(_21){
if(!_24){
_24="self";
}
var i=0,_26=_24.split("."),_27=_26.length-1,_28=_21;
for(;i<_27;++i){
_28=objj_msgSend(_28,"valueForKey:",_26[i]);
}
objj_msgSend(_28,"setValue:forKey:",_23,_26[i]);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=objj_msgSend(_29,"class"),_2e=objj_msgSend(_2d,"_modifierForKey:",_2c);
if(_2e){
return objj_msgSend(_29,_2e,_2b);
}
if(objj_msgSend(_2d,"accessInstanceVariablesDirectly")){
var _2f=objj_msgSend(_29,"_ivarForKey:",_2c);
if(_2f){
objj_msgSend(_29,"willChangeValueForKey:",_2c);
_29[_2f]=_2b;
objj_msgSend(_29,"didChangeValueForKey:",_2c);
return;
}
}
objj_msgSend(_29,"setValue:forUndefinedKey:",_2b,_2c);
}
}),new objj_method(sel_getUid("setValue:forUndefinedKey:"),function(_30,_31,_32,_33){
with(_30){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_30,"description")+" is not key value coding-compliant for the key "+_33,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_30,_33],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("accessInstanceVariablesDirectly"),function(_34,_35){
with(_34){
return YES;
}
}),new objj_method(sel_getUid("_accessorForKey:"),function(_36,_37,_38){
with(_36){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
var UID=objj_msgSend(isa,"UID"),_3a=nil,_3b=objj_msgSend(_1,"objectForKey:",UID);
if(_3b){
_3a=objj_msgSend(_3b,"objectForKey:",_38);
if(_3a){
return _3a===objj_msgSend(CPNull,"null")?nil:_3a;
}
}else{
_3b=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1,"setObject:forKey:",_3b,UID);
}
var _3c=_38.charAt(0).toUpperCase()+_38.substr(1);
if(objj_msgSend(_36,"instancesRespondToSelector:",_3a=CPSelectorFromString("get"+_3c))||objj_msgSend(_36,"instancesRespondToSelector:",_3a=CPSelectorFromString(_38))||objj_msgSend(_36,"instancesRespondToSelector:",_3a=CPSelectorFromString("is"+_3c))||objj_msgSend(_36,"instancesRespondToSelector:",_3a=CPSelectorFromString("_get"+_3c))||objj_msgSend(_36,"instancesRespondToSelector:",_3a=CPSelectorFromString("_"+_38))||objj_msgSend(_36,"instancesRespondToSelector:",_3a=CPSelectorFromString("_is"+_3c))){
objj_msgSend(_3b,"setObject:forKey:",_3a,_38);
return _3a;
}
objj_msgSend(_3b,"setObject:forKey:",objj_msgSend(CPNull,"null"),_38);
return nil;
}
}),new objj_method(sel_getUid("_modifierForKey:"),function(_3d,_3e,_3f){
with(_3d){
if(!_2){
_2=objj_msgSend(CPDictionary,"dictionary");
}
var UID=objj_msgSend(isa,"UID"),_41=nil,_42=objj_msgSend(_2,"objectForKey:",UID);
if(_42){
_41=objj_msgSend(_42,"objectForKey:",_3f);
if(_41){
return _41===objj_msgSend(CPNull,"null")?nil:_41;
}
}else{
_42=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_2,"setObject:forKey:",_42,UID);
}
if(_41){
return _41===objj_msgSend(CPNull,"null")?nil:_41;
}
var _43=_3f.charAt(0).toUpperCase()+_3f.substr(1)+":";
if(objj_msgSend(_3d,"instancesRespondToSelector:",_41=CPSelectorFromString("set"+_43))||objj_msgSend(_3d,"instancesRespondToSelector:",_41=CPSelectorFromString("_set"+_43))){
objj_msgSend(_42,"setObject:forKey:",_41,_3f);
return _41;
}
objj_msgSend(_42,"setObject:forKey:",objj_msgSend(CPNull,"null"),_3f);
return nil;
}
})]);
var _3=objj_getClass("CPDictionary");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDictionary\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_44,_45,_46){
with(_44){
return objj_msgSend(_44,"objectForKey:",_46);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_47,_48,_49,_4a){
with(_47){
objj_msgSend(_47,"setObject:forKey:",_49,_4a);
}
})]);
i;13;CPArray+KVO.j