//
//  SettingsViewController.m
//  Support2
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil  {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
		self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        
        
        
    }
    
    return self;
}

-(void) createOrOpenDb {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"settings.db"];
    
    char *error;
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    if(![filemanager fileExistsAtPath:dbPathString]) {
        const char *dbpath = [dbPathString UTF8String];
        
        if(sqlite3_open(dbpath, &settingsDb)==SQLITE_OK) {
            const char *stmnt = "CREATE TABLE IF NOT EXIST SETTINGS (NAME PRIMARY KEY TEXT, VALUE TEXT)";
            sqlite3_exec(settingsDb, stmnt, NULL, NULL, &error);
            sqlite3_close(settingsDb);
        }
    }
    
}

@end
