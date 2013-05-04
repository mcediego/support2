//
//  crmLogin.m
//  Support
//
//  Created by DieGo on 3/9/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import "crmLogin.h"

//Response Data Map
#import "LoginResp.h"
#import "LoginRespList.h"
#import "crmField.h"
#import "crmFieldFlag.h"

//Post Data Map
#import "SugarArg.h"

//DELEGATE
#import "crmLoginDelegate.h"

#import "RestKit/RestKit.h"
#import "RestKit/RKMIMETypeSerialization.h"
#import "RestKit/RKNSJSONSerialization.h"




@implementation crmLogin

@synthesize delegate = _delegate;

-(void)login:(NSString *)user_name password:(NSString *)password {
    
    
    
    //RESP
    RKObjectMapping *field = [RKObjectMapping mappingForClass:[crmField class]];
    [field addAttributeMappingsFromArray:@[@"name",@"value"]];
    
    RKObjectMapping *fieldBool = [RKObjectMapping mappingForClass:[crmFieldFlag class]];
    [fieldBool addAttributeMappingsFromArray:@[@"name",@"value"]];
    
    RKObjectMapping *nameValueList = [RKObjectMapping mappingForClass:[LoginRespList class]];
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[LoginResp class]];
    [responseMapping addAttributeMappingsFromArray:@[@"id",@"module_name"]];
    
    
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_id" toKeyPath:@"user_id" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_name" toKeyPath:@"user_name" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_language" toKeyPath:@"user_language" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_currency_id" toKeyPath:@"user_currency_id" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_is_admin" toKeyPath:@"user_is_admin" withMapping:fieldBool]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_default_team_id" toKeyPath:@"user_default_team_id" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_default_dateformat" toKeyPath:@"user_default_dateformat" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_default_timeformat" toKeyPath:@"user_default_timeformat" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_number_seperator" toKeyPath:@"user_number_seperator" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_decimal_seperator" toKeyPath:@"user_decimal_seperator" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"mobile_max_list_entries" toKeyPath:@"mobile_max_list_entries" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"mobile_max_subpanel_entries" toKeyPath:@"mobile_max_subpanel_entries" withMapping:field]];
    [nameValueList addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_currency_name" toKeyPath:@"user_currency_name" withMapping:field]];
    
    [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"name_value_list" toKeyPath:@"name_value_list" withMapping:nameValueList]];
    
    
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
    RKResponseDescriptor *articleDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping pathPattern:@"rest.php" keyPath:@"" statusCodes:statusCodes];
    
    
    
    //REQ
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping]; // objectClass == NSMutableDictionary
    [requestMapping addAttributeMappingsFromArray:@[@"method", @"input_type", @"response_type", @"rest_data"]];
    
    
    // For any object of class Article, serialize into an NSMutableDictionary using the given mapping and nest
    // under the 'article' key path
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:requestMapping objectClass:[SugarArg class] rootKeyPath:nil];
    
    
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost/sugarce6510/service/v4"]];
    
    [manager addRequestDescriptor:requestDescriptor];
    [manager addResponseDescriptor:articleDescriptor];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/html"];
    
    
    //JSON serialization
    /*
     SugarCRM Bug 47259
     Sugar rest system require a specific order of arguments
     */
    /*
    NSArray *inputDataDummy = [NSArray arrayWithObjects:nil, nil];
    NSDictionary *inputData =@{
        @"application_name":@"RestTest2",
        @"user_auth":@{
             @"user_name":@"admin",
             @"password":@"37cdf91cb63badb018c3de5698104f56",
             @"version":@"1",
             },
        @"name_value_list":inputDataDummy,
    };
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:inputData options:nil error:&error];
    NSString *jsonDataUTF8 = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    */
    
    SugarArg *loginarg = [SugarArg new];
    loginarg.method = @"login";
    loginarg.input_type = @"JSON";
    loginarg.response_type = @"JSON";
    loginarg.rest_data = [NSString stringWithFormat:@"{\"user_auth\":{\"user_name\":\"%@\",\"password\":\"%@\",\"version\":\"1\"},\"application_name\":\"RestTest\",\"name_value_list\":[]}", user_name,password];
    
    
    
    NSLog(@"dynamic %@",loginarg.rest_data);
    
    [manager postObject:loginarg path:@"rest.php" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *response) {
        
        NSLog(@"OK");
        
        LoginResp *ld = [response firstObject];
        NSLog(@"Number of result %@", ld.id);
        
        [self.delegate loginResponse:ld];
        //NSLog(@"%@",output);
        //output = [NSString stringWithFormat:@"%@",ld.id];
        //[self loginId] = @"";
        //loginId = [NSString stringWithFormat:@"%@",ld.id];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
        NSLog(@"NO");
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];
    
    

}




@end
