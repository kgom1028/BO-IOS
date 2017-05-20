//
//  NetworkParser.h
//  FitMusic
//
//  Created by BoHuang on 7/18/16.
//  Copyright © 2016 Jong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Global.h"

typedef void (^NetworkCompletionBlock)(NSDictionary*dict, NSError* error);

@interface NetworkParser : NSObject
+ (instancetype)shared;

- (AFHTTPRequestOperation*)onUpdateToken:(NSString*) token withCompletionBlock:(NetworkCompletionBlock)completionBlock;

@end
