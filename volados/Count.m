//
//  NSObject+Count.m
//  volados
//
//  Created by Semy Levy on 29/11/16.
//  Copyright © 2016 Semy Levy. All rights reserved.
//

#import "Count.h"

@implementation Count

int contAguila;
int contSol;
float porcentajeAguila;
float porcentajeSol;

+ (int)GET_CONTADOR_AGUILA { return contAguila; }
+ (int)GET_CONTADOR_SOL { return contSol; }

+ (void)SET_CONTADOR_AGUILA:(int) contA {
    contAguila = contA;
    NSLog(@"%d", contAguila);
}
+ (void)SET_CONTADOR_SOL:(int)contS {
    contSol = contS;
    NSLog(@"%d", contSol);
}

+(float)GET_PORCENTAJE_AGUILA {
    porcentajeAguila = (contAguila / (contAguila + contSol)) * 100;
    porcentajeSol = (contSol / (contAguila + contSol)) * 100;
    NSLog(@"PORCENTAJE AGUILA: %f, datos: %d %d", porcentajeAguila, contAguila, contSol);
    return porcentajeAguila;
}
+(float)GET_PORCENTAJE_SOL {
    porcentajeSol = (contSol / (contAguila + contSol)) * 100;
    porcentajeAguila = (contAguila / (contAguila + contSol)) * 100;
    NSLog(@"PORCENTAJE SOL: %f, datos: %d %d", porcentajeSol, contAguila, contSol);
    return porcentajeSol;
}

@end
