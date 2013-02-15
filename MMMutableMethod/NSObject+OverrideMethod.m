//
//  NSObject+OverrideMethod.m
//  Runtime
//
//  Created by Sergey Starukhin on 15.02.13.
//  Copyright (c) 2013 LOL. All rights reserved.
//

#import "NSObject+OverrideMethod.h"
#import <objc/runtime.h>

@implementation NSObject (OverrideMethod)

- (void)overrideMethod:(SEL)selector withBlock:(id)block {
    NSString *newClassName;
    Class newClass;
    Class trueSelfClass;
    Method methodForOverride;
    IMP oldImplementation;

    trueSelfClass = object_getClass(self);
    methodForOverride = class_getInstanceMethod(trueSelfClass, selector); // TODO: add error handler if result is NULL
    // название нового класса формируется из настоящего имени класса на случай если будем скрывать класс переопределяя методы: class и superclass
    newClassName = [NSString stringWithFormat:@"ShadowClass_%s_%p", class_getName(trueSelfClass), self]; // TODO: add error handler if result is NULL
    newClass = objc_allocateClassPair(trueSelfClass, [newClassName UTF8String], 0);
    oldImplementation = class_replaceMethod(newClass, selector, imp_implementationWithBlock(block), method_getTypeEncoding(methodForOverride));
    // TODO: add error handler if result is NULL
    objc_registerClassPair(newClass);
    object_setClass(self, newClass);
}

@end
