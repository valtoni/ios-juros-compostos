//
//  Factory.m
//  Juros Compostos
//
//  Created by Valtoni on 4/1/13.
//  Copyright (c) 2013 isis. All rights reserved.
//

#import "Factory.h"
#import "Juros.h"
#import "Composto.h"
#import "Simples.h"

@implementation Factory


+(id<Juros>)createJuros : (TipoJuros)engine
{
    switch (engine) {
        case COMPOSTOS:
            return [Composto new];
        case SIMPLES:
            return [Simples new];
        default:
            return NULL;
    }
}

@end
