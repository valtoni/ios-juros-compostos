//
//  Juros.h
//  Juros Compostos
//
//  Created by Valtoni on 3/30/13.
//  Copyright (c) 2013 isis. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Juros <NSObject>

#define NO_RESPONSE -1;

@property (readwrite, nonatomic) double montante;
@property (readwrite, nonatomic) double capital;
@property (readwrite, nonatomic) double juros;
@property (readwrite, nonatomic) double taxaDeJuros;
@property (readwrite, nonatomic) double tempoDeAplicacao;

-(double)calculaMontante;
-(double)calculaCapital;
-(double)calculaJuros;
-(double)calculaTaxaDeJuros;
-(double)calculaTempoDeAplicacao;
-(double)decisor;


@end
