//
//  NetworkParser.m
//  FitMusic
//
//  Created by BoHuang on 7/18/16.
//  Copyright © 2016 Jong. All rights reserved.
//

#import "NetworkParser.h"

@implementation NetworkParser


+ (instancetype)shared
{
    static NetworkParser *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkParser alloc] init];
        
    });
    
    return sharedInstance;
}

-(BOOL)checkResponse:(NSDictionary*)dict{
    return true;
}

- (AFHTTPRequestOperation*)onUpdateToken:(NSString*) token withCompletionBlock:(NetworkCompletionBlock)completionBlock{
    NSString *serverurl = m_baseUrl ;
    serverurl = [serverurl stringByAppendingString:m_register_token];
    
    NSArray *objects = [NSArray arrayWithObjects:token, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"token", nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestOperation* operation = [manager POST:serverurl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(completionBlock){
            if ([self checkResponse:responseObject]) {
                
                completionBlock(responseObject,nil);
            }else{
                completionBlock(nil,[[NSError alloc] init]);
            }
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(operation.responseString);
        if(completionBlock) {
            completionBlock(nil,error);
        }
        
    }];
    return operation;
}

@end
