//
//  crmCaseActions.m
//  Support
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import "crmCaseActions.h"

//Response Data Map
#import "SetEntryResp.h"
#import "SetEntryCaseList.h"
#import "crmField.h"

//Post Data Map
#import "SugarArg.h"

#import "RestKit/RestKit.h"
#import "RestKit/RKMIMETypeSerialization.h"
#import "RestKit/RKNSJSONSerialization.h"

@implementation crmCaseActions

-(void) newCase: (NSString *)session_id name:(NSString *)name description:(NSString *)description crm_url:(NSString *)crm_url {
    
    //RESP
    RKObjectMapping *field = [RKObjectMapping mappingForClass:[crmField class]];
    [field addAttributeMappingsFromArray:@[@"name",@"value"]];
    
    RKObjectMapping *nameValueList = [RKObjectMapping mappingForClass:[SetEntryCaseList class]];
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[SetEntryResp class]];
    [responseMapping addAttributeMappingsFromArray:@[@"id"]];
    
    
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"name" toKeyPath:@"name" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"description" toKeyPath:@"description" withMapping:field]];
    //[nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_language" toKeyPath:@"user_language" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"assigned_user_id" toKeyPath:@"assigned_user_id" withMapping:field]];
    
    
    [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"entry_list" toKeyPath:@"entry_list" withMapping:nameValueList]];
    
    
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
    RKResponseDescriptor *articleDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping pathPattern:@"rest.php" keyPath:@"" statusCodes:statusCodes];
    
    
    
    //REQ
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping]; // objectClass == NSMutableDictionary
    [requestMapping addAttributeMappingsFromArray:@[@"method", @"input_type", @"response_type", @"rest_data"]];
    
    
    // For any object of class Article, serialize into an NSMutableDictionary using the given mapping and nest
    // under the 'article' key path
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:requestMapping objectClass:[SugarArg class] rootKeyPath:nil];
    
    
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:crm_url]];
    
    [manager addRequestDescriptor:requestDescriptor];
    [manager addResponseDescriptor:articleDescriptor];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/html"];
    
    
    
    SugarArg *loginarg = [SugarArg new];
    loginarg.method = @"set_entry";
    loginarg.input_type = @"JSON";
    loginarg.response_type = @"JSON";
    loginarg.rest_data = [NSString stringWithFormat:@"{\"session\":\"%@\",\"module_name\":\"Cases\",\"name_value_list\":{\"name\":{\"name\":\"name\",\"value\":\"%@\"},\"description\":{\"name\":\"description\",\"value\":\"%@\"},\"assigned_user_id\":{\"name\":\"assigned_user_id\",\"value\":\"1\"}}}", session_id,name,description];

    
    NSLog(@"dynamic %@",loginarg.rest_data);
    
    [manager postObject:loginarg path:@"rest.php" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *response) {
        
        NSLog(@"OK");
        
        SetEntryResp *ld = [response firstObject];
        NSLog(@"Number of result %@", ld.id);
        
        //[self.delegate loginResponse:ld];
        //NSLog(@"%@",output);
        //output = [NSString stringWithFormat:@"%@",ld.id];
        //[self loginId] = @"";
        //loginId = [NSString stringWithFormat:@"%@",ld.id];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
        NSLog(@"NO");
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];
}

-(void) editCase {
    
}

-(void) listCase {
    
}
@end


