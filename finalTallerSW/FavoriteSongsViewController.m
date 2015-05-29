//
//  FavoriteSongsViewController.m
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 25/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "FavoriteSongsViewController.h"

@interface FavoriteSongsViewController ()

@end

@implementation FavoriteSongsViewController{
    
    NSString *flag;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    users = [dao obtenerUser];
    
    for (int i=0; i<users.count; i ++) {
        if ([[[users objectAtIndex:i] valueForKey:@"userName"] isEqualToString:_us]) {
            
            flag =@"1";
            

            _lblFav1.text =[[users objectAtIndex:i] valueForKey:@"userFav1"];
            _lblFav2.text =[[users objectAtIndex:i] valueForKey:@"userFav2"];
            _lblFav3.text =[[users objectAtIndex:i] valueForKey:@"userFav3"];
        }else{
            
            
            
        }
        
    }
}

/*-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    users = [dao obtenerUser];
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnReturnMyHome:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
