//
//  MyInfoData.m
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 21/07/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "MyInfoData.h"

@implementation MyInfoData
-(id)initWithSerbverResponse:(NSDictionary *)responseDictionary
{
    self=[super init];
    if (self) {
        if([responseDictionary objectForKey:@"photo_200"])
            self.photo_200=[NSURL URLWithString:[responseDictionary objectForKey:@"photo_200"]];
        if([responseDictionary objectForKey:@"photo_max_orig"])
            self.photo_max_orig=[NSURL URLWithString:[responseDictionary objectForKey:@"photo_max_orig"]];

        if([responseDictionary objectForKey:@"photo_100"])
         self.photo_100=[NSURL URLWithString:[responseDictionary objectForKey:@"photo_100"]];
       
        if([responseDictionary objectForKey:@"photo_50"])
            self.photo_50=[NSURL URLWithString:[responseDictionary objectForKey:@"photo_50"]];

       
         if(1 ==  [[responseDictionary objectForKey:@"online" ] intValue])
         {
             self.online=TRUE;
         }
         else self.online=FALSE;
       
        if(1== [[responseDictionary objectForKey:@"can_see_all_posts"] intValue]  )
        {
            self.can_see_all_posts=TRUE;
        }
        else self.can_see_all_posts=FALSE;
       
        if(1== [[responseDictionary objectForKey:@"can_see_audio"] intValue])
        {
            self.can_see_audio=TRUE;
        }
        else self.can_see_audio=FALSE;
        if(1==[[responseDictionary objectForKey:@"can_see_all_posts"] intValue])
        {
            self.can_see_all_posts=TRUE;
        }
        else self.can_see_all_posts=FALSE;

        
        self.home_town=[responseDictionary objectForKey:@"home_town"];
        self.city=[responseDictionary objectForKey:@"city"];
        self.home_town=[responseDictionary objectForKey:@"home_town"];
      
        
        //counters
        self.count_albums=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"albums"] intValue];
        self.count_videos=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"videos"] intValue];
        self.count_audios=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"audios"] intValue];
        self.count_photos=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"photos"] intValue];
        self.count_notes=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"notes"] intValue];
        self.count_friends=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"friends"] intValue];
        self.count_groups=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"groups"] intValue];
        self.count_online_friends=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"online_friends"] intValue];
        self.count_mutual_friends=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"mutual_friends"] intValue];
        self.count_user_videos=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"user_videos"] intValue];
        self.count_followers=[[[responseDictionary objectForKey:@"counters"] objectForKey:@"followers"] intValue];
             }
    return  self;
}

@end
