//
//  CreateDataBaseTable.m
//  DBTableCreation
//
//  Created by Kirti Kesur on 21/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateDataBaseTable.h"
#import "DataBaseConnection.h"
#import <sqlite3.h>

@implementation CreateDataBaseTable

+(void)CreateTable_TableName:(NSString *)StrTableName FieldInfo:(NSMutableDictionary *)DicFieldInfo{    
    
    NSString *databasePath = [DataBaseConnection GetDataBasePath];    
    const char *dbpath = [databasePath UTF8String];
    sqlite3 *contactDB;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK) {
        char *errMsg;        
        sqlite3_exec(contactDB, "PRAGMA key = 'BIGsecret'", NULL, NULL, NULL);
        
        if (sqlite3_exec(contactDB, (const char*) "SELECT count(*) FROM sqlite_master;", NULL, NULL, NULL) == SQLITE_OK) {
        
        NSString *Querty = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)",StrTableName,StrTableName];
        const char *sql_stmt = [Querty UTF8String];        
        if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            NSLog(@"Failed to create table");
        }
        sqlite3_close(contactDB);
    }
    }
    else {
        NSLog(@"Failed to open/create database");
    }

}
@end
