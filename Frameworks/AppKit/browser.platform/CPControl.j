i;8;CPFont.ji;10;CPShadow.ji;8;CPView.ji;19;CPKeyValueBinding.jc;16510;
CPLeftTextAlignment=0;
CPRightTextAlignment=1;
CPCenterTextAlignment=2;
CPJustifiedTextAlignment=3;
CPNaturalTextAlignment=4;
CPRegularControlSize=0;
CPSmallControlSize=1;
CPMiniControlSize=2;
CPControlNormalBackgroundColor="CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor="CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor="CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor="CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification="CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification="CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification="CPControlTextDidEndEditingNotification";
var _1=objj_msgSend(CPColor,"blackColor");
var _2=objj_allocateClassPair(CPView,"CPControl"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_value"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_sendActionOn"),new objj_ivar("_continuousTracking"),new objj_ivar("_trackingWasWithinFrame"),new objj_ivar("_trackingMouseDownFlags"),new objj_ivar("_previousTrackingLocation"),new objj_ivar("_toolTip")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPView")},"initWithFrame:",_6);
if(_4){
_sendActionOn=CPLeftMouseUpMask;
_trackingMouseDownFlags=0;
}
return _4;
}
}),new objj_method(sel_getUid("setAction:"),function(_7,_8,_9){
with(_7){
_action=_9;
}
}),new objj_method(sel_getUid("action"),function(_a,_b){
with(_a){
return _action;
}
}),new objj_method(sel_getUid("setTarget:"),function(_c,_d,_e){
with(_c){
_target=_e;
}
}),new objj_method(sel_getUid("target"),function(_f,_10){
with(_f){
return _target;
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_11,_12,_13,_14){
with(_11){
var _15=objj_msgSend(CPKeyValueBinding,"getBinding:forObject:",CPValueBinding,_11);
if(_15){
objj_msgSend(_15,"reverseSetValueFor:","objectValue");
}
objj_msgSend(CPApp,"sendAction:to:from:",_13,_14,_11);
}
}),new objj_method(sel_getUid("sendActionOn:"),function(_16,_17,_18){
with(_16){
var _19=_sendActionOn;
_sendActionOn=_18;
return _19;
}
}),new objj_method(sel_getUid("isContinuous"),function(_1a,_1b){
with(_1a){
return (_sendActionOn&CPPeriodicMask)!==0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_1c,_1d,_1e){
with(_1c){
if(_1e){
_sendActionOn|=CPPeriodicMask;
}else{
_sendActionOn&=~CPPeriodicMask;
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_1f,_20){
with(_1f){
return NO;
}
}),new objj_method(sel_getUid("trackMouse:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(_23,"type"),_25=objj_msgSend(_21,"convertPoint:fromView:",objj_msgSend(_23,"locationInWindow"),nil);
isWithinFrame=objj_msgSend(_21,"tracksMouseOutsideOfFrame")||CGRectContainsPoint(objj_msgSend(_21,"bounds"),_25);
if(_24===CPLeftMouseUp){
objj_msgSend(_21,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_25,YES);
_trackingMouseDownFlags=0;
}else{
if(_24===CPLeftMouseDown){
_trackingMouseDownFlags=objj_msgSend(_23,"modifierFlags");
_continuousTracking=objj_msgSend(_21,"startTrackingAt:",_25);
}else{
if(_24===CPLeftMouseDragged){
if(isWithinFrame){
if(!_trackingWasWithinFrame){
_continuousTracking=objj_msgSend(_21,"startTrackingAt:",_25);
}else{
if(_continuousTracking){
_continuousTracking=objj_msgSend(_21,"continueTracking:at:",_previousTrackingLocation,_25);
}
}
}else{
objj_msgSend(_21,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_25,NO);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_21,sel_getUid("trackMouse:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
if((_sendActionOn&(1<<_24))&&isWithinFrame){
objj_msgSend(_21,"sendAction:to:",_action,_target);
}
_trackingWasWithinFrame=isWithinFrame;
_previousTrackingLocation=_25;
}
}),new objj_method(sel_getUid("performClick:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_26,"highlight:",YES);
objj_msgSend(_26,"setState:",objj_msgSend(_26,"nextState"));
objj_msgSend(_26,"sendAction:to:",objj_msgSend(_26,"action"),objj_msgSend(_26,"target"));
objj_msgSend(_26,"highlight:",NO);
}
}),new objj_method(sel_getUid("setState:"),function(_29,_2a,_2b){
with(_29){
}
}),new objj_method(sel_getUid("nextState"),function(_2c,_2d){
with(_2c){
return 0;
}
}),new objj_method(sel_getUid("mouseDownFlags"),function(_2e,_2f){
with(_2e){
return _trackingMouseDownFlags;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_30,"highlight:",YES);
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_33,_34,_35,_36){
with(_33){
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_37,_38,_39,_3a,_3b){
with(_37){
objj_msgSend(_37,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3c,_3d,_3e){
with(_3c){
if(!objj_msgSend(_3c,"isEnabled")){
return;
}
objj_msgSend(_3c,"trackMouse:",_3e);
}
}),new objj_method(sel_getUid("objectValue"),function(_3f,_40){
with(_3f){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_41,_42,_43){
with(_41){
_value=_43;
objj_msgSend(_41,"setNeedsLayout");
objj_msgSend(_41,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("floatValue"),function(_44,_45){
with(_44){
var _46=parseFloat(_value,10);
return isNaN(_46)?0:_46;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_47,"setObjectValue:",_49);
}
}),new objj_method(sel_getUid("doubleValue"),function(_4a,_4b){
with(_4a){
var _4c=parseFloat(_value,10);
return isNaN(_4c)?0:_4c;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"setObjectValue:",_4f);
}
}),new objj_method(sel_getUid("intValue"),function(_50,_51){
with(_50){
var _52=parseInt(_value,10);
return isNaN(_52)?0:_52;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_53,"setObjectValue:",_55);
}
}),new objj_method(sel_getUid("integerValue"),function(_56,_57){
with(_56){
var _58=parseInt(_value,10);
return isNaN(_58)?0:_58;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"setObjectValue:",_5b);
}
}),new objj_method(sel_getUid("stringValue"),function(_5c,_5d){
with(_5c){
return (_value===undefined||_value===nil)?"":String(_value);
}
}),new objj_method(sel_getUid("setStringValue:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_5e,"setObjectValue:",_60);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_61,_62,_63){
with(_61){
if(objj_msgSend(_63,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_61,"setDoubleValue:",objj_msgSend(_63,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_64,_65,_66){
with(_64){
if(objj_msgSend(_66,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_64,"setFloatValue:",objj_msgSend(_66,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_67,_68,_69){
with(_67){
if(objj_msgSend(_69,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_67,"setIntegerValue:",objj_msgSend(_69,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_6a,_6b,_6c){
with(_6a){
if(objj_msgSend(_6c,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_6a,"setIntValue:",objj_msgSend(_6c,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_6d,_6e,_6f){
with(_6d){
if(objj_msgSend(_6f,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_6d,"setObjectValue:",objj_msgSend(_6f,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_70,_71,_72){
with(_70){
if(objj_msgSend(_72,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_70,"setStringValue:",objj_msgSend(_72,"stringValue"));
}
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_73,_74,_75){
with(_73){
if(objj_msgSend(_75,"object")!=_73){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_73,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_75,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_76,_77,_78){
with(_76){
if(objj_msgSend(_78,"object")!=_76){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_76,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_78,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_79,_7a,_7b){
with(_79){
if(objj_msgSend(_7b,"object")!=_79){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_79,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_7b,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("setAlignment:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSend(_7c,"setValue:forThemeAttribute:",_7e,"alignment");
}
}),new objj_method(sel_getUid("alignment"),function(_7f,_80){
with(_7f){
return objj_msgSend(_7f,"valueForThemeAttribute:","alignment");
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_81,"setValue:forThemeAttribute:",_83,"vertical-alignment");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_84,_85){
with(_84){
return objj_msgSend(_84,"valueForThemeAttribute:","vertical-alignment");
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_86,_87,_88){
with(_86){
objj_msgSend(_86,"setValue:forThemeAttribute:",_88,"line-break-mode");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_89,_8a){
with(_89){
return objj_msgSend(_89,"valueForThemeAttribute:","line-break-mode");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_8b,_8c,_8d){
with(_8b){
objj_msgSend(_8b,"setValue:forThemeAttribute:",_8d,"text-color");
}
}),new objj_method(sel_getUid("textColor"),function(_8e,_8f){
with(_8e){
return objj_msgSend(_8e,"valueForThemeAttribute:","text-color");
}
}),new objj_method(sel_getUid("setFont:"),function(_90,_91,_92){
with(_90){
objj_msgSend(_90,"setValue:forThemeAttribute:",_92,"font");
}
}),new objj_method(sel_getUid("font"),function(_93,_94){
with(_93){
return objj_msgSend(_93,"valueForThemeAttribute:","font");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_95,_96,_97){
with(_95){
objj_msgSend(_95,"setValue:forThemeAttribute:",_97,"text-shadow-color");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_98,_99){
with(_98){
return objj_msgSend(_98,"valueForThemeAttribute:","text-shadow-color");
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_9a,_9b,_9c){
with(_9a){
objj_msgSend(_9a,"setValue:forThemeAttribute:",_9c,"text-shadow-offset");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_9d,_9e){
with(_9d){
return objj_msgSend(_9d,"valueForThemeAttribute:","text-shadow-offset");
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_9f,_a0,_a1){
with(_9f){
objj_msgSend(_9f,"setValue:forThemeAttribute:",_a1,"image-position");
}
}),new objj_method(sel_getUid("imagePosition"),function(_a2,_a3){
with(_a2){
return objj_msgSend(_a2,"valueForThemeAttribute:","image-position");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSend(_a4,"setValue:forThemeAttribute:",_a6,"image-scaling");
}
}),new objj_method(sel_getUid("imageScaling"),function(_a7,_a8){
with(_a7){
return objj_msgSend(_a7,"valueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_a9,_aa,_ab){
with(_a9){
if(_ab){
objj_msgSend(_a9,"unsetThemeState:",CPThemeStateDisabled);
}else{
objj_msgSend(_a9,"setThemeState:",CPThemeStateDisabled);
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_ac,_ad){
with(_ac){
return !objj_msgSend(_ac,"hasThemeState:",CPThemeStateDisabled);
}
}),new objj_method(sel_getUid("highlight:"),function(_ae,_af,_b0){
with(_ae){
objj_msgSend(_ae,"setHighlighted:",_b0);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_b1,_b2,_b3){
with(_b1){
if(_b3){
objj_msgSend(_b1,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_b1,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("isHighlighted"),function(_b4,_b5){
with(_b4){
return objj_msgSend(_b4,"hasThemeState:",CPThemeStateHighlighted);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeAttributes"),function(_b6,_b7){
with(_b6){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPLeftTextAlignment,CPTopVerticalTextAlignment,CPLineBreakByClipping,objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12),nil,{width:0,height:0},CPImageLeft,CPScaleToFit,{width:0,height:0},{width:-1,height:-1}],["alignment","vertical-alignment","line-break-mode","text-color","font","text-shadow-color","text-shadow-offset","image-position","image-scaling","min-size","max-size"]);
}
}),new objj_method(sel_getUid("initialize"),function(_b8,_b9){
with(_b8){
objj_msgSend(_b8,"exposeBinding:","value");
}
})]);
var _ba="CPControlValueKey",_bb="CPControlControlStateKey",_bc="CPControlIsEnabledKey",_bd="CPControlTargetKey",_be="CPControlActionKey",_bf="CPControlSendActionOnKey";
var _c0="CPImageViewImageKey";
var _2=objj_getClass("CPControl");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPControl\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_c1,_c2,_c3){
with(_c1){
_c1=objj_msgSendSuper({receiver:_c1,super_class:objj_getClass("CPView")},"initWithCoder:",_c3);
if(_c1){
objj_msgSend(_c1,"setObjectValue:",objj_msgSend(_c3,"decodeObjectForKey:",_ba));
objj_msgSend(_c1,"setTarget:",objj_msgSend(_c3,"decodeObjectForKey:",_bd));
objj_msgSend(_c1,"setAction:",objj_msgSend(_c3,"decodeObjectForKey:",_be));
objj_msgSend(_c1,"sendActionOn:",objj_msgSend(_c3,"decodeIntForKey:",_bf));
}
return _c1;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c4,_c5,_c6){
with(_c4){
objj_msgSendSuper({receiver:_c4,super_class:objj_getClass("CPView")},"encodeWithCoder:",_c6);
if(_value!==nil){
objj_msgSend(_c6,"encodeObject:forKey:",_value,_ba);
}
if(_target!==nil){
objj_msgSend(_c6,"encodeConditionalObject:forKey:",_target,_bd);
}
if(_action!==NULL){
objj_msgSend(_c6,"encodeObject:forKey:",_action,_be);
}
objj_msgSend(_c6,"encodeInt:forKey:",_sendActionOn,_bf);
}
})]);
var _c7=[],_c8={},_c9={};
_c7[CPRegularControlSize]="Regular";
_c7[CPSmallControlSize]="Small";
_c7[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_ca){
return _c7[_ca];
};
_CPControlColorWithPatternImage=function(_cb,_cc){
var _cd=1,_ce=arguments.length,_cf="";
for(;_cd<_ce;++_cd){
_cf+=arguments[_cd];
}
var _d0=_c8[_cf];
if(!_d0){
var _d1=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_d0=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d1,"pathForResource:",_cc+"/"+_cf+".png"),_cb[_cf]));
_c8[_cf]=_d0;
}
return _d0;
};
_CPControlThreePartImagePattern=function(_d2,_d3,_d4){
var _d5=2,_d6=arguments.length,_d7="";
for(;_d5<_d6;++_d5){
_d7+=arguments[_d5];
}
var _d8=_c9[_d7];
if(!_d8){
var _d9=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_da=_d4+"/"+_d7;
_d3=_d3[_d7];
_d8=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d9,"pathForResource:",_da+"0.png"),_d3[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d9,"pathForResource:",_da+"1.png"),_d3[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d9,"pathForResource:",_da+"2.png"),_d3[2])],_d2));
_c9[_d7]=_d8;
}
return _d8;
};
