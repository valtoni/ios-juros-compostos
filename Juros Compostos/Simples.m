//
//  Simples.m
//  Juros Compostos
//
//  Created by Valtoni on 3/30/13.
//  Copyright (c) 2013 isis. All rights reserved.
//

#import "Simples.h"

@implementation Simples

// Juros Simples:
/*
 J = C * i * t, onde
 
 J = juros
 C = capital
 i = taxa de juros
 t = tempo de aplicação (mês, bimestre, trimestre, semestre, ano...)
 
 M = C + J
 
 M = montante final
 C = capital
 J = juros
*/

@synthesize montante;
@synthesize capital;
@synthesize juros;
@synthesize taxaDeJuros;
@synthesize tempoDeAplicacao;


-(double)decisor {
    
    if (juros && taxaDeJuros && tempoDeAplicacao) {
        NSLog(@"(S) Calculando capital");
        return self.calculaCapital;
    }
    else if (capital && taxaDeJuros && tempoDeAplicacao) {
        NSLog(@"(S) Calculando juros");
        return self.calculaJuros;
    }
    else if (juros && capital && tempoDeAplicacao) {
        NSLog(@"(S) Calculando taxa de juros");
        return self.calculaTaxaDeJuros;
    }
    else if (juros && capital && taxaDeJuros) {
        NSLog(@"(S) Calculando tempo de aplicação");
        return self.calculaTempoDeAplicacao;
    }
    else if (capital && juros) {
        NSLog(@"(S) Calculando montante");
        return self.calculaMontante;
    }
    NSLog(@"(S) Sem valores para efetuar cálculo");
    return NO_RESPONSE;
}

-(double)calculaMontante {
    return capital + juros;
}

-(double)calculaCapital {
    return juros / taxaDeJuros * tempoDeAplicacao;
}

-(double)calculaJuros {
    return capital * taxaDeJuros * tempoDeAplicacao;
}

-(double)calculaTaxaDeJuros {
    return juros / capital * tempoDeAplicacao;
}

-(double)calculaTempoDeAplicacao {
    return juros / capital * taxaDeJuros;
}

@end
