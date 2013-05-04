//
//  SettingsViewController.h
//  Support2
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface SettingsViewController : UIViewController<UITextViewDelegate, UITextFieldDelegate> {
    NSString *dbPathString;
    sqlite3 *settingsDb;
}

-(void) createOrOpenDb;
@end
