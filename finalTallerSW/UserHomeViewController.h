//
//  UserHomeViewController.h
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "UserDAO.h"
#import "User.h"

@interface UserHomeViewController : ViewController{
    
    User *userr;
}

@property (nonatomic, strong) User *userr;

@property (strong, nonatomic) AVAudioPlayer *player;
- (IBAction)btnLogOut:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblUser;

- (IBAction)btnPlay:(id)sender;

- (IBAction)btnPause:(id)sender;

- (IBAction)btnStop:(id)sender;


- (IBAction)btnElec:(id)sender;
- (IBAction)btnPo:(id)sender;
- (IBAction)btnRoc:(id)sender;
- (IBAction)btnDisc:(id)sender;

@property (weak, nonatomic) NSString *user;

@property (weak, nonatomic) IBOutlet UIPickerView *pvList;

@end
