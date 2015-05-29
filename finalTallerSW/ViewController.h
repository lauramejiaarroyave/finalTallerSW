//
//  ViewController.h
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDAO.h"

@interface ViewController : UIViewController{
    UserDAO *dao;
    NSMutableArray *users;
}


@property (nonatomic, strong) UserDAO *dao;
@property (nonatomic, strong) NSMutableArray *users;

@property (weak, nonatomic) IBOutlet UIImageView *ivGif;

@end

