//
//  crmLoginDelegate.h
//  Support
//
//  Created by DieGo on 3/9/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginResp.h"

@protocol crmLoginDelegate

-(void)loginResponse:(LoginResp *)response;

@end
