//
//  LoginRespList.h
//  Support
//
//  Created by DieGo on 3/9/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "crmField.h"
#import "crmFieldFlag.h"

@interface LoginRespList : NSObject

@property (nonatomic, strong) crmField *user_id;
@property (nonatomic, strong) crmField *user_name;
@property (nonatomic, strong) crmField *user_language;
@property (nonatomic, strong) crmField *user_currency_id;
@property (nonatomic, strong) crmFieldFlag *user_is_admin;
@property (nonatomic, strong) crmField *user_default_team_id;
@property (nonatomic, strong) crmField *user_default_dateformat;
@property (nonatomic, strong) crmField *user_default_timeformat;
@property (nonatomic, strong) crmField *user_number_seperator;
@property (nonatomic, strong) crmField *user_decimal_seperator;
@property (nonatomic, strong) crmField *mobile_max_list_entries;
@property (nonatomic, strong) crmField *mobile_max_subpanel_entries;
@property (nonatomic, strong) crmField *user_currency_name;

@end
