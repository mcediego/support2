//
//  SetEntryResp.h
//  Support
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SetEntryCaseList.h"

@interface SetEntryResp : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, strong) SetEntryCaseList *entry_list;


@end
