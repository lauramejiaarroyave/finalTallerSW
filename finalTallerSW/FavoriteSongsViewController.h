//
//  FavoriteSongsViewController.h
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 25/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"

@interface FavoriteSongsViewController : ViewController


- (IBAction)btnReturnMyHome:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblFav1;
@property (weak, nonatomic) IBOutlet UILabel *lblFav2;
@property (weak, nonatomic) IBOutlet UILabel *lblFav3;

@property (weak, nonatomic) NSString *us;

@end
