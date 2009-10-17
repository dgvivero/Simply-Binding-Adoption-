I;27;AppKit/CPObjectController.jI;26;AppKit/CPKeyValueBinding.jc;13505;
var _1=objj_allocateClassPair(CPObjectController,"CPArrayController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_avoidsEmptySelection"),new objj_ivar("_clearsFilterPredicateOnInsertion"),new objj_ivar("_filterRestrictsInsertion"),new objj_ivar("_preservesSelection"),new objj_ivar("_selectsInsertedObjects"),new objj_ivar("_alwaysUsesMultipleValuesMarker"),new objj_ivar("_selectionIndexes"),new objj_ivar("_sortDescriptors"),new objj_ivar("_filterPredicate"),new objj_ivar("_arrangedObjects")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("prepareContent"),function(_3,_4){
with(_3){
objj_msgSend(_3,"_setContentArray:",[objj_msgSend(_3,"newObject")]);
}
}),new objj_method(sel_getUid("preservesSelection"),function(_5,_6){
with(_5){
return _preservesSelection;
}
}),new objj_method(sel_getUid("setPreservesSelection:"),function(_7,_8,_9){
with(_7){
_preservesSelection=_9;
}
}),new objj_method(sel_getUid("selectsInsertedObjects"),function(_a,_b){
with(_a){
return _selectsInsertedObjects;
}
}),new objj_method(sel_getUid("setSelectsInsertedObjects:"),function(_c,_d,_e){
with(_c){
_selectsInsertedObjects=_e;
}
}),new objj_method(sel_getUid("avoidsEmptySelection"),function(_f,_10){
with(_f){
return _avoidsEmptySelection;
}
}),new objj_method(sel_getUid("setAvoidsEmptySelection:"),function(_11,_12,_13){
with(_11){
_avoidsEmptySelection=_13;
}
}),new objj_method(sel_getUid("setContent:"),function(_14,_15,_16){
with(_14){
if(!objj_msgSend(_16,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
_16=[_16];
}
var _17=nil,_18=objj_msgSend(objj_msgSend(_14,"selectionIndexes"),"copy");
if(objj_msgSend(_14,"preservesSelection")){
_17=objj_msgSend(_14,"selectedObjects");
}
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPObjectController")},"setContent:",_16);
if(_clearsFilterPredicateOnInsertion){
objj_msgSend(_14,"setFilterPredicate:",nil);
}
objj_msgSend(_14,"rearrangeObjects");
if(_17){
objj_msgSend(_14,"setSelectedObjects:",_17);
}else{
objj_msgSend(_14,"setSelectionIndexes:",_18);
}
}
}),new objj_method(sel_getUid("_setContentArray:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"setContent:",_1b);
}
}),new objj_method(sel_getUid("_setContentSet:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"setContent:",_1e);
}
}),new objj_method(sel_getUid("contentArray"),function(_1f,_20){
with(_1f){
return objj_msgSend(_1f,"content");
}
}),new objj_method(sel_getUid("contentSet"),function(_21,_22){
with(_21){
return objj_msgSend(_21,"content");
}
}),new objj_method(sel_getUid("arrangeObjects:"),function(_23,_24,_25){
with(_23){
var _26=_25;
if(objj_msgSend(_23,"filterPredicate")){
_26=objj_msgSend(_26,"filteredArrayUsingPredicate:",objj_msgSend(_23,"filterPredicate"));
}
if(objj_msgSend(_23,"sortDescriptors")){
_26=objj_msgSend(_26,"sortedArrayUsingDescriptors:",objj_msgSend(_23,"sortDescriptors"));
}
return _26;
}
}),new objj_method(sel_getUid("rearrangeObjects"),function(_27,_28){
with(_27){
objj_msgSend(_27,"_setArrangedObjects:",objj_msgSend(_27,"arrangeObjects:",objj_msgSend(_27,"contentArray")));
}
}),new objj_method(sel_getUid("_setArrangedObjects:"),function(_29,_2a,_2b){
with(_29){
if(_arrangedObjects===_2b){
return;
}
_arrangedObjects=objj_msgSend(objj_msgSend(_CPObservableArray,"alloc"),"initWithArray:",_2b);
}
}),new objj_method(sel_getUid("arrangedObjects"),function(_2c,_2d){
with(_2c){
return _arrangedObjects;
}
}),new objj_method(sel_getUid("sortDescriptors"),function(_2e,_2f){
with(_2e){
return _sortDescriptors;
}
}),new objj_method(sel_getUid("setSortDescriptors:"),function(_30,_31,_32){
with(_30){
if(_sortDescriptors===_32){
return;
}
_sortDescriptors=objj_msgSend(_32,"copy");
objj_msgSend(_30,"rearrangeObjects");
}
}),new objj_method(sel_getUid("filterPredicate"),function(_33,_34){
with(_33){
return _filterPredicate;
}
}),new objj_method(sel_getUid("setFilterPredicate:"),function(_35,_36,_37){
with(_35){
if(_filterPredicate===_37){
return;
}
_filterPredicate=_37;
objj_msgSend(_35,"rearrangeObjects");
}
}),new objj_method(sel_getUid("alwaysUsesMultipleValuesMarker"),function(_38,_39){
with(_38){
return _alwaysUsesMultipleValuesMarker;
}
}),new objj_method(sel_getUid("selectionIndex"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_selectionIndexes,"firstIndex");
}
}),new objj_method(sel_getUid("setSelectionIndex:"),function(_3c,_3d,_3e){
with(_3c){
return objj_msgSend(_3c,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_3e));
}
}),new objj_method(sel_getUid("selectionIndexes"),function(_3f,_40){
with(_3f){
return _selectionIndexes;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_41,_42,_43){
with(_41){
if(objj_msgSend(_selectionIndexes,"isEqual:",_43)){
return NO;
}
if(!objj_msgSend(_43,"count")&&_avoidsEmptySelection&&objj_msgSend(objj_msgSend(_41,"arrangedObjects"),"count")){
_43=objj_msgSend(CPIndexSet,"indexSetWithIndex:",0);
}
objj_msgSend(_43,"removeIndexesInRange:",CPMakeRange(objj_msgSend(objj_msgSend(_41,"arrangedObjects"),"count")+1,CPNotFound));
objj_msgSend(_41,"willChangeValueForKey:","selectionIndexes");
objj_msgSend(_41,"_selectionWillChange");
_selectionIndexes=objj_msgSend(_43,"copy");
objj_msgSend(_41,"_selectionDidChange");
objj_msgSend(_41,"didChangeValueForKey:","selectionIndexes");
return YES;
}
}),new objj_method(sel_getUid("selectedObjects"),function(_44,_45){
with(_44){
var _46=objj_msgSend(objj_msgSend(_44,"arrangedObjects"),"objectsAtIndexes:",objj_msgSend(_44,"selectionIndexes"));
return _46||objj_msgSend(_CPObservableArray,"array");
}
}),new objj_method(sel_getUid("setSelectedObjects:"),function(_47,_48,_49){
with(_47){
var set=objj_msgSend(CPIndexSet,"indexSet"),_4b=objj_msgSend(_49,"count"),_4c=objj_msgSend(_47,"arrangedObjects");
for(var i=0;i<_4b;i++){
var _4e=objj_msgSend(_4c,"indexOfObject:",objj_msgSend(_49,"objectAtIndex:",i));
if(_4e!==CPNotFound){
objj_msgSend(set,"addIndex:",_4e);
}
}
objj_msgSend(_47,"setSelectionIndexes:",set);
return YES;
}
}),new objj_method(sel_getUid("canSelectPrevious"),function(_4f,_50){
with(_4f){
return objj_msgSend(objj_msgSend(_4f,"selectionIndexes"),"firstIndex")>0;
}
}),new objj_method(sel_getUid("canSelectNext"),function(_51,_52){
with(_51){
return objj_msgSend(objj_msgSend(_51,"selectionIndexes"),"firstIndex")<objj_msgSend(objj_msgSend(_51,"arrangedObjects"),"count")-1;
}
}),new objj_method(sel_getUid("selectNext:"),function(_53,_54,_55){
with(_53){
var _56=objj_msgSend(objj_msgSend(_53,"selectionIndexes"),"firstIndex")+1||0;
if(_56<objj_msgSend(objj_msgSend(_53,"arrangedObjects"),"count")){
objj_msgSend(_53,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_56));
}
}
}),new objj_method(sel_getUid("selectPrevious:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(objj_msgSend(_57,"selectionIndexes"),"firstIndex")-1||objj_msgSend(objj_msgSend(_57,"arrangedObjects"),"count")-1;
if(_5a>=0){
objj_msgSend(_57,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5a));
}
}
}),new objj_method(sel_getUid("addObject:"),function(_5b,_5c,_5d){
with(_5b){
if(!objj_msgSend(_5b,"canAdd")){
return;
}
objj_msgSend(_5b,"willChangeValueForKey:","content");
objj_msgSend(_contentObject,"addObject:",_5d);
objj_msgSend(_5b,"didChangeValueForKey:","content");
if(_clearsFilterPredicateOnInsertion){
objj_msgSend(_5b,"setFilterPredicate:",nil);
}
if(objj_msgSend(_filterPredicate,"evaluateWithObject:",_5d)){
objj_msgSend(_5b,"willChangeValueForKey:","selectionIndexes");
var pos=objj_msgSend(_arrangedObjects,"insertObject:inArraySortedByDescriptors:",_5d,_sortDescriptors);
objj_msgSend(_selectionIndexes,"shiftIndexesStartingAtIndex:by:",pos,1);
objj_msgSend(_5b,"didChangeValueForKey:","selectionIndexes");
}else{
objj_msgSend(_5b,"rearrangeObjects");
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_5f,_60,_61){
with(_5f){
if(!objj_msgSend(_5f,"canRemove")){
return;
}
objj_msgSend(_5f,"willChangeValueForKey:","content");
objj_msgSend(_contentObject,"removeObject:",_61);
objj_msgSend(_5f,"didChangeValueForKey:","content");
if(objj_msgSend(_filterPredicate,"evaluateWithObject:",_61)){
objj_msgSend(_5f,"willChangeValueForKey:","selectionIndexes");
var pos=objj_msgSend(_arrangedObjects,"indexOfObject:",_61);
objj_msgSend(_selectionIndexes,"shiftIndexesStartingAtIndex:by:",pos,-1);
objj_msgSend(_5f,"didChangeValueForKey:","selectionIndexes");
}
}
}),new objj_method(sel_getUid("add:"),function(_63,_64,_65){
with(_63){
if(!objj_msgSend(_63,"canAdd")){
return;
}
objj_msgSend(_63,"insert:",_65);
}
}),new objj_method(sel_getUid("insert:"),function(_66,_67,_68){
with(_66){
if(!objj_msgSend(_66,"canInsert")){
return;
}
var _69=objj_msgSend(_66,"automaticallyPreparesContent")?objj_msgSend(_66,"newObject"):objj_msgSend(_66,"_defaultNewObject");
objj_msgSend(_66,"addObject:",_69);
}
}),new objj_method(sel_getUid("remove:"),function(_6a,_6b,_6c){
with(_6a){
objj_msgSend(_6a,"removeObjects:",objj_msgSend(objj_msgSend(_6a,"contentArray"),"objectsAtIndexes:",objj_msgSend(_6a,"selectionIndexes")));
}
}),new objj_method(sel_getUid("removeObjectsAtArrangedObjectIndexes:"),function(_6d,_6e,_6f){
with(_6d){
objj_msgSend(_6d,"_removeObjects:",objj_msgSend(objj_msgSend(_6d,"contentArray"),"objectsAtIndexes:",_6f));
}
}),new objj_method(sel_getUid("addObjects:"),function(_70,_71,_72){
with(_70){
if(!objj_msgSend(_70,"canAdd")){
return;
}
var _73=objj_msgSend(_70,"contentArray"),_74=objj_msgSend(_72,"count");
for(var i=0;i<_74;i++){
objj_msgSend(_73,"addObject:",objj_msgSend(_72,"objectAtIndex:",i));
}
objj_msgSend(_70,"setContent:",_73);
}
}),new objj_method(sel_getUid("removeObjects:"),function(_76,_77,_78){
with(_76){
if(!objj_msgSend(_76,"canRemove")){
return;
}
objj_msgSend(_76,"_removeObjects:",_78);
}
}),new objj_method(sel_getUid("_removeObjects:"),function(_79,_7a,_7b){
with(_79){
var _7c=objj_msgSend(_79,"contentArray"),_7d=objj_msgSend(_7b,"count");
for(var i=0;i<_7d;i++){
objj_msgSend(_7c,"removeObject:",objj_msgSend(_7b,"objectAtIndex:",i));
}
objj_msgSend(_79,"setContent:",_7c);
}
}),new objj_method(sel_getUid("canInsert"),function(_7f,_80){
with(_7f){
return objj_msgSend(_7f,"isEditable");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_81,_82){
with(_81){
if(_81!==objj_msgSend(CPArrayController,"class")){
return;
}
objj_msgSend(_81,"exposeBinding:","contentArray");
objj_msgSend(_81,"exposeBinding:","contentSet");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForContentArray"),function(_83,_84){
with(_83){
return objj_msgSend(CPSet,"setWithObjects:","content");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForArrangedObjects"),function(_85,_86){
with(_85){
return objj_msgSend(CPSet,"setWithObjects:","content","contentArray","contentSet","filterPredicate","sortDescriptors");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForSelection"),function(_87,_88){
with(_87){
return objj_msgSend(CPSet,"setWithObjects:","content","contentArray","contentSet","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForSelectionIndex"),function(_89,_8a){
with(_89){
return objj_msgSend(CPSet,"setWithObjects:","content","contentArray","contentSet","selectionIndexes","selection");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForSelectedObjects"),function(_8b,_8c){
with(_8b){
return objj_msgSend(CPSet,"setWithObjects:","content","contentArray","contentSet","selectionIndexes","selection");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanRemove"),function(_8d,_8e){
with(_8d){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanSelectNext"),function(_8f,_90){
with(_8f){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanSelectPrevious"),function(_91,_92){
with(_91){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
})]);
var _1=objj_getClass("CPArrayController");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArrayController\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_93,_94,_95){
with(_93){
_93=objj_msgSendSuper({receiver:_93,super_class:objj_getClass("CPObjectController")},"initWithCoder:",coder);
if(_93){
_avoidsEmptySelection=objj_msgSend(coder,"decodeBoolForKey:","CPArrayControllerAvoidsEmptySelection");
_clearsFilterPredicateOnInsertion=objj_msgSend(coder,"decodeBoolForKey:","CPClearsFilterPredicateOnInsertion");
_filterRestrictsInsertion=objj_msgSend(coder,"decodeBoolForKey:","CPArrayControllerFilterRestrictsInsertion");
_preservesSelection=objj_msgSend(coder,"decodeBoolForKey:","CPArrayControllerPreservesSelection");
_selectsInsertedObjects=objj_msgSend(coder,"decodeBoolForKey:","CPArrayControllerSelectsInsertedObjects");
_alwaysUsesMultipleValuesMarker=objj_msgSend(coder,"decodeBoolForKey:","CPArrayControllerAlwaysUsesMultipleValuesMarker");
if(objj_msgSend(_93,"automaticallyPreparesContent")){
objj_msgSend(_93,"prepareContent");
}else{
objj_msgSend(_93,"_setContentArray:",[]);
}
}
return _93;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_96,_97){
with(_96){
objj_msgSend(_96,"_selectionWillChange");
objj_msgSend(_96,"_selectionDidChange");
}
})]);
