//
//  NSObject+OverrideMethod.h
//  Runtime
//
//  Created by Sergey Starukhin on 15.02.13.
//  Copyright (c) 2013 LOL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (OverrideMethod)

- (void)overrideMethod:(SEL)selector withBlock:(id)block;

@end
