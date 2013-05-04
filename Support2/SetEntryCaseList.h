//
//  SetEntryCaseList.h
//  Support
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "crmField.h"

@interface SetEntryCaseList : NSObject

@property (nonatomic, strong) crmField *name;
@property (nonatomic, strong) crmField *description;
//@property (nonatomic, strong) crmField *user_language;
@property (nonatomic, strong) crmField *assigned_user_id;

@end
