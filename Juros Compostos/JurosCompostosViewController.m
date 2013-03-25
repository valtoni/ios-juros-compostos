//
//  JurosCompostosViewController.m
//  Juros Compostos
//
//  Created by Valtoni on 12/9/12.
//  Copyright (c) 2012 isis. All rights reserved. 1
//

#import "JurosCompostosViewController.h"
#import "NumberUtils.h"

@implementation JurosCompostosViewController

@synthesize vlCapital, vlMontante, vlTempo, vlTxJuros;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Aplicativo Aberto");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calcular:(id)sender
{
    analyzeThis(vlCapital);
}

@end
