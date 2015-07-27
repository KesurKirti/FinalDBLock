//
//  DataBaseConnection.m
//  DBTableCreation
//
//  Created by Kirti Kesur on 21/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataBaseConnection.h"
#import <sqlite3.h>
@implementation DataBaseConnection

+(void)CreatDataBase {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
    NSString *databasePath = [DataBaseConnection GetDataBasePath];    
    
    BOOL success;
    success = [FileManager fileExistsAtPath:databasePath];
    
    if (!success) {
        const char *dbpath = [databasePath UTF8String];
        sqlite3 *contactDB;
        sqlite3_open(dbpath, &contactDB);
        sqlite3_close(contactDB);
    }    
}
+(NSString *)GetDataBasePath{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);    
    NSString *documentDir = [paths objectAtIndex:0];    
    return [documentDir stringByAppendingPathComponent:@"DBCreation.sqlite"];

}


@end
