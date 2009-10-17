i;10;CPObject.ji;9;CPRange.ji;14;CPEnumerator.ji;18;CPSortDescriptor.ji;13;CPException.jc;18519;
var _1=objj_allocateClassPair(CPEnumerator,"_CPArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPEnumerator")},"init");
if(_3){
_array=_5;
_index=-1;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
if(++_index>=objj_msgSend(_array,"count")){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPEnumerator,"_CPReverseArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPEnumerator")},"init");
if(_8){
_array=_a;
_index=objj_msgSend(_array,"count");
}
return _8;
}
}),new objj_method(sel_getUid("nextObject"),function(_b,_c){
with(_b){
if(--_index<0){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPArray"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return _d;
}
}),new objj_method(sel_getUid("initWithArray:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPObject")},"init");
if(_f){
objj_msgSend(_f,"setArray:",_11);
}
return _f;
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_12,_13,_14,_15){
with(_12){
if(!_15){
return objj_msgSend(_12,"initWithArray:",_14);
}
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPObject")},"init");
if(_12){
var _16=0,_17=objj_msgSend(_14,"count");
for(;_16<_17;++i){
if(_14[i].isa){
_12[i]=objj_msgSend(_14,"copy");
}else{
_12[i]=_14;
}
}
}
return _12;
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_18,_19,_1a){
with(_18){
var i=2,_1c;
for(;i<arguments.length&&(_1c=arguments[i])!=nil;++i){
push(_1c);
}
return _18;
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_1d,_1e,_1f,_20){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPObject")},"init");
if(_1d){
var _21=0;
for(;_21<_20;++_21){
push(_1f[_21]);
}
}
return _1d;
}
}),new objj_method(sel_getUid("containsObject:"),function(_22,_23,_24){
with(_22){
return objj_msgSend(_22,"indexOfObject:",_24)!=CPNotFound;
}
}),new objj_method(sel_getUid("count"),function(_25,_26){
with(_25){
return length;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_27,_28,_29){
with(_27){
if(_29===nil){
return CPNotFound;
}
var i=0,_2b=length;
if(_29.isa){
for(;i<_2b;++i){
if(objj_msgSend(_27[i],"isEqual:",_29)){
return i;
}
}
}else{
if(_27.indexOf){
return indexOf(_29);
}else{
for(;i<_2b;++i){
if(_27[i]==_29){
return i;
}
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_2c,_2d,_2e,_2f){
with(_2c){
if(_2e===nil){
return CPNotFound;
}
var i=_2f.location,_31=MIN(CPMaxRange(_2f),length);
if(_2e.isa){
for(;i<_31;++i){
if(objj_msgSend(_2c[i],"isEqual:",_2e)){
return i;
}
}
}else{
for(;i<_31;++i){
if(_2c[i]==_2e){
return i;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_32,_33,_34){
with(_32){
if(_34===nil){
return CPNotFound;
}
if(_32.indexOf){
return indexOf(_34);
}else{
var _35=0,_36=length;
for(;_35<_36;++_35){
if(_32[_35]==_34){
return _35;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_37,_38,_39,_3a){
with(_37){
if(_39===nil){
return CPNotFound;
}
if(_37.indexOf){
var _3b=indexOf(_39,_3a.location);
if(CPLocationInRange(_3b,_3a)){
return _3b;
}
}else{
var _3b=_3a.location,_3c=MIN(CPMaxRange(_3a),length);
for(;_3b<_3c;++_3b){
if(_37[_3b]==_39){
return _3b;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:sortedBySelector:"),function(_3d,_3e,_3f,_40){
with(_3d){
return objj_msgSend(_3d,"indexOfObject:sortedByFunction:",_3f,function(lhs,rhs){
objj_msgSend(lhs,_40,rhs);
});
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:"),function(_43,_44,_45,_46){
with(_43){
return objj_msgSend(_43,"indexOfObject:sortedByFunction:context:",_45,_46,nil);
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"),function(_47,_48,_49,_4a,_4b){
with(_47){
var _4c=objj_msgSend(_47,"_indexOfObject:sortedByFunction:context:",_49,_4a,_4b);
return _4c>=0?_4c:CPNotFound;
}
}),new objj_method(sel_getUid("_indexOfObject:sortedByFunction:context:"),function(_4d,_4e,_4f,_50,_51){
with(_4d){
if(!_50||_4f===undefined){
return CPNotFound;
}
var mid,c,_54=0,_55=length-1;
while(_54<=_55){
mid=FLOOR((_54+_55)/2);
c=_50(_4f,_4d[mid],_51);
if(c>0){
_54=mid+1;
}else{
if(c<0){
_55=mid-1;
}else{
while(mid<length-1&&_50(_4f,_4d[mid+1],_51)==CPOrderedSame){
mid++;
}
return mid;
}
}
}
return -mid-1;
}
}),new objj_method(sel_getUid("indexOfObject:sortedByDescriptors:"),function(_56,_57,_58,_59){
with(_56){
return objj_msgSend(_56,"indexOfObject:sortedByFunction:",_58,function(lhs,rhs){
var i=0,_5d=objj_msgSend(_59,"count"),_5e=CPOrderedSame;
while(i<_5d){
if((_5e=objj_msgSend(_59[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _5e;
}
}
return _5e;
});
}
}),new objj_method(sel_getUid("insertObject:inArraySortedByDescriptors:"),function(_5f,_60,_61,_62){
with(_5f){
var _63=objj_msgSend(_5f,"_insertObject:sortedByFunction:context:",_61,function(lhs,rhs){
var i=0,_67=objj_msgSend(_62,"count"),_68=CPOrderedSame;
while(i<_67){
if((_68=objj_msgSend(_62[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _68;
}
}
return _68;
},nil);
if(_63<0){
_63=-result-1;
}
objj_msgSend(_5f,"insertObject:atIndex:",_61,_63);
}
}),new objj_method(sel_getUid("lastObject"),function(_69,_6a){
with(_69){
var _6b=objj_msgSend(_69,"count");
if(!_6b){
return nil;
}
return _69[_6b-1];
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_6c,_6d,_6e){
with(_6c){
if(_6e>=length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"index ("+_6e+") beyond bounds ("+length+")");
}
return _6c[_6e];
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_71,"firstIndex"),_73=[];
while(_72!=CPNotFound){
objj_msgSend(_73,"addObject:",_6f[_72]);
_72=objj_msgSend(_71,"indexGreaterThanIndex:",_72);
}
return _73;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_74,_75){
with(_74){
return objj_msgSend(objj_msgSend(_CPArrayEnumerator,"alloc"),"initWithArray:",_74);
}
}),new objj_method(sel_getUid("reverseObjectEnumerator"),function(_76,_77){
with(_76){
return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator,"alloc"),"initWithArray:",_76);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_78,_79,_7a){
with(_78){
if(!_7a){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector: 'aSelector' can't be nil");
}
var _7b=0,_7c=length;
for(;_7b<_7c;++_7b){
objj_msgSend(_78[_7b],_7a);
}
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_7d,_7e,_7f,_80){
with(_7d){
if(!_7f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector:withObject 'aSelector' can't be nil");
}
var _81=0,_82=length;
for(;_81<_82;++_81){
objj_msgSend(_7d[_81],_7f,_80);
}
}
}),new objj_method(sel_getUid("firstObjectCommonWithArray:"),function(_83,_84,_85){
with(_83){
if(!objj_msgSend(_85,"count")||!objj_msgSend(_83,"count")){
return nil;
}
var i=0,_87=objj_msgSend(_83,"count");
for(;i<_87;++i){
if(objj_msgSend(_85,"containsObject:",_83[i])){
return _83[i];
}
}
return nil;
}
}),new objj_method(sel_getUid("isEqualToArray:"),function(_88,_89,_8a){
with(_88){
if(_88===_8a){
return YES;
}
if(length!=_8a.length){
return NO;
}
var _8b=0,_8c=objj_msgSend(_88,"count");
for(;_8b<_8c;++_8b){
var lhs=_88[_8b],rhs=_8a[_8b];
if(lhs!==rhs&&(!lhs.isa||!rhs.isa||!objj_msgSend(lhs,"isEqual:",rhs))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_8f,_90,_91){
with(_8f){
if(_8f===_91){
return YES;
}
if(!objj_msgSend(_91,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return NO;
}
return objj_msgSend(_8f,"isEqualToArray:",_91);
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_92,_93,_94){
with(_92){
if(_94===nil||_94===undefined){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"arrayByAddingObject: object can't be nil");
}
var _95=objj_msgSend(_92,"copy");
_95.push(_94);
return _95;
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_96,_97,_98){
with(_96){
return slice(0).concat(_98);
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_99,_9a,_9b){
with(_99){
if(_9b.location<0||CPMaxRange(_9b)>length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"subarrayWithRange: aRange out of bounds");
}
return slice(_9b.location,CPMaxRange(_9b));
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_9c,_9d,_9e){
with(_9c){
var _9f=objj_msgSend(_9c,"copy");
objj_msgSend(_9f,"sortUsingDescriptors:",_9e);
return _9f;
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:"),function(_a0,_a1,_a2){
with(_a0){
return objj_msgSend(_a0,"sortedArrayUsingFunction:context:",_a2,nil);
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:context:"),function(_a3,_a4,_a5,_a6){
with(_a3){
var _a7=objj_msgSend(_a3,"copy");
objj_msgSend(_a7,"sortUsingFunction:context:",_a5,_a6);
return _a7;
}
}),new objj_method(sel_getUid("sortedArrayUsingSelector:"),function(_a8,_a9,_aa){
with(_a8){
var _ab=objj_msgSend(_a8,"copy");
objj_msgSend(_ab,"sortUsingSelector:",_aa);
return _ab;
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_ac,_ad,_ae){
with(_ac){
return join(_ae);
}
}),new objj_method(sel_getUid("description"),function(_af,_b0){
with(_af){
var _b1=0,_b2=objj_msgSend(_af,"count"),_b3="(";
for(;_b1<_b2;++_b1){
var _b4=_af[_b1];
if(_b4&&_b4.isa){
_b3+=objj_msgSend(_b4,"description");
}else{
_b3+=_b4;
}
if(_b1!==_b2-1){
_b3+=", ";
}
}
return _b3+")";
}
}),new objj_method(sel_getUid("pathsMatchingExtensions:"),function(_b5,_b6,_b7){
with(_b5){
var _b8=0,_b9=objj_msgSend(_b5,"count"),_ba=[];
for(;_b8<_b9;++_b8){
if(_b5[_b8].isa&&objj_msgSend(_b5[_b8],"isKindOfClass:",objj_msgSend(CPString,"class"))&&objj_msgSend(_b7,"containsObject:",objj_msgSend(_b5[_b8],"pathExtension"))){
_ba.push(_b5[_b8]);
}
}
return _ba;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_bb,_bc,_bd,_be){
with(_bb){
var i=0,_c0=objj_msgSend(_bb,"count");
for(;i<_c0;++i){
objj_msgSend(_bb[i],"setValue:forKey:",_bd,_be);
}
}
}),new objj_method(sel_getUid("valueForKey:"),function(_c1,_c2,_c3){
with(_c1){
var i=0,_c5=objj_msgSend(_c1,"count"),_c6=[];
for(;i<_c5;++i){
_c6.push(objj_msgSend(_c1[i],"valueForKey:",_c3));
}
return _c6;
}
}),new objj_method(sel_getUid("copy"),function(_c7,_c8){
with(_c7){
return slice(0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_c9,_ca){
with(_c9){
return [];
}
}),new objj_method(sel_getUid("array"),function(_cb,_cc){
with(_cb){
return objj_msgSend(objj_msgSend(_cb,"alloc"),"init");
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_cd,_ce,_cf){
with(_cd){
return objj_msgSend(objj_msgSend(_cd,"alloc"),"initWithArray:",_cf);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_d0,_d1,_d2){
with(_d0){
return objj_msgSend(objj_msgSend(_d0,"alloc"),"initWithObjects:",_d2);
}
}),new objj_method(sel_getUid("arrayWithObjects:"),function(_d3,_d4,_d5){
with(_d3){
var i=2,_d7=objj_msgSend(objj_msgSend(_d3,"alloc"),"init"),_d8;
for(;i<arguments.length&&(_d8=arguments[i])!=nil;++i){
_d7.push(_d8);
}
return _d7;
}
}),new objj_method(sel_getUid("arrayWithObjects:count:"),function(_d9,_da,_db,_dc){
with(_d9){
return objj_msgSend(objj_msgSend(_d9,"alloc"),"initWithObjects:count:",_db,_dc);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCapacity:"),function(_dd,_de,_df){
with(_dd){
return _dd;
}
}),new objj_method(sel_getUid("addObject:"),function(_e0,_e1,_e2){
with(_e0){
push(_e2);
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_e3,_e4,_e5){
with(_e3){
splice.apply(_e3,[length,0].concat(_e5));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_e6,_e7,_e8,_e9){
with(_e6){
splice(_e9,0,_e8);
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_ea,_eb,_ec,_ed){
with(_ea){
var _ee=objj_msgSend(_ed,"count"),_ef=objj_msgSend(_ec,"count");
if(_ee!==_ef){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the counts of the passed-in array ("+_ef+") and index set ("+_ee+") must be identical.");
}
var _f0=objj_msgSend(_ed,"lastIndex");
if(_f0>=objj_msgSend(_ea,"count")+_ee){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the last index ("+_f0+") must be less than the sum of the original count ("+objj_msgSend(_ea,"count")+") and the insertion count ("+_ee+").");
}
var _f1=0,_f2=objj_msgSend(_ed,"firstIndex");
for(;_f1<_ef;++_f1,_f2=objj_msgSend(_ed,"indexGreaterThanIndex:",_f2)){
objj_msgSend(_ea,"insertObject:atIndex:",_ec[_f1],_f2);
}
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_f3,_f4,_f5,_f6){
with(_f3){
_f3[_f5]=_f6;
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_f7,_f8,_f9,_fa){
with(_f7){
var i=0,_fc=objj_msgSend(_f9,"firstIndex");
while(_fc!=CPNotFound){
objj_msgSend(_f7,"replaceObjectAtIndex:withObject:",_fc,_fa[i++]);
_fc=objj_msgSend(_f9,"indexGreaterThanIndex:",_fc);
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"),function(_fd,_fe,_ff,_100,_101){
with(_fd){
if(!_101.location&&_101.length==objj_msgSend(_100,"count")){
objj_msgSend(_fd,"replaceObjectsInRange:withObjectsFromArray:",_ff,_100);
}else{
splice.apply(_fd,[_ff.location,_ff.length].concat(objj_msgSend(_100,"subarrayWithRange:",_101)));
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"),function(self,_cmd,_104,_105){
with(self){
splice.apply(self,[_104.location,_104.length].concat(_105));
}
}),new objj_method(sel_getUid("setArray:"),function(self,_cmd,_108){
with(self){
if(self==_108){
return;
}
splice.apply(self,[0,length].concat(_108));
}
}),new objj_method(sel_getUid("removeAllObjects"),function(self,_cmd){
with(self){
splice(0,length);
}
}),new objj_method(sel_getUid("removeLastObject"),function(self,_cmd){
with(self){
pop();
}
}),new objj_method(sel_getUid("removeObject:"),function(self,_cmd,_10f){
with(self){
objj_msgSend(self,"removeObject:inRange:",_10f,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(self,_cmd,_112,_113){
with(self){
var _114;
while((_114=objj_msgSend(self,"indexOfObject:inRange:",_112,_113))!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_114);
_113=CPIntersectionRange(CPMakeRange(_114,length-_114),_113);
}
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(self,_cmd,_117){
with(self){
splice(_117,1);
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(self,_cmd,_11a){
with(self){
var _11b=objj_msgSend(_11a,"lastIndex");
while(_11b!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_11b);
_11b=objj_msgSend(_11a,"indexLessThanIndex:",_11b);
}
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:"),function(self,_cmd,_11e){
with(self){
objj_msgSend(self,"removeObjectIdenticalTo:inRange:",_11e,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"),function(self,_cmd,_121,_122){
with(self){
var _123;
while((_123=objj_msgSend(self,"indexOfObjectIdenticalTo:inRange:",_121,_122))!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_123);
_122=CPIntersectionRange(CPMakeRange(_123,length-_123),_122);
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(self,_cmd,_126){
with(self){
var _127=0,_128=objj_msgSend(_126,"count");
for(;_127<_128;++_127){
objj_msgSend(self,"removeObject:",_126[_127]);
}
}
}),new objj_method(sel_getUid("removeObjectsInRange:"),function(self,_cmd,_12b){
with(self){
splice(_12b.location,_12b.length);
}
}),new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"),function(self,_cmd,_12e,_12f){
with(self){
var _130=self[_12e];
self[_12e]=self[_12f];
self[_12f]=_130;
}
}),new objj_method(sel_getUid("sortUsingDescriptors:"),function(self,_cmd,_133){
with(self){
sort(function(lhs,rhs){
var i=0,_137=objj_msgSend(_133,"count"),_138=CPOrderedSame;
while(i<_137){
if((_138=objj_msgSend(_133[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _138;
}
}
return _138;
});
}
}),new objj_method(sel_getUid("sortUsingFunction:context:"),function(self,_cmd,_13b,_13c){
with(self){
sort(function(lhs,rhs){
return _13b(lhs,rhs,_13c);
});
}
}),new objj_method(sel_getUid("sortUsingSelector:"),function(self,_cmd,_141){
with(self){
sort(function(lhs,rhs){
return objj_msgSend(lhs,_141,rhs);
});
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("arrayWithCapacity:"),function(self,_cmd,_146){
with(self){
return objj_msgSend(objj_msgSend(self,"alloc"),"initWithCapacity:",_146);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_149){
with(self){
return objj_msgSend(_149,"decodeObjectForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_14c){
with(self){
objj_msgSend(_14c,"_encodeArrayOfObjects:forKey:",self,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPArray,"CPMutableArray"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
Array.prototype.isa=CPArray;
objj_msgSend(CPArray,"initialize");
