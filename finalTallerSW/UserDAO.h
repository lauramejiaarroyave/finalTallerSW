//
//  UserDAO.h
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface UserDAO : NSObject{
    sqlite3 *bd;
}

- (NSMutableArray *) obtenerUser;
- (NSString *) obtenerRutaBD;


@property NSString *status;

- (void) crearUser: (NSString *)userName userPass:(NSString *)userPass;

- (void) actualizarUser: (NSString*)userName userFav1:(NSString *)userFav1 userFav2:(NSString *)userFav2 userFav3:(NSString *)userFav3;



@end
