//
//  RegisterViewController.h
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"
#import "UserDAO.h"

@interface RegisterViewController : ViewController


@property (weak, nonatomic) IBOutlet UITextField *tfUserNameNew;
@property (weak, nonatomic) IBOutlet UITextField *tfPassNew;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

- (IBAction)btnHome:(id)sender;
- (IBAction)btnCrearUser:(id)sender;

@end
