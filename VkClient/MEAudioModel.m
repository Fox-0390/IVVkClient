//
//  MEAudioModel.m
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 18/06/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "MEAudioModel.h"

@implementation MEAudioModel
-(id)initWithSerbverResponse:(NSDictionary *)responseDictionary
{
    self=[super init
          ];
    if (self) {
        self.artist=[responseDictionary objectForKey:@"artist"];
        self.title=[responseDictionary objectForKey:@"title"];
        
        NSString* urlString=[responseDictionary objectForKey:@"url"];
        
        if(urlString)
            self.audioUrl=[NSURL URLWithString:urlString];
        
        
        
    }
    return  self;
    
}
@end
