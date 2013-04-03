//
//  JurosCompostosViewController.h
//  Juros Compostos
//
//  Created by Valtoni on 12/9/12.
//  Copyright (c) 2012 isis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JurosCompostosViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *vlMontante;
@property (nonatomic, retain) IBOutlet UITextField *vlTxJuros;
@property (nonatomic, retain) IBOutlet UITextField *vlJuros;
@property (nonatomic, retain) IBOutlet UITextField *vlCapital;
@property (nonatomic, retain) IBOutlet UITextField *vlTempo;


@property (nonatomic, retain) IBOutlet UITabBar *uiTabBar;


-(IBAction)calcular:(id)sender;

-(IBAction)textFieldReturn:(id)sender;
-(IBAction)backgroundTouched:(id)sender;



@end
