//
//  LogInViewController.m
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "LogInViewController.h"
#import "UserHomeViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController{
    
    NSString *flag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    
    
    [_tfPass resignFirstResponder];
    [_tfUserName resignFirstResponder];
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"LogIn"]) {
        
        
        UserHomeViewController *lVC = [segue destinationViewController];
        lVC.user=[NSString stringWithFormat:@"%@", _tfUserName.text];

    }
   

}



-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    for (int i=0; i<users.count; i ++) {
        if ([[[users objectAtIndex:i] valueForKey:@"userName"] isEqualToString:_tfUserName.text] && [[[users objectAtIndex:i] valueForKey:@"userPass"] isEqualToString:_tfPass.text]) {
            

            return YES;
            
        }else{
            
            flag =@"0";
            
        }
        
    }
    
    if ([flag isEqualToString:@"0"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                        message:@"Invalid User or Pwd"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        return NO;
    }
    return NO;
}


- (IBAction)btnHome:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
