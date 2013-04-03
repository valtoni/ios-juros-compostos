//
//  Composto.m
//  Juros Compostos
//
//  Created by Valtoni on 3/30/13.
//  Copyright (c) 2013 isis. All rights reserved.
//

#import "Composto.h"

@implementation Composto

@synthesize montante;
@synthesize capital;
@synthesize juros;
@synthesize taxaDeJuros;
@synthesize tempoDeAplicacao;

/*
 
 M = C * (1 + i) ^ t, onde:
 M: montante
 C: capital
 i: taxa de juros
 t: tempo de aplicação
*/

-(double)decisor {
    if (capital && taxaDeJuros && tempoDeAplicacao) {
        NSLog(@"(C) Calculando montante");
        return self.calculaMontante;
    }
    else if (montante && taxaDeJuros && tempoDeAplicacao) {
        NSLog(@"(C) Calculando capital");
        return self.calculaCapital;
    }
    else if (montante && capital && tempoDeAplicacao) {
        NSLog(@"(C) Calculando taxa de juros");
        return self.calculaTaxaDeJuros;
    }
    else if (montante && capital && taxaDeJuros) {
        NSLog(@"(C) Calculando tempo de aplicação");
        return self.calculaTempoDeAplicacao;
    }
    else if (montante && capital) {
        NSLog(@"(C) Calculando juros");
        return self.calculaJuros;
    }
    NSLog(@"(C) Sem valores para efetuar cálculo");
    return NO_RESPONSE;
}


-(double)calculaMontante {
    return capital * pow(1 + taxaDeJuros, tempoDeAplicacao);
}

-(double)calculaCapital {
    return montante / pow(1 + taxaDeJuros, tempoDeAplicacao);
}

-(double)calculaJuros {
    return montante - capital;
}

-(double)calculaTaxaDeJuros {
    return pow(montante / capital, 1.0 / tempoDeAplicacao) - 1;
}

-(double)calculaTempoDeAplicacao {
    return log(montante / capital) / log(1 + taxaDeJuros);
}

@end
