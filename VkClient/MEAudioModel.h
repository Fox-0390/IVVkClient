//
//  MEAudioModel.h
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 18/06/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEAudioModel : NSObject
@property(strong,nonatomic) NSString* artist;

@property(strong,nonatomic) NSString* title;
@property(strong,nonatomic) NSData* duration;

@property(strong,nonatomic) NSURL*  audioUrl;

-(id) initWithSerbverResponse:(NSDictionary*) responseDictionary;
@end
