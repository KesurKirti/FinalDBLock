//
//  RootViewController.m
//  DBTableCreation
//
//  Created by Kirti Kesur on 21/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [txt_TableName release];
    txt_TableName = nil;
    [txt_FieldName release];
    txt_FieldName = nil;
    [txt_FieldType release];
    txt_FieldType = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [txt_TableName release];
    [txt_FieldName release];
    [txt_FieldType release];
    [super dealloc];
}
- (IBAction)Btn_CreateTable_Clicked:(id)sender {
    
    [DataBaseConnection CreatDataBase];
    NSMutableDictionary * DicFieldInfo = [[NSMutableDictionary alloc]init];
    
    [DicFieldInfo setValue:@"VARCHAR" forKey:@"NAME"];
    [DicFieldInfo setValue:@"VARCHAR" forKey:@"ADDRESS"];
    [DicFieldInfo setValue:@"VARCHAR" forKey:@"PHONE"];
    
    [CreateDataBaseTable CreateTable_TableName:@"TableOne" FieldInfo:DicFieldInfo];
    [InsertingData InsertIntoTable:@"ABC" SetAddress:@"XYZ" SetPhone:@"1234567891"];
    NSString *NewString = [FetchingData FetchingData];
    NSLog(@"NewString:-%@",NewString);
}


@end
