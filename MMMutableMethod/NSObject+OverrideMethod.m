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
    Method methodForOverride;
    char *trueClassName;
}

@end
