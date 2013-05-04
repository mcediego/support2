//
//  LoginResp.h
//  Support
//
//  Created by DieGo on 3/9/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRespList.h"

@interface LoginResp : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *module_name;
@property (nonatomic, strong) LoginRespList *name_value_list;


@end
