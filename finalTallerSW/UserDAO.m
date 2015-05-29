//
//  UserDAO.m
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "UserDAO.h"
#import "User.h"

@implementation UserDAO

- (NSString *) obtenerRutaBD{
    NSString *dirDocs;
    NSArray *rutas;
    NSString *rutaBD;
    
    rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    dirDocs = [rutas objectAtIndex:0];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    rutaBD = [[NSString alloc] initWithString:[dirDocs stringByAppendingPathComponent:@"Users.sqlite"]];
    
    if([fileMgr fileExistsAtPath:rutaBD] == NO){
        [fileMgr copyItemAtPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Users.sqlite"] toPath:rutaBD error:NULL];
    }
    
    return rutaBD;
}
- (NSMutableArray *) obtenerUser{
    NSMutableArray *listaUsers = [[NSMutableArray alloc] init];
    NSString *ubicacionDB = [self obtenerRutaBD];
    
    if(!(sqlite3_open([ubicacionDB UTF8String], &bd) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
    }
    
    const char *sentenciaSQL = "SELECT id, userName, userPass, userFav1, userFav2, userFav3 FROM User";
    sqlite3_stmt *sqlStatement;
    
    if(sqlite3_prepare_v2(bd, sentenciaSQL, -1, &sqlStatement, NULL) != SQLITE_OK){
        NSLog(@"Problema al preparar el statement");
    }
    
    while(sqlite3_step(sqlStatement) == SQLITE_ROW){
        User *user = [[User alloc] init];
        user.userID = sqlite3_column_int(sqlStatement, 0);
        user.userName = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
        user.userPass = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
        user.userFav1 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
        user.userFav2 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)];
        user.userFav3 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 5)];
        
        [listaUsers addObject:user];
    }
    
    return listaUsers;
}



- (void) crearUser:(NSString *)userName userPass:(NSString *)userPass{
    NSString *ubicacionDB = [self obtenerRutaBD];
    
    if(!(sqlite3_open([ubicacionDB UTF8String], &bd) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSString *sqlInsert = [NSString stringWithFormat:@"INSERT INTO User (userName, userPass) VALUES ('%@', %@)", userName, userPass];
        const char *sql = [sqlInsert UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(bd, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                _status=@"The user has been created";
                sqlite3_finalize(sqlStatement);
                sqlite3_close(bd);
            }
        }
        
    }
    
}



- (void) actualizarUser: (NSString *)userName userFav1:(NSString *)userFav1 userFav2:(NSString *)userFav2 userFav3:(NSString *)userFav3{
 
    NSString *ubicacionBD = [self obtenerRutaBD];
    
    if(!(sqlite3_open([ubicacionBD UTF8String], &bd) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSString *sqlUpdate = [NSString stringWithFormat:@"UPDATE User SET userFav1 = '%@', userFav2 = '%@', userFav3 = '%@' WHERE userName = '%@'", userFav1, userFav2, userFav3, userName];
        const char *sql = [sqlUpdate UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(bd, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement.");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                sqlite3_finalize(sqlStatement);
                sqlite3_close(bd);
            }
        }
    }
    
    
}


@end
