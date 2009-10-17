I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jc;18357;
var exposedBindingsMap = objj_msgSend(CPDictionary, "new"),
    bindingsMap = objj_msgSend(CPDictionary, "new");
var CPBindingOperationAnd = 0,
    CPBindingOperationOr = 1;
{var the_class = objj_allocateClassPair(CPObject, "CPKeyValueBinding"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_info"), new objj_ivar("_source")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"), function $CPKeyValueBinding__initWithBinding_name_to_keyPath_options_from_(self, _cmd, aBinding, aName, aDestination, aKeyPath, options, aSource)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _source = aSource;
        _info = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [aDestination, aKeyPath], [CPObservedObjectKey, CPObservedKeyPathKey]);
        if (options)
            objj_msgSend(_info, "setObject:forKey:", options, CPOptionsKey);
        objj_msgSend(aDestination, "addObserver:forKeyPath:options:context:", self, aKeyPath, CPKeyValueObservingOptionNew, aBinding);
        var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(_source, "hash"));
        if (!bindings)
        {
            bindings = objj_msgSend(CPDictionary, "new");
            objj_msgSend(bindingsMap, "setObject:forKey:", bindings, objj_msgSend(_source, "hash"));
        }
        objj_msgSend(bindings, "setObject:forKey:", self, aName);
        objj_msgSend(self, "setValueFor:", aBinding);
    }
    return self;
}
},["id","CPString","CPString","id","CPString","CPDictionary","id"]), new objj_method(sel_getUid("setValueFor:"), function $CPKeyValueBinding__setValueFor_(self, _cmd, aBinding)
{ with(self)
{
    var destination = objj_msgSend(_info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(_info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(_info, "objectForKey:", CPOptionsKey),
        newValue = objj_msgSend(destination, "valueForKeyPath:", keyPath);
    newValue = objj_msgSend(self, "transformValue:withOptions:", newValue, options);
    objj_msgSend(_source, "setValue:forKey:", newValue, aBinding);
}
},["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $CPKeyValueBinding__reverseSetValueFor_(self, _cmd, aBinding)
{ with(self)
{
    var destination = objj_msgSend(_info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(_info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(_info, "objectForKey:", CPOptionsKey),
        newValue = objj_msgSend(_source, "valueForKeyPath:", aBinding);
    newValue = objj_msgSend(self, "reverseTransformValue:withOptions:", newValue, options);
    objj_msgSend(destination, "setValue:forKeyPath:", newValue, keyPath);
}
},["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPKeyValueBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{ with(self)
{
    if (!changes)
        return;
    objj_msgSend(self, "setValueFor:", context);
}
},["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("transformValue:withOptions:"), function $CPKeyValueBinding__transformValue_withOptions_(self, _cmd, aValue, options)
{ with(self)
{
    var valueTransformerName,
        valueTransformer,
        placeholder;
    switch (aValue)
    {
        case CPMultipleValuesMarker: return objj_msgSend(options, "objectForKey:", CPMultipleValuesPlaceholderBindingOption) || "Multiple Values";
        case CPNoSelectionMarker: return objj_msgSend(options, "objectForKey:", CPNoSelectionPlaceholderBindingOption) || "No Selection";
        case CPNotApplicableMarker: if (objj_msgSend(options, "objectForKey:", CPRaisesForNotApplicableKeysBindingOption))
                                            objj_msgSend(CPException, "raise:reason:", CPGenericException, "can't transform non applicable key on: "+_source+" value: "+aValue);
                                        return objj_msgSend(options, "objectForKey:", CPNotApplicablePlaceholderBindingOption) || "Not Applicable";
        case nil:
        case undefined: return objj_msgSend(options, "objectForKey:", CPNullPlaceholderBindingOption) || "";
    }
    var valueTransformerName = objj_msgSend(options, "objectForKey:", CPValueTransformerNameBindingOption),
        valueTransformer;
    if (valueTransformerName)
        valueTransformer = objj_msgSend(CPValueTransformer, "valueTransformerForName:", valueTransformerName);
    else
        valueTransformer = objj_msgSend(options, "objectForKey:", CPValueTransformerBindingOption);
    if (valueTransformer)
        aValue = objj_msgSend(valueTransformer, "transformedValue:", aValue);
    return aValue;
}
},["id","id","CPDictionary"]), new objj_method(sel_getUid("reverseTransformValue:withOptions:"), function $CPKeyValueBinding__reverseTransformValue_withOptions_(self, _cmd, aValue, options)
{ with(self)
{
    var valueTransformerName = objj_msgSend(options, "objectForKey:", CPValueTransformerNameBindingOption),
        valueTransformer;
    if (valueTransformerName)
        valueTransformer = objj_msgSend(CPValueTransformer, "valueTransformerForName:", valueTransformerName);
    else
        valueTransformer = objj_msgSend(options, "objectForKey:", CPValueTransformerBindingOption);
    if (valueTransformer && objj_msgSend(objj_msgSend(valueTransformer, "class"), "allowsReverseTransformation"))
        aValue = objj_msgSend(valueTransformer, "transformedValue:", aValue);
    return aValue;
}
},["id","id","CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:forClass:"), function $CPKeyValueBinding__exposeBinding_forClass_(self, _cmd, aBinding, aClass)
{ with(self)
{
    var bindings = objj_msgSend(exposedBindingsMap, "objectForKey:", objj_msgSend(aClass, "hash"));
    if (!bindings)
    {
        bindings = [];
        objj_msgSend(exposedBindingsMap, "setObject:forKey:", bindings, objj_msgSend(aClass, "hash"));
    }
    bindings.push(aBinding);
}
},["void","CPString","Class"]), new objj_method(sel_getUid("exposedBindingsForClass:"), function $CPKeyValueBinding__exposedBindingsForClass_(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(objj_msgSend(exposedBindingsMap, "objectForKey:", objj_msgSend(aClass, "hash")), "copy");
}
},["CPArray","Class"]), new objj_method(sel_getUid("getBinding:forObject:"), function $CPKeyValueBinding__getBinding_forObject_(self, _cmd, aBinding, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "hash")), "objectForKey:", aBinding);
}
},["CPKeyValueBinding","CPString","id"]), new objj_method(sel_getUid("infoForBinding:forObject:"), function $CPKeyValueBinding__infoForBinding_forObject_(self, _cmd, aBinding, anObject)
{ with(self)
{
    var theBinding = objj_msgSend(self, "getBinding:forObject:", aBinding, anObject);
    if (theBinding)
        return theBinding._info;
    return nil;
}
},["CPDictionary","CPString","id"]), new objj_method(sel_getUid("unbind:forObject:"), function $CPKeyValueBinding__unbind_forObject_(self, _cmd, aBinding, anObject)
{ with(self)
{
    var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "hash"));
    if (!bindings)
        return;
    var theBinding = objj_msgSend(bindings, "objectForKey:", aBinding);
    if (!theBinding)
        return;
    var infoDictionary = theBinding._info,
        observedObject = objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObservedKeyPathKey);
    objj_msgSend(observedObject, "removeObserver:forKeyPath:", theBinding, keyPath);
    objj_msgSend(bindings, "removeObjectForKey:", aBinding);
}
},["void","CPString","id"]), new objj_method(sel_getUid("unbindAllForObject:"), function $CPKeyValueBinding__unbindAllForObject_(self, _cmd, anObject)
{ with(self)
{
    var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "hash"));
    if (!bindings)
        return;
    var allKeys = objj_msgSend(bindings, "allKeys"),
        count = allKeys.length;
    while (count--)
        objj_msgSend(anObject, "unbind:", objj_msgSend(bindings, "objectForKey:", allKeys[count]))
    objj_msgSend(bindingsMap, "removeObjectForKey:", objj_msgSend(anObject, "hash"));
}
},["void","id"])]);
}
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("exposedBindings"), function $CPObject__exposedBindings(self, _cmd)
{ with(self)
{
    var exposedBindings = [],
        theClass = objj_msgSend(self, "class");
    while (theClass && theClass !== objj_msgSend(CPObject, "class"))
    {
        var temp = objj_msgSend(CPKeyValueBinding, "exposedBindingsForClass:", theClass);
        if (temp)
            objj_msgSend(exposedBindings, "addObjectsFromArray:", temp);
        theClass = objj_msgSend(theClass, "superclass");
    }
    return exposedBindings;
}
},["CPArray"]), new objj_method(sel_getUid("valueClassForBinding:"), function $CPObject__valueClassForBinding_(self, _cmd, binding)
{ with(self)
{
    return objj_msgSend(CPString, "class");
}
},["Class","CPString"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPObject__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, anObject, aKeyPath, options)
{ with(self)
{
    if (!anObject || !aKeyPath)
        return CPLog.error("Invalid object or path on "+self+" for "+aBinding);
    if (!objj_msgSend(objj_msgSend(self, "exposedBindings"), "containsObject:", aBinding))
        CPLog.warn("No binding exposed on "+self+" for "+aBinding);
    objj_msgSend(self, "unbind:", aBinding);
    objj_msgSend(objj_msgSend(CPKeyValueBinding, "alloc"), "initWithBinding:name:to:keyPath:options:from:", objj_msgSend(anObject, "_replacementKeyPathForBinding:", aBinding), aBinding, anObject, aKeyPath, options, self);
}
},["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("infoForBinding:"), function $CPObject__infoForBinding_(self, _cmd, aBinding)
{ with(self)
{
    return objj_msgSend(CPKeyValueBinding, "infoForBinding:forObject:", aBinding, self);
}
},["CPDictionary","CPString"]), new objj_method(sel_getUid("unbind:"), function $CPObject__unbind_(self, _cmd, aBinding)
{ with(self)
{
    objj_msgSend(CPKeyValueBinding, "unbind:forObject:", aBinding, self);
}
},["void","CPString"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPObject___replacementKeyPathForBinding_(self, _cmd, binding)
{ with(self)
{
    if (objj_msgSend(binding, "isEqual:", "value"))
        return "objectValue";
    return binding;
}
},["id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:"), function $CPObject__exposeBinding_(self, _cmd, aBinding)
{ with(self)
{
    objj_msgSend(CPKeyValueBinding, "exposeBinding:forClass:", aBinding, objj_msgSend(self, "class"));
}
},["void","CPString"])]);
}
{var the_class = objj_allocateClassPair(CPKeyValueBinding, "_CPKeyValueOrBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPKeyValueOrBinding__setValueFor_(self, _cmd, aBinding)
{ with(self)
{
    var bindings = objj_msgSend(bindingsMap, "valueForKey:", objj_msgSend(_source, "hash"));
    if (!bindings)
        return;
    objj_msgSend(_source, "setValue:forKey:", resolveMultipleValues(aBinding, bindings, CPBindingOperationOr), aBinding);
}
},["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKeyValueOrBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{ with(self)
{
    objj_msgSend(self, "setValueFor:", context);
}
},["void","CPString","id","CPDictionary","id"])]);
}
{var the_class = objj_allocateClassPair(CPKeyValueBinding, "_CPKeyValueAndBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPKeyValueAndBinding__setValueFor_(self, _cmd, aBinding)
{ with(self)
{
    var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(_source, "hash"));
    if (!bindings)
        return;
    objj_msgSend(_source, "setValue:forKey:", resolveMultipleValues(aBinding, bindings, CPBindingOperationAnd), aBinding);
}
},["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKeyValueAndBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObejct, changes, context)
{ with(self)
{
    objj_msgSend(self, "setValueFor:", context);
}
},["void","CPString","id","CPDictionary","id"])]);
}
var resolveMultipleValues = resolveMultipleValues= function( key, bindings, operation)
{
    var bindingName = key,
        theBinding,
        count = 1;
    while (theBinding = objj_msgSend(bindings, "objectForKey:", bindingName))
    {
        var infoDictionary = theBinding._info,
            object = objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey),
            keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObservedKeyPathKey),
            options = objj_msgSend(infoDictionary, "objectForKey:", CPOptionsKey);
        var value = objj_msgSend(theBinding, "transformValue:withOptions:", objj_msgSend(object, "valueForKeyPath:", keyPath), options);
        if (value == operation)
            return operation;
        bindingName = objj_msgSend(CPString, "stringWithFormat:", "%@%i", key, ++count);
    }
    return !operation;
}
var invokeAction = invokeAction= function( targetKey, argumentKey, bindings)
{
    var theBinding = objj_msgSend(bindings, "objectForKey:", targetKey),
        infoDictionary = theBinding._info,
        object = objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(infoDictionary, "objectForKey:", CPOptionsKey),
        target = objj_msgSend(object, "valueForKeyPath:", keyPath),
        selector = objj_msgSend(options, "objectForKey:", CPSelectorNameBindingOption);
    if (!target || !selector)
        return;
    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", objj_msgSend(target, "methodSignatureForSelector:", selector));
    objj_msgSend(invocation, "setSelector:", selector);
    var bindingName = argumentKey
        count = 1;
    while (theBinding = objj_msgSend(bindings, "objectForKey:", bindingName))
    {
        infoDictionary = theBinding._info;
        keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObserverKeyPathKey);
        object = objj_msgSend(objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey), "valueForKeyPath:", keyPath);
        if (object)
            objj_msgSend(invocation, "setArgument:atIndex:", object, ++count);
        bindingName = objj_msgSend(CPString, "stringWithFormat:", "%@%i", argumentKey, count);
    }
    objj_msgSend(invocation, "invoke");
}
CPObservedObjectKey = "CPObservedObjectKey";
CPObservedKeyPathKey = "CPObservedKeyPathKey";
CPOptionsKey = "CPOptionsKey";
CPMultipleValuesMarker = "CPMultipleValuesMarker";
CPNoSelectionMarker = "CPNoSelectionMarker";
CPNotApplicableMarker = "CPNotApplicableMarker";
CPAlignmentBinding = "CPAlignmentBinding";
CPEditableBinding = "CPEditableBinding";
CPEnabledBinding = "CPEnabledBinding";
CPFontBinding = "CPFontBinding";
CPHiddenBinding = "CPHiddenBinding";
CPSelectedIndexBinding = "CPSelectedIndexBinding";
CPTextColorBinding = "CPTextColorBinding";
CPToolTipBinding = "CPToolTipBinding";
CPValueBinding = "value";
CPAllowsEditingMultipleValuesSelectionBindingOption = "CPAllowsEditingMultipleValuesSelectionBindingOption";
CPAllowsNullArgumentBindingOption = "CPAllowsNullArgumentBindingOption";
CPConditionallySetsEditableBindingOption = "CPConditionallySetsEditableBindingOption";
CPConditionallySetsEnabledBindingOption = "CPConditionallySetsEnabledBindingOption";
CPConditionallySetsHiddenBindingOption = "CPConditionallySetsHiddenBindingOption";
CPContinuouslyUpdatesValueBindingOption = "CPContinuouslyUpdatesValueBindingOption";
CPCreatesSortDescriptorBindingOption = "CPCreatesSortDescriptorBindingOption";
CPDeletesObjectsOnRemoveBindingsOption = "CPDeletesObjectsOnRemoveBindingsOption";
CPDisplayNameBindingOption = "CPDisplayNameBindingOption";
CPDisplayPatternBindingOption = "CPDisplayPatternBindingOption";
CPHandlesContentAsCompoundValueBindingOption = "CPHandlesContentAsCompoundValueBindingOption";
CPInsertsNullPlaceholderBindingOption = "CPInsertsNullPlaceholderBindingOption";
CPInvokesSeparatelyWithArrayObjectsBindingOption = "CPInvokesSeparatelyWithArrayObjectsBindingOption";
CPMultipleValuesPlaceholderBindingOption = "CPMultipleValuesPlaceholderBindingOption";
CPNoSelectionPlaceholderBindingOption = "CPNoSelectionPlaceholderBindingOption";
CPNotApplicablePlaceholderBindingOption = "CPNotApplicablePlaceholderBindingOption";
CPNullPlaceholderBindingOption = "CPNullPlaceholderBindingOption";
CPPredicateFormatBindingOption = "CPPredicateFormatBindingOption";
CPRaisesForNotApplicableKeysBindingOption = "CPRaisesForNotApplicableKeysBindingOption";
CPSelectorNameBindingOption = "CPSelectorNameBindingOption";
CPSelectsAllWhenSettingContentBindingOption = "CPSelectsAllWhenSettingContentBindingOption";
CPValidatesImmediatelyBindingOption = "CPValidatesImmediatelyBindingOption";
CPValueTransformerNameBindingOption = "CPValueTransformerNameBindingOption";
CPValueTransformerBindingOption = "CPValueTransformerBindingOption";

