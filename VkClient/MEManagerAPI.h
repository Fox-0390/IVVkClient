//
//  MEManagerAPI.h
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 16/06/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MEUser;
@class MyInfoData;
@interface MEServerManagerAPI : NSObject

+(MEServerManagerAPI*) sharedManager;


-(void) getFriendsWithOffset:(NSInteger) offset
                   count:(NSInteger) count
                   onSuccess:(void(^)(NSArray* friends)) success
                   onFailure:(void(^)(NSError* error,NSInteger statusCode)) failure;

-(void)authorizeUser:(void(^)(MEUser* user)) completion;

-(void) getAudioFriendsWithOffset:(NSInteger) offset
                     count:(NSInteger) count
                   user_id:(NSInteger) user_id
                 onSuccess:(void(^)(NSArray* audio)) success
                 onFailure:(void(^)(NSError* error,NSInteger statusCode)) failure;

-(void)getMyInfo:(void(^)(MyInfoData* MyInfoData)) completion;

-(void)getUserInfo:(void(^)(MyInfoData* MyInfoData)) completion
           user_id:(NSInteger) user_id;
@end
