//
//  CreateDataBaseTable.h
//  DBTableCreation
//
//  Created by Kirti Kesur on 21/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateDataBaseTable : NSObject

+(void)CreateTable_TableName:(NSString *)StrTableName FieldInfo:(NSMutableDictionary *)DicFieldInfo;

@end
