//
//  Factory.h
//  Juros Compostos
//
//  Created by Valtoni on 4/1/13.
//  Copyright (c) 2013 isis. All rights reserved.
//

#import "Factory.h"
#import "Juros.h"
#import "Composto.h"
#import "Simples.h"

@interface Factory : NSObject

typedef enum {
    COMPOSTOS,
    SIMPLES
} TipoJuros;

+(id<Juros>)createJuros : (TipoJuros)engine;

@end
