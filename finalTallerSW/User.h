//
//  User.h
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
    
    NSInteger userID;
    NSString *userName;
    NSString *userPass;
    NSString *userFav1;
    NSString *userFav2;
    NSString *userFav3;


}

@property (nonatomic, assign) NSInteger userID;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *userPass;
@property (nonatomic, retain) NSString *userFav1;
@property (nonatomic, retain) NSString *userFav2;
@property (nonatomic, retain) NSString *userFav3;




@end
