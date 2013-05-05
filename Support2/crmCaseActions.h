//
//  crmCaseActions.h
//  Support
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface crmCaseActions : NSObject

-(void) newCase: (NSString *)session_id name:(NSString *)name description:(NSString *)description crm_url:(NSString *)crm_url;
-(void) listCase;
-(void) editCase;

@end
