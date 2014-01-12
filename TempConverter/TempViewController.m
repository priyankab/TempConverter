//
//  TempViewController.m
//  TempConverter
//
//  Created by Priyanka Bhalerao on 1/11/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()
- (IBAction)onTapAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *farhenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (IBAction)onClick:(id)sender;

@end

@implementation TempViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Converter";
        [self.convertButton setBackgroundColor:[UIColor greenColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.celsiusTextField.delegate = self;
    self.farhenheitTextField.delegate = self;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapAction:(id)sender {
    [self.view endEditing:YES];
}

#pragma TextField Delegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Hello");
    if(textField == self.farhenheitTextField){
        [self.celsiusTextField setEnabled:NO];
    }else if (textField == self.celsiusTextField){
        [self.farhenheitTextField setEnabled:NO];
    }
   
}

- (IBAction)onClick:(id)sender {
    
    if(self.farhenheitTextField.enabled == NO){
        float celsius = [self.celsiusTextField.text floatValue];
        float farhenheit = (celsius * 9 )/5 +32;
       
        self.farhenheitTextField.text = [NSString stringWithFormat:@"%d", (int) round(farhenheit)];
    }else if( self.celsiusTextField.enabled == NO){
        float farhenheit = [self.farhenheitTextField.text floatValue];
        float celsius = (farhenheit - 32 ) * 5.0 /9;
      
        self.celsiusTextField.text = [NSString stringWithFormat:@"%d", (int) round(celsius)];
        
    }
    [self.celsiusTextField setEnabled:YES];
    [self.farhenheitTextField setEnabled:YES];

}
@end
