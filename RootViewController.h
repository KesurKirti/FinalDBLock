//
//  RootViewController.h
//  DBTableCreation
//
//  Created by Kirti Kesur on 21/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseConnection.h"
#import "CreateDataBaseTable.h"
#import "InsertingData.h"
#import "FetchingData.h"

@interface RootViewController : UIViewController{
    
    IBOutlet UITextField *txt_TableName;
    IBOutlet UITextField *txt_FieldName;
    IBOutlet UITextField *txt_FieldType;
}
- (IBAction)Btn_CreateTable_Clicked:(id)sender;

@end
