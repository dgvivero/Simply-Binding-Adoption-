I;25;Foundation/CPDictionary.ji;14;CPController.jc;25565;


{var the_class = objj_allocateClassPair(CPController, "CPObjectController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentObject"), new objj_ivar("_selection"), new objj_ivar("_objectClass"), new objj_ivar("_isEditable"), new objj_ivar("_automaticallyPreparesContent"), new objj_ivar("_observedKeys")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContent:"), function $CPObjectController__initWithContent_(self, _cmd, aContent)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPController") }, "init");

    if (self)
    {
        objj_msgSend(self, "setContent:", aContent);
        objj_msgSend(self, "setEditable:", YES);
        objj_msgSend(self, "setObjectClass:", objj_msgSend(CPMutableDictionary, "class"));
    }

    return self;
}
},["id","id"]), new objj_method(sel_getUid("content"), function $CPObjectController__content(self, _cmd)
{ with(self)
{
    return _contentObject;
}
},["id"]), new objj_method(sel_getUid("setContent:"), function $CPObjectController__setContent_(self, _cmd, aContent)
{ with(self)
{
    objj_msgSend(self, "willChangeValueForKey:", "contentObject");
    objj_msgSend(self, "_selectionWillChange");

    _contentObject = aContent;

    objj_msgSend(self, "didChangeValueForKey:", "contentObject");
    objj_msgSend(self, "_selectionDidChange");
}
},["void","id"]), new objj_method(sel_getUid("_setContentObject:"), function $CPObjectController___setContentObject_(self, _cmd, aContent)
{ with(self)
{
    objj_msgSend(self, "setContent:", aContent);
}
},["void","id"]), new objj_method(sel_getUid("_contentObject"), function $CPObjectController___contentObject(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "content");
}
},["id"]), new objj_method(sel_getUid("setAutomaticallyPreparesContent:"), function $CPObjectController__setAutomaticallyPreparesContent_(self, _cmd, shouldAutomaticallyPrepareContent)
{ with(self)
{
    _automaticallyPreparesContent = shouldAutomaticallyPrepareContent;
}
},["void","BOOL"]), new objj_method(sel_getUid("automaticallyPreparesContent"), function $CPObjectController__automaticallyPreparesContent(self, _cmd)
{ with(self)
{
    return _automaticallyPreparesContent;
}
},["BOOL"]), new objj_method(sel_getUid("prepareContent"), function $CPObjectController__prepareContent(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setContent:", objj_msgSend(self, "newObject"));
}
},["void"]), new objj_method(sel_getUid("setObjectClass:"), function $CPObjectController__setObjectClass_(self, _cmd, aClass)
{ with(self)
{
    _objectClass = aClass;
}
},["void","Class"]), new objj_method(sel_getUid("objectClass"), function $CPObjectController__objectClass(self, _cmd)
{ with(self)
{
    return _objectClass;
}
},["Class"]), new objj_method(sel_getUid("newObject"), function $CPObjectController__newObject(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "objectClass"), "alloc"), "init");
}
},["id"]), new objj_method(sel_getUid("addObject:"), function $CPObjectController__addObject_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setContent:", anObject);

    objj_msgSend(objj_msgSend(CPKeyValueBinding, "getBinding:forObject:", "contentObject", self), "reverseSetValueFor:", "contentObject");
}
},["void","id"]), new objj_method(sel_getUid("removeObject:"), function $CPObjectController__removeObject_(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(self, "content") === anObject)
        objj_msgSend(self, "setContent:", nil);

    objj_msgSend(objj_msgSend(CPKeyValueBinding, "getBinding:forObject:", "contentObject", self), "reverseSetValueFor:", "contentObject");
}
},["void","id"]), new objj_method(sel_getUid("add:"), function $CPObjectController__add_(self, _cmd, aSender)
{ with(self)
{

    objj_msgSend(self, "addObject:", objj_msgSend(self, "newObject"));
}
},["void","id"]), new objj_method(sel_getUid("canAdd"), function $CPObjectController__canAdd(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "isEditable");
}
},["BOOL"]), new objj_method(sel_getUid("remove:"), function $CPObjectController__remove_(self, _cmd, aSender)
{ with(self)
{

    objj_msgSend(self, "removeObject:", objj_msgSend(self, "content"));
}
},["void","id"]), new objj_method(sel_getUid("canRemove"), function $CPObjectController__canRemove(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "isEditable") && objj_msgSend(objj_msgSend(self, "selectedObjects"), "count");
}
},["BOOL"]), new objj_method(sel_getUid("setEditable:"), function $CPObjectController__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    _isEditable = shouldBeEditable;
}
},["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPObjectController__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
},["BOOL"]), new objj_method(sel_getUid("selectedObjects"), function $CPObjectController__selectedObjects(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPObservableArray, "alloc"), "initWithObjects:count:", [_contentObject], 1);
}
},["CPArray"]), new objj_method(sel_getUid("selection"), function $CPObjectController__selection(self, _cmd)
{ with(self)
{
    return _selection;
}
},["id"]), new objj_method(sel_getUid("_selectionWillChange"), function $CPObjectController___selectionWillChange(self, _cmd)
{ with(self)
{
    objj_msgSend(_selection, "controllerWillChange");
    objj_msgSend(self, "willChangeValueForKey:", "selection");
}
},["void"]), new objj_method(sel_getUid("_selectionDidChange"), function $CPObjectController___selectionDidChange(self, _cmd)
{ with(self)
{
    if (_selection === undefined || _selection === nil)
        _selection = objj_msgSend(objj_msgSend(CPControllerSelectionProxy, "alloc"), "initWithController:", self);

    objj_msgSend(_selection, "controllerDidChange");
    objj_msgSend(self, "didChangeValueForKey:", "selection");
}
},["void"]), new objj_method(sel_getUid("observedKeys"), function $CPObjectController__observedKeys(self, _cmd)
{ with(self)
{
    return _observedKeys;
}
},["id"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPObjectController__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aKeyPath, options, context)
{ with(self)
{
   objj_msgSend(_observedKeys, "addObject:", aKeyPath);
   objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPController") }, "addObserver:forKeyPath:options:context:", anObserver, aKeyPath, options, context);
}
},["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPObjectController__removeObserver_forKeyPath_(self, _cmd, anObserver, aKeyPath)
{ with(self)
{
   objj_msgSend(_observedKeys, "removeObject:", aKeyPath);
   objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPController") }, "removeObserver:forKeyPath:", anObserver, aKeyPath);
}
},["void","id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPObjectController__initialize(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "exposeBinding:", "editable");
    objj_msgSend(self, "exposeBinding:", "contentObject");
}
},["id"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForContentObject"), function $CPObjectController__keyPathsForValuesAffectingValueForContentObject(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "content");
}
},["CPSet"]), new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"), function $CPObjectController__automaticallyNotifiesObserversForKey_(self, _cmd, aKey)
{ with(self)
{
    if (aKey === "contentObject")
        return NO;

    return YES;
}
},["BOOL","CPString"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanAdd"), function $CPObjectController__keyPathsForValuesAffectingValueForCanAdd(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObject:", "editable");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanInsert"), function $CPObjectController__keyPathsForValuesAffectingValueForCanInsert(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObject:", "editable");
}
},["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForCanRemove"), function $CPObjectController__keyPathsForValuesAffectingValueForCanRemove(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPSet, "setWithObjects:", "editable", "selection");
}
},["CPSet"])]);
}

var CPObjectControllerObjectClassNameKey = "CPObjectControllerObjectClassNameKey",
    CPObjectControllerIsEditableKey = "CPObjectControllerIsEditableKey",
    CPObjectControllerAutomaticallyPreparesContentKey = "CPObjectControllerAutomaticallyPreparesContentKey";

{
var the_class = objj_getClass("CPObjectController")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObjectController\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPObjectController__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPController") }, "init");

    if (self)
    {
        var objectClassName = objj_msgSend(aCoder, "decodeObjectForKey:", CPObjectControllerObjectClassNameKey),
            objectClass = CPClassFromString(objectClassName);



        objj_msgSend(self, "setObjectClass:", objectClass);
        objj_msgSend(self, "setEditable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPObjectControllerIsEditableKey));
        objj_msgSend(self, "setAutomaticallyPreparesContent:", objj_msgSend(aCoder, "decodeBoolForKey:", CPObjectControllerAutomaticallyPreparesContentKey) || NO);

        _observedKeys = objj_msgSend(objj_msgSend(CPCountedSet, "alloc"), "init");
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPObjectController__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", CPStringFromClass(objectClass), CPObjectControllerObjectClassNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "isEditable"), CPObjectControllerIsEditableKey);

    if (!objj_msgSend(self, "automaticallyPreparesContent"))
        objj_msgSend(aCoder, "encodeBOOL:forKey:", YES, CPObjectControllerAutomaticallyPreparesContentKey);
}
},["void","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "_CPObservationProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPath"), new objj_ivar("_observer"), new objj_ivar("_object"), new objj_ivar("_notifyObject"), new objj_ivar("_context"), new objj_ivar("_options")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKeyPath:observer:object:"), function $_CPObservationProxy__initWithKeyPath_observer_object_(self, _cmd, aKeyPath, anObserver, anObject)
{ with(self)
{
    if (self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _keyPath = aKeyPath;
        _observer = anObserver;
        _object = anObject;
    }

    return self;
}
},["id","id","id","id"]), new objj_method(sel_getUid("observer"), function $_CPObservationProxy__observer(self, _cmd)
{ with(self)
{
    return _observer;
}
},["id"]), new objj_method(sel_getUid("keyPath"), function $_CPObservationProxy__keyPath(self, _cmd)
{ with(self)
{
    return _keyPath;
}
},["id"]), new objj_method(sel_getUid("context"), function $_CPObservationProxy__context(self, _cmd)
{ with(self)
{
   return _context;
}
},["id"]), new objj_method(sel_getUid("options"), function $_CPObservationProxy__options(self, _cmd)
{ with(self)
{
   return _options;
}
},["int"]), new objj_method(sel_getUid("setNotifyObject:"), function $_CPObservationProxy__setNotifyObject_(self, _cmd, notify)
{ with(self)
{
   _notifyObject = notify;
}
},["void","BOOL"]), new objj_method(sel_getUid("isEqual:"), function $_CPObservationProxy__isEqual_(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(anObject, "class") === objj_msgSend(self, "class"))
    {
        if (anObject._observer === _observer && objj_msgSend(anObject._keyPath, "isEqual:", _keyPath) && objj_msgSend(anObject._object, "isEqual:", _object))
            return YES;
    }

    return NO;
}
},["BOOL","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPObservationProxy__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, change, context)
{ with(self)
{
    if (_notifyObject)
        objj_msgSend(_object, "observeValueForKeyPath:ofObject:change:context:", _keyPath, _object, change, context);

    objj_msgSend(_observer, "observeValueForKeyPath:ofObject:change:context:", _keyPath, _object, change, context);
}
},["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("description"), function $_CPObservationProxy__description(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description") + objj_msgSend(CPString, "stringWithFormat:", "observation proxy for %@ on key path %@", _observer, _keyPath);
}
},["CPString"])]);
}

{var the_class = objj_allocateClassPair(CPMutableArray, "_CPObservableArray"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_observationProxies")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("description"), function $_CPObservableArray__description(self, _cmd)
{ with(self)
{
    return "<_CPObservableArray: "+objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableArray") }, "description")+" >";
}
},["CPString"]), new objj_method(sel_getUid("initWithObjects:count:"), function $_CPObservableArray__initWithObjects_count_(self, _cmd, objects, count)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableArray") }, "initWithObjects:count:", objects, count))
    {
        _observationProxies = [];
    }

    return self;
}
},["id","CPArray","unsigned"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $_CPObservableArray__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aKeyPath, options, context)
{ with(self)
{
    if (aKeyPath.indexOf("@") === 0)
    {
        var proxy = objj_msgSend(objj_msgSend(_CPObservationProxy, "alloc"), "initWithKeyPath:observer:object:", aKeyPath, anObserver, self);

        proxy._options = options;
        proxy._context = context;

        objj_msgSend(_observationProxies, "addObject:", proxy);

        var dotIndex = aKeyPath.indexOf("."),
            remaining = aKeyPath.substring(dotIndex+1),
            indexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "count")));

        objj_msgSend(self, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", proxy, indexes, remaining, options, context);
    }
    else
    {
        var indexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "count")));
        objj_msgSend(self, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", anObserver, indexes, aKeyPath, options, context);
    }
}
},["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $_CPObservableArray__removeObserver_forKeyPath_(self, _cmd, anObserver, aKeyPath)
{ with(self)
{
    if (aKeyPath.indexOf("@") === 0)
    {
        var proxy = objj_msgSend(objj_msgSend(_CPObservationProxy, "alloc"), "initWithKeyPath:observer:object:", aKeyPath, anObserver, self),
            index = objj_msgSend(_observationProxies, "indexOfObject:", proxy);

        proxy = objj_msgSend(_observationProxies, "objectAtIndex:", index);

        var dotIndex = aKeyPath.indexOf("."),
            remaining = aKeyPath.substring(dotIndex+1),
            indexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "count")));

        objj_msgSend(self, "removeObserver:fromObjectsAtIndexes:forKeyPath:", proxy, indexes, remaining);
    }
    else
    {
        var indexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "count")));
        objj_msgSend(self, "removeObserver:fromObjectsAtIndexes:forKeyPath:", observer, indexes, aKeyPath);
    }
}
},["void","id","CPString"]), new objj_method(sel_getUid("insertObject:atIndex:"), function $_CPObservableArray__insertObject_atIndex_(self, _cmd, anObject, anIndex)
{ with(self)
{
    for (var i=0, count=objj_msgSend(_observationProxies, "count"); i<count; i++)
    {
        var proxy = objj_msgSend(_observationProxies, "objectAtIndex:", i),
            keyPath = objj_msgSend(proxy, "keyPath"),
            operator = keyPath.indexOf(".") === 0;

        if (operator)
            objj_msgSend(self, "willChangeValueForKey:", keyPath);

        objj_msgSend(anObject, "addObserver:forKeyPath:options:context:", proxy, keyPath, objj_msgSend(proxy, "options"), objj_msgSend(proxy, "context"));

        if (operator)
            objj_msgSend(self, "didChangeValueForKey:", keyPath);
    }

    objj_msgSend(self, "insertObject:atIndex:", anObject, anIndex);
}
},["void","id","unsigned"]), new objj_method(sel_getUid("removeObjectAtIndex:"), function $_CPObservableArray__removeObjectAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    for (var i=0, count=objj_msgSend(_observationProxies, "count"); i<count; i++)
    {
        var proxy = objj_msgSend(_observationProxies, "objectAtIndex:", i),
            keyPath = objj_msgSend(proxy, "keyPath"),
            operator = keyPath.indexOf(".") === 0;

        if (operator)
            objj_msgSend(self, "willChangeValueForKey:", keyPath);

        objj_msgSend(anObject, "removeObserver:forKeyPath:", proxy, keyPath);

        if (operator)
            objj_msgSend(self, "didChangeValueForKey:", keyPath);
    }

    objj_msgSend(self, "removeObjectAtIndex:", anIndex);
}
},["void","unsigned"]), new objj_method(sel_getUid("addObject:"), function $_CPObservableArray__addObject_(self, _cmd, anObject)
{ with(self)
{
   objj_msgSend(self, "insertObject:atIndex:", anObject, objj_msgSend(self, "count"));
}
},["void","id"]), new objj_method(sel_getUid("removeLastObject"), function $_CPObservableArray__removeLastObject(self, _cmd)
{ with(self)
{
   objj_msgSend(self, "removeObjectAtIndex:", objj_msgSend(self, "count"));
}
},["void"]), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function $_CPObservableArray__replaceObjectAtIndex_withObject_(self, _cmd, anIndex, anObject)
{ with(self)
{
    var currentObject = objj_msgSend(self, "objectAtIndex:", anIndex);

    for (var i=0, count=objj_msgSend(_observationProxies, "count"); i<count; i++)
    {
        var proxy = objj_msgSend(_observationProxies, "objectAtIndex:", i),
            keyPath = objj_msgSend(proxy, "keyPath"),
            operator = keyPath.indexOf(".") === 0;

        if (operator)
            objj_msgSend(self, "willChangeValueForKey:", keyPath);

        objj_msgSend(currentObject, "removeObserver:forKeyPath:", proxy, keyPath);
        objj_msgSend(anObject, "addObserver:forKeyPath:options:context:", proxy, keyPath, objj_msgSend(proxy, "options"), objj_msgSend(proxy, "context"));

        if (operator)
            objj_msgSend(self, "didChangeValueForKey:", keyPath);
    }

    objj_msgSend(self, "replaceObjectAtIndex:withObject:", anIndex, anObject);
}
},["void","unsigned","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $_CPObservableArray__alloc(self, _cmd)
{ with(self)
{
    var a = [];
    a.isa = self;

    var ivars = class_copyIvarList(self),
        count = ivars.length;

    while (count--)
        a[ivar_getName(ivars[count])] = nil;

    return a;
}
},["id"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "CPControllerSelectionProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controller"), new objj_ivar("_keys"), new objj_ivar("_cachedValues"), new objj_ivar("_observationProxies")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithController:"), function $CPControllerSelectionProxy__initWithController_(self, _cmd, aController)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _cachedValues = objj_msgSend(CPDictionary, "dictionary");
        _observationProxies = objj_msgSend(CPArray, "array");
        _controller = aController;
    }

    return self;
}
},["id","id"]), new objj_method(sel_getUid("valueForKey:"), function $CPControllerSelectionProxy__valueForKey_(self, _cmd, aKey)
{ with(self)
{
    var value = objj_msgSend(_cachedValues, "objectForKey:", aKey);

    if (value !== undefined && value !== nil)
        return value;

    var allValues = objj_msgSend(objj_msgSend(_controller, "selectedObjects"), "valueForKeyPath:", aKey),
        count = objj_msgSend(allValues, "count");

    if (!count)
        value = CPNoSelectionMarker;
    else if (count === 1)
        value = objj_msgSend(allValues, "objectAtIndex:", 0);
    else
    {
        if (objj_msgSend(_controller, "alwaysUsesMultipleValuesMarker"))
            value = CPMultipleValuesMarker;
        else
        {
            value = objj_msgSend(allValues, "objectAtIndex:", 0);

            for (var i=0, count=objj_msgSend(allValues, "count"); i<count && value!=CPMultipleValuesMarker; i++)
            {
                if (!objj_msgSend(values, "isEqual:", objj_msgSend(allValues, "objectAtIndex:", i)))
                    value = CPMultipleValuesMarker;
            }
        }
    }

    objj_msgSend(_cachedValues, "setValue:forKey:", value, aKey);

    return value;
}
},["id","CPString"]), new objj_method(sel_getUid("count"), function $CPControllerSelectionProxy__count(self, _cmd)
{ with(self)
{
    return objj_msgSend(_cachedValues, "count");
}
},["unsigned"]), new objj_method(sel_getUid("keyEnumerator"), function $CPControllerSelectionProxy__keyEnumerator(self, _cmd)
{ with(self)
{
    return objj_msgSend(_cachedValues, "keyEnumerator");
}
},["id"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPControllerSelectionProxy__setValue_forKey_(self, _cmd, aValue, aKey)
{ with(self)
{
    objj_msgSend(objj_msgSend(_controller, "selectedObjects"), "setValue:forKey:", aValue, aKey);
}
},["void","id","CPString"]), new objj_method(sel_getUid("controllerWillChange"), function $CPControllerSelectionProxy__controllerWillChange(self, _cmd)
{ with(self)
{
    _keys = objj_msgSend(_cachedValues, "allKeys");

    if (!_keys)
        return;

    for (var i=0, count=_keys.length; i<count; i++)
        objj_msgSend(self, "willChangeValueForKey:", _keys[i]);

    objj_msgSend(_cachedValues, "removeAllObjects");
}
},["void"]), new objj_method(sel_getUid("controllerDidChange"), function $CPControllerSelectionProxy__controllerDidChange(self, _cmd)
{ with(self)
{
    objj_msgSend(_cachedValues, "removeAllObjects");

    if (!_keys)
        return;

    for (var i=0, count=_keys.length; i<count; i++)
        objj_msgSend(self, "didChangeValueForKey:", _keys[i]);

   _keys = nil;
}
},["void"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPControllerSelectionProxy__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, change, context)
{ with(self)
{
    objj_msgSend(_cachedValues, "removeObjectForKey:", aKeyPath);
}
},["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPControllerSelectionProxy__addObserver_forKeyPath_options_context_(self, _cmd, anObject, aKeyPath, options, context)
{ with(self)
{
    var proxy = objj_msgSend(objj_msgSend(_CPObservationProxy, "alloc"), "initWithKeyPath:observer:object:", aKeyPath, anObject, self);

    objj_msgSend(proxy, "setNotifyObject:", YES);
    objj_msgSend(_observationProxies, "addObject:", proxy);

    objj_msgSend(objj_msgSend(_controller, "selectedObjects"), "addObserver:forKeyPath:options:context:", proxy, aKeyPath, options, context);
}
},["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPControllerSelectionProxy__removeObserver_forKeyPath_(self, _cmd, anObject, aKeyPath)
{ with(self)
{
    var proxy = objj_msgSend(objj_msgSend(_CPObservationProxy, "alloc"), "initWithKeyPath:observer:object:", aKeyPath, anObject, self),
        index = objj_msgSend(_observationProxies, "indexOfObject:", proxy);

    objj_msgSend(objj_msgSend(_controller, "selectedObjects"), "removeObserver:forKeyPath:", objj_msgSend(_observationProxies, "objectAtIndex:", index), aKeyPath);
    objj_msgSend(_observationProxies, "removeObjectAtIndex:", index);
}
},["void","id","CPString"])]);
}

