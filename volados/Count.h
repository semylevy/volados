//
//  NSObject+Count.h
//  volados
//
//  Created by Semy Levy on 29/11/16.
//  Copyright © 2016 Semy Levy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Count : NSObject

+ (int)GET_CONTADOR_AGUILA;
+ (int)GET_CONTADOR_SOL;
+ (void)SET_CONTADOR_AGUILA:(int) cont;
+ (void)SET_CONTADOR_SOL:(int)cont;
+ (float)GET_PORCENTAJE_AGUILA;
+ (float)GET_PORCENTAJE_SOL;

@end
