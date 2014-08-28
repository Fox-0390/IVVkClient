//
//  MEUser.h
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 16/06/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEUser : NSObject

@property(strong,nonatomic) NSString* firstName;

@property(strong,nonatomic) NSString* lastName;

@property  NSInteger user_id;



@property(strong,nonatomic) NSURL*  imageUrl;

@property(strong,nonatomic) NSURL*  photo_100;

@property(strong,nonatomic) NSURL*  photo_200;
@property(strong,nonatomic) NSURL*   photo_max_orig;
-(id) initWithSerbverResponse:(NSDictionary*) responseDictionary;

@end
