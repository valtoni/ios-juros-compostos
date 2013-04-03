//
//  JurosCompostosViewController.m
//  Juros Compostos
//
//  Created by Valtoni on 12/9/12.
//  Copyright (c) 2012 isis. All rights reserved. 1
//

#import "JurosCompostosViewController.h"
#import "NumberUtils.h"

#import "CoreTelephony/CTCall.h"
#import "CoreTelephony/CTCallCenter.h"

#import "Factory.h"

@implementation JurosCompostosViewController

@synthesize vlCapital, vlMontante, vlTempo, vlTxJuros, vlJuros;


-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSString *regex = @"\\d*\\.\\d*";
    NSRange t = [textField.text rangeOfString:regex options:NSRegularExpressionSearch];
    NSLog(@"End editing");
    return t.location != NSNotFound;
}

-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:YES];
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(NSString*) makeRestCall : (NSString*) reqURL
{
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:reqURL]];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &error];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",responseString);
    return responseString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [vlCapital addTarget:self action:@selector(textFieldShouldEndEditing:) forControlEvents:UIControlEventEditingChanged];
    
    /*NSOperationQueue *opQ = [[NSOperationQueue alloc] init];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"Camelo" object:nil queue:opQ usingBlock:^(NSNotification *note) {
        // code
    }];
    
    CTCallCenter *callcenter = [CTCallCenter new];
    callcenter.callEventHandler = ^(CTCall* call) {
        if (call.callState == CTCallStateDisconnected) {
            
        }
    }; */
    
    //x[vlMontante setTextAlignment:NSTextAlignmentCenter];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Aplicativo Aberto");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(double)transformValue:(UITextField*)textField
{
    if ([textField.text isEqual: @""]) {
        return NO_RESPONSE;
    }
    else {
        return [textField.text doubleValue];
    }
    
}

-(void)calcular:(id)sender
{
    //vlCapital.text.doubleValue;
    
    
/*    NSString *twitterReqUrl = @"http://api.twitter.com/1/statuses/user_timeline.atom?screen_name=hardikr";
    NSString *resp = [self makeRestCall:twitterReqUrl];
    NSLog(resp); */

    // Declaração da técnica a ser selecionada
    id<Juros> tecnicaJuros;

    // O uiTabBar decidirá juros simples ou compostos
    switch (self.uiTabBar.selectedItem.tag) {
        case 0:
            tecnicaJuros = [Factory createJuros:SIMPLES];
            break;
        case 1:
            tecnicaJuros = [Factory createJuros:COMPOSTOS];
            break;
    }
    
    // Entra valores da UI
    tecnicaJuros.capital = [self transformValue:vlCapital];
    tecnicaJuros.montante = [self transformValue:vlMontante];
    tecnicaJuros.tempoDeAplicacao = [self transformValue:vlTempo];
    tecnicaJuros.taxaDeJuros = [self transformValue:vlTxJuros];
    tecnicaJuros.juros = [self transformValue:vlJuros];

    // Chama o decisor para efetuar o cálculo
    [tecnicaJuros decisor];


}




@end
