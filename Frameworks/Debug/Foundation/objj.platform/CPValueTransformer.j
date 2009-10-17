I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jc;6828;
var transformerMap = objj_msgSend(CPDictionary, "dictionary");
{var the_class = objj_allocateClassPair(CPObject, "CPValueTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("reverseTransformedValue:"), function $CPValueTransformer__reverseTransformedValue_(self, _cmd, value)
{ with(self)
{
    if (objj_msgSend(objj_msgSend(self, "class"), "allowsReverseTransformation"))
    {
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, (self+" is not reversible."));
    }
    return objj_msgSend(self, "transformedValue:", value);
}
},["id","id"]), new objj_method(sel_getUid("transformedValue:"), function $CPValueTransformer__transformedValue_(self, _cmd, value)
{ with(self)
{
    return nil;
}
},["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setValueTransformer:forName:"), function $CPValueTransformer__setValueTransformer_forName_(self, _cmd, transformer, name)
{ with(self)
{
    objj_msgSend(transformerMap, "setObject:forKey:", transformer, name);
}
},["void","CPValueTransformer","CPString"]), new objj_method(sel_getUid("valueTransformerForName:"), function $CPValueTransformer__valueTransformerForName_(self, _cmd, name)
{ with(self)
{
    return objj_msgSend(transformerMap, "objectForKey:", name);
}
},["CPValueTransformer","CPString"]), new objj_method(sel_getUid("valueTransformerNames"), function $CPValueTransformer__valueTransformerNames(self, _cmd)
{ with(self)
{
    return objj_msgSend(transformerMap, "allKeys");
}
},["CPArray"]), new objj_method(sel_getUid("allowsReverseTransformation"), function $CPValueTransformer__allowsReverseTransformation(self, _cmd)
{ with(self)
{
  return NO;
}
},["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPValueTransformer__transformedValueClass(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPObject, "class");
}
},["Class"])]);
}
{var the_class = objj_allocateClassPair(Nil, "CPNegateBooleanTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("reverseTransformedValue:"), function $CPNegateBooleanTransformer__reverseTransformedValue_(self, _cmd, value)
{ with(self)
{
    return !objj_msgSend(value, "boolValue");
}
},["id","id"]), new objj_method(sel_getUid("transformedValue:"), function $CPNegateBooleanTransformer__transformedValue_(self, _cmd, value)
{ with(self)
{
    return !objj_msgSend(value, "boolValue");
}
},["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPNegateBooleanTransformer__allowsReverseTransformation(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPNegateBooleanTransformer__transformedValueClass(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPNumber, "class");
}
},["Class"])]);
}
{var the_class = objj_allocateClassPair(Nil, "CPIsNilTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPIsNilTransformer__transformedValue_(self, _cmd, value)
{ with(self)
{
    return value === nil || value === undefined;
}
},["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPIsNilTransformer__allowsReverseTransformation(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPIsNilTransformer__transformedValueClass(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPNumber, "class");
}
},["Class"])]);
}
{var the_class = objj_allocateClassPair(Nil, "CPIsNotNilTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPIsNotNilTransformer__transformedValue_(self, _cmd, value)
{ with(self)
{
    return value !== nil && value !== undefined;
}
},["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPIsNotNilTransformer__allowsReverseTransformation(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPIsNotNilTransformer__transformedValueClass(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPNumber, "class");
}
},["Class"])]);
}
{var the_class = objj_allocateClassPair(Nil, "CPUnarchiveFromDataTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("reverseTransformedValue:"), function $CPUnarchiveFromDataTransformer__reverseTransformedValue_(self, _cmd, value)
{ with(self)
{
    return objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", value);
}
},["id","id"]), new objj_method(sel_getUid("transformedValue:"), function $CPUnarchiveFromDataTransformer__transformedValue_(self, _cmd, value)
{ with(self)
{
    return objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", value);
}
},["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPUnarchiveFromDataTransformer__allowsReverseTransformation(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPUnarchiveFromDataTransformer__transformedValueClass(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPData, "class");
}
},["Class"])]);
}
CPNegateBooleanTransformerName = "CPNegateBooleanTransformerName";
CPIsNilTransformerName = "CPIsNilTransformerName";
CPIsNotNilTransformerName = "CPIsNotNilTransformerName";
CPUnarchiveFromDataTransformerName = "CPUnarchiveFromDataTransformerName";
objj_msgSend(CPValueTransformer, "setValueTransformer:forName:", objj_msgSend(CPNegateBooleanTransformer, "new"), CPNegateBooleanTransformerName);
objj_msgSend(CPValueTransformer, "setValueTransformer:forName:", objj_msgSend(CPIsNilTransformer, "new"), CPIsNilTransformerName);
objj_msgSend(CPValueTransformer, "setValueTransformer:forName:", objj_msgSend(CPIsNotNilTransformer, "new"), CPIsNotNilTransformerName);
objj_msgSend(CPValueTransformer, "setValueTransformer:forName:", objj_msgSend(CPUnarchiveFromDataTransformer, "new"), CPUnarchiveFromDataTransformerName);

