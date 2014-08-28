//
//  MEUser.m
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 16/06/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "MEUser.h"

@implementation MEUser
-(id)initWithSerbverResponse:(NSDictionary *)responseDictionary
{
    self=[super init
          ];
    if (self
        ) {
        self.firstName=[responseDictionary objectForKey:@"first_name"];
                self.lastName=[responseDictionary objectForKey:@"last_name"];
        
        NSString* urlString=[responseDictionary objectForKey:@"photo_50"];
        NSString* photo_100String=[responseDictionary objectForKey:@"photo_100"];
        NSString* photo_200String=[responseDictionary objectForKey:@"photo_200"];
        NSString* photo_max_origString=[responseDictionary objectForKey:@"photo_max_orig"];
        self.user_id=[[responseDictionary objectForKey:@"user_id"] integerValue];
        if(urlString)
        self.imageUrl=[NSURL URLWithString:urlString];
        if (photo_100String) {
            self.photo_100=[NSURL URLWithString:photo_100String];
        }
        
        if (photo_200String) {
            self.photo_200=[NSURL URLWithString:photo_200String];
        }
        if (photo_max_origString) {
            self.photo_max_orig=[NSURL URLWithString:photo_max_origString];
        }

    }
    return  self;
    
}
@end
