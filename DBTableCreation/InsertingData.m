//
//  InsertingData.m
//  DBTableCreation
//
//  Created by Kirti Kesur on 29/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InsertingData.h"
#import "DataBaseConnection.h"
#import <sqlite3.h>

@implementation InsertingData

+(void) InsertIntoTable:(NSString *)StrName SetAddress:(NSString *)StrAddress SetPhone:(NSString *)StrPhone {
    
    sqlite3 *database;   

    if(sqlite3_open([[DataBaseConnection GetDataBasePath] UTF8String], &database) == SQLITE_OK) {
        
        sqlite3_exec(database, "PRAGMA key = 'BIGsecret'", NULL, NULL, NULL);
        
        if (sqlite3_exec(database, (const char*) "SELECT count(*) FROM sqlite_master;", NULL, NULL, NULL) == SQLITE_OK) {
        
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT into TableOne (NAME,ADDRESS,PHONE) values (?,?,?)",StrName,StrAddress,StrPhone];
        const char *sqlStatement = [insertSQL UTF8String];
        sqlite3_stmt *compiledStatement;
        
        sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);        
        
        sqlite3_bind_text(compiledStatement, 1, [StrName UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(compiledStatement, 2, [StrAddress UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(compiledStatement, 3, [StrAddress UTF8String], -1, SQLITE_TRANSIENT);
        if(SQLITE_DONE != sqlite3_step(compiledStatement))
        {
            NSAssert1(0, @"Error while Inserting in MyDairy TABLE - '%s'", sqlite3_errmsg(database));
        }
        sqlite3_reset(compiledStatement);
        compiledStatement = nil;
        
        }
    }
    
    
    sqlite3_close(database);
}


@end
