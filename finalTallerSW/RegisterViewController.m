//
//  RegisterViewController.m
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController{
    
    NSString *flag;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    

    _lblStatus.text=@"";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    
    
    [_tfUserNameNew resignFirstResponder];
    [_tfPassNew resignFirstResponder];
    return YES;
}

- (IBAction)btnHome:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnCrearUser:(id)sender {
    
    flag=@"0";
    _lblStatus.text=@"";
    
    
    if ([_tfUserNameNew.text isEqualToString:@""] || [_tfPassNew.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please"
                                                        message:@"Fill all Fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else{
        
        
        for (int i=0; i<users.count; i ++) {
            if ([[[users objectAtIndex:i] valueForKey:@"userName"] isEqualToString:_tfUserNameNew.text]) {
                
                flag =@"1";
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User Already Exists!"
                                                                message:@"Try With Another One"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                
            }else{
                
                
                
            }
            
        }
        
        
        if ([flag isEqualToString:@"0"]) {
            
            NSString *userName = [NSString stringWithFormat:_tfUserNameNew.text];
            NSString *userPass  = [NSString stringWithFormat:_tfPassNew.text];
            
            [dao crearUser:userName userPass:userPass];
            
            _lblStatus.text=@"The user has been created!";
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successfull"
                                                            message:@"User has been created"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            
            
            
            [self dismissViewControllerAnimated:YES completion:nil];

            
        }
        
    }
    
    

    
    

    

}
@end
