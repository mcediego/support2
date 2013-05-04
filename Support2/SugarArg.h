//
//  loginArg.h
//  Support
//
//  Created by DieGo on 3/9/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SugarArg : NSObject

@property (nonatomic, copy) NSString *method;
@property (nonatomic, copy) NSString *input_type;
@property (nonatomic, copy) NSString *response_type;
@property (nonatomic, copy) NSString *rest_data;

@end
