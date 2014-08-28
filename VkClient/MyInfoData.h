//
//  MyInfoData.h
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 21/07/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyInfoData : NSObject
@property(strong,nonatomic) NSString* user_id;
-(id) initWithSerbverResponse:(NSDictionary*) responseDictionary;
@property(strong,nonatomic) NSString* city;
@property BOOL can_see_all_posts;
@property(strong,nonatomic) NSString* can_write_private_message;
@property BOOL can_see_audio;
@property(strong,nonatomic) NSString* personal;
@property(strong,nonatomic) NSString* universities;
@property(strong,nonatomic) NSString* home_town;
@property(strong,nonatomic) NSURL* photo_200;
@property(strong,nonatomic) NSURL* photo_100;
@property(strong,nonatomic) NSURL* photo_max_orig;
@property(strong,nonatomic) NSURL* photo_50;
@property BOOL online;

@property NSInteger count_albums;
@property NSInteger count_videos;
@property NSInteger count_audios;
@property NSInteger count_photos;
@property NSInteger count_notes;
@property NSInteger count_friends;
@property NSInteger count_groups;
@property NSInteger count_online_friends;
@property NSInteger count_mutual_friends;
@property NSInteger count_user_videos;
@property NSInteger count_followers;


@end
