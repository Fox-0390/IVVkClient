//
//  MEManagerAPI.m
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 16/06/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "MEManagerAPI.h"
#import "AFNetworking.h"
#import "MEUser.h"
#import "MEAudioModel.h"
#import "MEAutorizationViewController.h"
#import "MEAccessToken.h"
#import "MyInfoData.h"
@interface MEServerManagerAPI()
@property (strong,nonatomic) AFHTTPRequestOperationManager* requestOperationManager;
@property (strong,nonatomic) MEAccessToken* token;
@end

@implementation MEServerManagerAPI



-(id)init
{
    self=[super init];
    if (self) {
        NSURL* url=[NSURL URLWithString:@"https://api.vk.com/method/"];
        
        self.requestOperationManager=[[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];

    }
    return  self;
}

+(MEServerManagerAPI*)sharedManager
{
   
        static MEServerManagerAPI* manager=nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager=[[MEServerManagerAPI alloc]init];
        });
    return  manager;
   

}

-(void) getFriendsWithOffset:(NSInteger) offset
                       count:(NSInteger) count
                   onSuccess:(void(^)(NSArray* friends)) success
                   onFailure:(void(^)(NSError* error,NSInteger statusCode)) failure
{
  
    NSDictionary* params=[NSDictionary dictionaryWithObjectsAndKeys:@"4745633",
                          @"user_id",
                          @"name",
                          @"order",
                          @(count),@"count",
                          @(offset),@"offset",
                          @"photo_50,photo_100,photo_200,photo_max_orig",@"fields",
                          @"nom",@"name_case", nil];
    
    
    
    [self.requestOperationManager
     GET:@"friends.get"
     parameters:params
         success:^(AFHTTPRequestOperation  *operation,id responseObject)
     {
         
         
         NSArray* friendsArray=[responseObject objectForKey:@"response"];
         NSMutableArray* objectArray=[NSMutableArray array];
         for (NSDictionary* dict in friendsArray) {
             MEUser* user=[[MEUser alloc] initWithSerbverResponse:dict];
             [objectArray addObject:user];
         }
         
         if (success) {
             success(objectArray);
         }
         NSLog(@"JSON: %@",responseObject);
         
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
     }];
}


-(void) getAudioFriendsWithOffset:(NSInteger) offset
                     count:(NSInteger) count
                   user_id:(NSInteger) user_id
                 onSuccess:(void(^)(NSArray* audio)) success
                 onFailure:(void(^)(NSError* error,NSInteger statusCode)) failure;

{
    NSDictionary* params=[NSDictionary dictionaryWithObjectsAndKeys:
                          @(user_id),@"user_id",
                          @(count),@"count",
                          @(offset),@"offset",
                          [self.token token],@"access_token",
                          nil];
    
    
    [self.requestOperationManager
     GET:@"audio.get"
     parameters:params
     success:^(AFHTTPRequestOperation  *operation,id responseObject)
     {
         
         
         NSArray* friendsArray=[responseObject objectForKey:@"response"];
         NSMutableArray* objectArray=[NSMutableArray array];
         for (NSDictionary* dict in friendsArray) {
             MEAudioModel* user=[[MEAudioModel alloc] initWithSerbverResponse:dict];
             [objectArray addObject:user];
         }
         
         if (success) {
             success(objectArray);
         }
         NSLog(@"JSON: %@",responseObject);
         
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Fail");
     }];
    
    
}

-(void)getUserInfo:(void(^)(MyInfoData* MyInfoData)) completion
                    user_id:(NSInteger) user_id

{
 
    
   
    NSDictionary* params=[NSDictionary dictionaryWithObjectsAndKeys:
                          @(user_id),@"user_id",
                          @"photo_100",
                          @"photo_50",
                          @"online",
                          @"nickname",
                          @"city",
                          @"can_see_all_posts",
                          @"can_write_private_message",
                          @"can_see_audio",
                          @"personal",
                          @"relation",
                          @"counters",
                          @"universities",
                          @"home_town",
                          [self.token token],@"access_token",
                          nil];
    [self.requestOperationManager
     GET:@"users.get"
     parameters:params
     success:^(AFHTTPRequestOperation  *operation,id responseObject)
     {
         
         
         NSDictionary* friendsArray=[responseObject objectForKey:@"response"];
         NSMutableArray* objectArray=[NSMutableArray array];
        
         MyInfoData* myInfo=[[MyInfoData alloc] initWithSerbverResponse:friendsArray];
         
         if (completion) {
             completion(myInfo);
         }
         NSLog(@"JSON: %@",responseObject);
         
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Fail");
     }];
}


-(void)getMyInfo:(void(^)(MyInfoData* MyInfoData)) completion

{
    
    
    //, ,, timezone ,city,verified, can_see_all_posts ,can_write_private_message,can_see_audio ,personal ,relation,counters ,universities,home_town
    NSDictionary* params=[NSDictionary dictionaryWithObjectsAndKeys:
                          self.token.userID,@"user_id",
                           @"online,nickname,city,can_see_all_posts,can_write_private_message,can_see_audio,photo_50,photo_100,photo_200,photo_max_orig,home_town,universities,counters,relation,personal",@"fields",
                          [self.token token],@"access_token",
                          nil];
    [self.requestOperationManager
     GET:@"users.get"
     parameters:params
     success:^(AFHTTPRequestOperation  *operation,id responseObject)
     {
         
         
         NSArray* friendsArray=[responseObject objectForKey:@"response"];
          NSLog(@"JSON: %@",responseObject);
         MyInfoData* myInfo=[[MyInfoData alloc] initWithSerbverResponse:(NSDictionary*)[friendsArray objectAtIndex:0]];
         
         if (completion) {
             completion(myInfo);
         }
         NSLog(@"JSON: %@",responseObject);
         
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Fail");
     }];
}


-(void)authorizeUser:(void(^)(MEUser* user)) completion
{
    MEAutorizationViewController* login=[[MEAutorizationViewController alloc] initWithCompletionBlock:^(MEAccessToken *token) {
        self.token=token;
        if (completion) {
            completion(nil);
        }

    }];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:login];
    
    UIViewController* main=[UIApplication sharedApplication].keyWindow.rootViewController;
    [main presentViewController:nav animated:YES completion:nil];
    
}


@end
