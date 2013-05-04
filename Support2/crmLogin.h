//
//  crmLogin.h
//  Support
//
//  Created by DieGo on 3/9/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "crmLoginDelegate.h"

@interface crmLogin : NSObject <crmLoginDelegate> {

    
__weak id <crmLoginDelegate> _delegate;
}

-(void) login:(NSString *)user_name password:(NSString *)password;

@property (nonatomic,strong) NSString * user_name;
@property (nonatomic,strong) NSString * password;

@property(nonatomic, weak) id <crmLoginDelegate> delegate;

@end
