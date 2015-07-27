//
//  FetchingData.m
//  DBTableCreation
//
//  Created by Kirti Kesur on 29/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FetchingData.h"
#import "DataBaseConnection.h"
#import <sqlite3.h>

@implementation FetchingData

+(NSString *)FetchingData
{
    sqlite3 *database;
    NSString *Name;
    NSString *Addresh;
    NSString *Phone ;
    NSString *FullString;
	if(sqlite3_open([[DataBaseConnection GetDataBasePath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_exec(database, "PRAGMA key = 'BIGsecret'", NULL, NULL, NULL);
        
        if (sqlite3_exec(database, (const char*) "SELECT count(*) FROM sqlite_master;", NULL, NULL, NULL) == SQLITE_OK) {

        NSString *querry = [NSString stringWithFormat:@"select * from TableOne"];
		const char *sqlStatement = [querry UTF8String];        
		sqlite3_stmt *compiledStatement;
        
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {

			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                Name=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                Addresh=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                Phone=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                
                FullString = [NSString stringWithFormat:@"%@~~%@~~%@",Name,            Addresh,Phone];
                NSLog(@"FullString:-%@",FullString);
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
        }
    }
	sqlite3_close(database);    
    return FullString;
    
}


@end
