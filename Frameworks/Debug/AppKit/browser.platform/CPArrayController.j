I;27;AppKit/CPObjectController.jI;26;AppKit/CPKeyValueBinding.jc;18646;
{var the_class = objj_allocateClassPair(CPObjectController, "CPArrayController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_avoidsEmptySelection"), new objj_ivar("_clearsFilterPredicateOnInsertion"), new objj_ivar("_filterRestrictsInsertion"), new objj_ivar("_preservesSelection"), new objj_ivar("_selectsInsertedObjects"), new objj_ivar("_alwaysUsesMultipleValuesMarker"), new objj_ivar("_selectionIndexes"), new objj_ivar("_sortDescriptors"), new objj_ivar("_filterPredicate"), new objj_ivar("_arrangedObjects")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("prepareContent"), function $CPArrayController__prepareContent(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_setContentArray:", [objj_msgSend(self, "newObject")]);
}
},["void"]), new objj_method(sel_getUid("preservesSelection"), function $CPArrayController__preservesSelection(self, _cmd)
{ with(self)
{
    return _preservesSelection;
}
},["BOOL"]), new objj_method(sel_getUid("setPreservesSelection:"), function $CPArrayController__setPreservesSelection_(self, _cmd, value)
{ with(self)
{
    _preservesSelection = value;
}
},["void","BOOL"]), new objj_method(sel_getUid("selectsInsertedObjects"), function $CPArrayController__selectsInsertedObjects(self, _cmd)
{ with(self)
{
    return _selectsInsertedObjects;
}
},["BOOL"]), new objj_method(sel_getUid("setSelectsInsertedObjects:"), function $CPArrayController__setSelectsInsertedObjects_(self, _cmd, value)
{ with(self)
{
    _selectsInsertedObjects = value;
}
},["void","BOOL"]), new objj_method(sel_getUid("avoidsEmptySelection"), function $CPArrayController__avoidsEmptySelection(self, _cmd)
{ with(self)
{
    return _avoidsEmptySelection;
}
},["BOOL"]), new objj_method(sel_getUid("setAvoidsEmptySelection:"), function $CPArrayController__setAvoidsEmptySelection_(self, _cmd, value)
{ with(self)
{
    _avoidsEmptySelection = value;
}
},["void","BOOL"]), new objj_method(sel_getUid("setContent:"), function $CPArrayController__setContent_(self, _cmd, value)
{ with(self)
{
    if(!objj_msgSend(value, "isKindOfClass:", objj_msgSend(CPArray, "class")))
        value = [value];
    var oldSelection = nil,
        oldSelectionIndexes = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "copy");
    if (objj_msgSend(self, "preservesSelection"))
        oldSelection = objj_msgSend(self, "selectedObjects");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObjectController") }, "setContent:", value);
    if(_clearsFilterPredicateOnInsertion)
        objj_msgSend(self, "setFilterPredicate:", nil);
    objj_msgSend(self, "rearrangeObjects");
    if (oldSelection)
        objj_msgSend(self, "setSelectedObjects:", oldSelection);
    else
        objj_msgSend(self, "setSelectionIndexes:", oldSelectionIndexes);
}
},["void","id"]), new objj_method(sel_getUid("_setContentArray:"), function $CPArrayController___setContentArray_(self, _cmd, anArray)
{ with(self)
{
   objj_msgSend(self, "setContent:", anArray);
}
},["void","id"]), new objj_method(sel_getUid("_setContentSet:"), function $CPArrayController___setContentSet_(self, _cmd, aSet)
{ with(self)
{
    objj_msgSend(self, "setContent:", aSet);
}
},["void","id"]), new objj_method(sel_getUid("contentArray"), function $CPArrayController__contentArray(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "content");
}
},["id"]), new objj_method(sel_getUid("contentSet"), function $CPArrayController__contentSet(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "content");
}
},["id"]), new objj_method(sel_getUid("arrangeObjects:"), function $CPArrayController__arrangeObjects_(self, _cmd, objects)
{ with(self)
{
    var sortedObjects = objects;
    if (objj_msgSend(self, "filterPredicate"))
        sortedObjects = objj_msgSend(sortedObjects, "filteredArrayUsingPredicate:", objj_msgSend(self, "filterPredicate"));
    if (objj_msgSend(self, "sortDescriptors"))
        sortedObjects = objj_msgSend(sortedObjects, "sortedArrayUsingDescriptors:", objj_msgSend(self, "sortDescriptors"));
    return sortedObjects;
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("rearrangeObjects"), function $CPArrayController__rearrangeObjects(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_setArrangedObjects:", objj_msgSend(self, "arrangeObjects:", objj_msgSend(self, "contentArray")));
}
},["void"]), new objj_method(sel_getUid("_setArrangedObjects:"), function $CPArrayController___setArrangedObjects_(self, _cmd, value)
{ with(self)
{
    if (_arrangedObjects === value)
        return;
   _arrangedObjects = objj_msgSend(objj_msgSend(_CPObservableArray, "alloc"), "initWithArray:", value);
}
},["void","id"]), new objj_method(sel_getUid("arrangedObjects"), function $CPArrayController__arrangedObjects(self, _cmd)
{ with(self)
{
    return _arrangedObjects;
}
},["id"]), new objj_method(sel_getUid("sortDescriptors"), function $CPArrayController__sortDescriptors(self, _cmd)
{ with(self)
{
    return _sortDescriptors;
}
},["CPArray"]), new objj_method(sel_getUid("setSortDescriptors:"), function $CPArrayController__setSortDescriptors_(self, _cmd, value)
{ with(self)
{
    if (_sortDescriptors === value)
        return;
    _sortDescriptors = objj_msgSend(value, "copy");
    objj_msgSend(self, "rearrangeObjects");
}
},["void","CPArray"]), new objj_method(sel_getUid("filterPredicate"), function $CPArrayController__filterPredicate(self, _cmd)
{ with(self)
{
    return _filterPredicate;
}
},["CPPredicate"]), new objj_method(sel_getUid("setFilterPredicate:"), function $CPArrayController__setFilterPredicate_(self, _cmd, value)
{ with(self)
{
    if (_filterPredicate === value)
        return;
    _filterPredicate = value;
    objj_msgSend(self, "rearrangeObjects");
}
},["void","CPPredicate"]), new objj_method(sel_getUid("alwaysUsesMultipleValuesMarker"), function $CPArrayController__alwaysUsesMultipleValuesMarker(self, _cmd)
{ with(self)
{
    return _alwaysUsesMultipleValuesMarker;
}
},["BOOL"]), new objj_method(sel_getUid("selectionIndex"), function $CPArrayController__selectionIndex(self, _cmd)
{ with(self)
{
    return objj_msgSend(_selectionIndexes, "firstIndex");
}
},["unsigned"]), new objj_method(sel_getUid("setSelectionIndex:"), function $CPArrayController__setSelectionIndex_(self, _cmd, index)
{ with(self)
{
    return objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
},["BOOL","unsigned"]), new objj_method(sel_getUid("selectionIndexes"), function $CPArrayController__selectionIndexes(self, _cmd)
{ with(self)
{
    return _selectionIndexes;
}
},["CPIndexSet"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $CPArrayController__setSelectionIndexes_(self, _cmd, indexes)
{ with(self)
{
    if (objj_msgSend(_selectionIndexes, "isEqual:", indexes))
        return NO;
    if(!objj_msgSend(indexes, "count") && _avoidsEmptySelection && objj_msgSend(objj_msgSend(self, "arrangedObjects"), "count"))
        indexes = objj_msgSend(CPIndexSet, "indexSetWithIndex:", 0);
    objj_msgSend(indexes, "removeIndexesInRange:", CPMakeRange(objj_msgSend(objj_msgSend(self, "arrangedObjects"), "count")+1, CPNotFound));
    objj_msgSend(self, "willChangeValueForKey:", "selectionIndexes");
    objj_msgSend(self, "_selectionWillChange");
    _selectionIndexes = objj_msgSend(indexes, "copy");
    objj_msgSend(self, "_selectionDidChange");
    objj_msgSend(self, "didChangeValueForKey:", "selectionIndexes");
    return YES;
}
},["BOOL","CPIndexSet"]), new objj_method(sel_getUid("selectedObjects"), function $CPArrayController__selectedObjects(self, _cmd)
{ with(self)
{
    var objects = objj_msgSend(objj_msgSend(self, "arrangedObjects"), "objectsAtIndexes:", objj_msgSend(self, "selectionIndexes"));
    return objects || objj_msgSend(_CPObservableArray, "array");
}
},["CPArray"]), new objj_method(sel_getUid("setSelectedObjects:"), function $CPArrayController__setSelectedObjects_(self, _cmd, objects)
{ with(self)
{
    var set = objj_msgSend(CPIndexSet, "indexSet"),
        count = objj_msgSend(objects, "count"),
        arrangedObjects = objj_msgSend(self, "arrangedObjects");
    for (var i=0; i<count; i++)
    {
        var index = objj_msgSend(arrangedObjects, "indexOfObject:", objj_msgSend(objects, "objectAtIndex:", i));
        if (index !== CPNotFound)
            objj_msgSend(set, "addIndex:", index);
    }
    objj_msgSend(self, "setSelectionIndexes:", set);
    return YES;
}
},["BOOL","CPArray"]), new objj_method(sel_getUid("canSelectPrevious"), function $CPArrayController__canSelectPrevious(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex") > 0
}
},["BOOL"]), new objj_method(sel_getUid("canSelectNext"), function $CPArrayController__canSelectNext(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex") < objj_msgSend(objj_msgSend(self, "arrangedObjects"), "count") -1;
}
},["BOOL"]), new objj_method(sel_getUid("selectNext:"), function $CPArrayController__selectNext_(self, _cmd, sender)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex") + 1 || 0;
    if (index < objj_msgSend(objj_msgSend(self, "arrangedObjects"), "count"))
        objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
},["void","id"]), new objj_method(sel_getUid("selectPrevious:"), function $CPArrayController__selectPrevious_(self, _cmd, sender)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex") - 1 || objj_msgSend(objj_msgSend(self, "arrangedObjects"), "count") - 1;
    if (index >= 0)
        objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
},["void","id"]), new objj_method(sel_getUid("addObject:"), function $CPArrayController__addObject_(self, _cmd, object)
{ with(self)
{
    if (!objj_msgSend(self, "canAdd"))
        return;
    objj_msgSend(self, "willChangeValueForKey:", "content");
    objj_msgSend(_contentObject, "addObject:", object);
    objj_msgSend(self, "didChangeValueForKey:", "content");
    if (_clearsFilterPredicateOnInsertion)
        objj_msgSend(self, "setFilterPredicate:", nil);
    if (objj_msgSend(_filterPredicate, "evaluateWithObject:", object))
    {
        objj_msgSend(self, "willChangeValueForKey:", "selectionIndexes");
        var pos = objj_msgSend(_arrangedObjects, "insertObject:inArraySortedByDescriptors:", object, _sortDescriptors);
        objj_msgSend(_selectionIndexes, "shiftIndexesStartingAtIndex:by:", pos, 1);
        objj_msgSend(self, "didChangeValueForKey:", "selectionIndexes");
    }
    else
        objj_msgSend(self, "rearrangeObjects");
}
},["void","id"]), new objj_method(sel_getUid("removeObject:"), function $CPArrayController__removeObject_(self, _cmd, object)
{ with(self)
{
    if (!objj_msgSend(self, "canRemove"))
        return;
   objj_msgSend(self, "willChangeValueForKey:", "content");
   objj_msgSend(_contentObject, "removeObject:", object);
   objj_msgSend(self, "didChangeValueForKey:", "content");
   if (objj_msgSend(_filterPredicate, "evaluateWithObject:", object))
   {
        objj_msgSend(self, "willChangeValueForKey:", "selectionIndexes");
        var pos = objj_msgSend(_arrangedObjects, "indexOfObject:", object);
        objj_msgSend(_selectionIndexes, "shiftIndexesStartingAtIndex:by:", pos, -1);
        objj_msgSend(self, "didChangeValueForKey:", "selectionIndexes");
   }
}
},["void","id"]), new objj_method(sel_getUid("add:"), function $CPArrayController__add_(self, _cmd, sender)
{ with(self)
{
    if(!objj_msgSend(self, "canAdd"))
        return;
    objj_msgSend(self, "insert:", sender);
}
},["void","id"]), new objj_method(sel_getUid("insert:"), function $CPArrayController__insert_(self, _cmd, sender)
{ with(self)
{
    if(!objj_msgSend(self, "canInsert"))
        return;
    var newObject = objj_msgSend(self, "automaticallyPreparesContent") ? objj_msgSend(self, "newObject") : objj_msgSend(self, "_defaultNewObject");
    objj_msgSend(self, "addObject:", newObject);
}
},["void","id"]), new objj_method(sel_getUid("remove:"), function $CPArrayController__remove_(self, _cmd, sender)
{ with(self)
{
   objj_msgSend(self, "removeObjects:", objj_msgSend(objj_msgSend(self, "contentArray"), "objectsAtIndexes:", objj_msgSend(self, "selectionIndexes")));
}
},["void","id"]), new objj_method(sel_getUid("removeObjectsAtArrangedObjectIndexes:"), function $CPArrayController__removeObjectsAtArrangedObjectIndexes_(self, _cmd, indexes)
{ with(self)
{
    objj_msgSend(self, "_removeObjects:", objj_msgSend(objj_msgSend(self, "contentArray"), "objectsAtIndexes:", indexes));
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("addObjects:"), function $CPArrayController__addObjects_(self, _cmd, objects)
{ with(self)
{
    if(!objj_msgSend(self, "canAdd"))
        return;
    var contentArray = objj_msgSend(self, "contentArray"),
        count = objj_msgSend(objects, "count");
    for (var i=0; i<count; i++)
        objj_msgSend(contentArray, "addObject:", objj_msgSend(objects, "objectAtIndex:", i));
    objj_msgSend(self, "setContent:", contentArray);
}
},["void","CPArray"]), new objj_method(sel_getUid("removeObjects:"), function $CPArrayController__removeObjects_(self, _cmd, objects)
{ with(self)
{
    if(!objj_msgSend(self, "canRemove"))
        return;
    objj_msgSend(self, "_removeObjects:", objects);
}
},["void","CPArray"]), new objj_method(sel_getUid("_removeObjects:"), function $CPArrayController___removeObjects_(self, _cmd, objects)
{ with(self)
{
    var contentArray = objj_msgSend(self, "contentArray"),
        count = objj_msgSend(objects, "count");
    for (var i=0; i<count; i++)
        objj_msgSend(contentArray, "removeObject:", objj_msgSend(objects, "objectAtIndex:", i));
    objj_msgSend(self, "setContent:", contentArray);
}
},["void","CPArray"]), new objj_method(sel_getUid("canInsert"), function $CPArrayController__canInsert(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "isEditable");
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPArrayController__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPArrayController, "class"))
        return;
    objj_msgSend(self, "exposeBinding:", "contentArray");
    objj_msgSend(self, "exposeBinding:", "contentSet");
}
},["void"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForContentArray"), function $CPArrayController__keyPathsForValuesAffectingValueForContentArray(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "content");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForArrangedObjects"), function $CPArrayController__keyPathsForValuesAffectingValueForArrangedObjects(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "content", "contentArray", "contentSet", "filterPredicate", "sortDescriptors");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForSelection"), function $CPArrayController__keyPathsForValuesAffectingValueForSelection(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "content", "contentArray", "contentSet", "selectionIndexes");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForSelectionIndex"), function $CPArrayController__keyPathsForValuesAffectingValueForSelectionIndex(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "content", "contentArray", "contentSet", "selectionIndexes", "selection");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForSelectedObjects"), function $CPArrayController__keyPathsForValuesAffectingValueForSelectedObjects(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "content", "contentArray", "contentSet", "selectionIndexes", "selection");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanRemove"), function $CPArrayController__keyPathsForValuesAffectingValueForCanRemove(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "selectionIndexes");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanSelectNext"), function $CPArrayController__keyPathsForValuesAffectingValueForCanSelectNext(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "selectionIndexes");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanSelectPrevious"), function $CPArrayController__keyPathsForValuesAffectingValueForCanSelectPrevious(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "selectionIndexes");
}
},["CPSet"])]);
}
{
var the_class = objj_getClass("CPArrayController")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPArrayController\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPArrayController__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObjectController") }, "initWithCoder:", coder);
    if (self)
    {
        _avoidsEmptySelection = objj_msgSend(coder, "decodeBoolForKey:", "CPArrayControllerAvoidsEmptySelection");
        _clearsFilterPredicateOnInsertion = objj_msgSend(coder, "decodeBoolForKey:", "CPClearsFilterPredicateOnInsertion");
        _filterRestrictsInsertion = objj_msgSend(coder, "decodeBoolForKey:", "CPArrayControllerFilterRestrictsInsertion");
        _preservesSelection = objj_msgSend(coder, "decodeBoolForKey:", "CPArrayControllerPreservesSelection");
        _selectsInsertedObjects = objj_msgSend(coder, "decodeBoolForKey:", "CPArrayControllerSelectsInsertedObjects");
        _alwaysUsesMultipleValuesMarker = objj_msgSend(coder, "decodeBoolForKey:", "CPArrayControllerAlwaysUsesMultipleValuesMarker");
        if (objj_msgSend(self, "automaticallyPreparesContent"))
            objj_msgSend(self, "prepareContent");
        else
            objj_msgSend(self, "_setContentArray:", []);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("awakeFromCib"), function $CPArrayController__awakeFromCib(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_selectionWillChange");
    objj_msgSend(self, "_selectionDidChange");
}
},["void"])]);
}

