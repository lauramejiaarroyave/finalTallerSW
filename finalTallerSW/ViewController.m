//
//  ViewController.m
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"
#import "LogInViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dao;
@synthesize users;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    dao = [[UserDAO alloc] init];
    users = [[NSMutableArray alloc] init];
    users = [dao obtenerUser];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
