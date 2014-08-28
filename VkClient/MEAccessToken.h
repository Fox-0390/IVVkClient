//
//  MEAccessToken.h
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 20/06/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEAccessToken : NSObject

@property(strong,nonatomic) NSString* token;
@property(strong,nonatomic) NSDate* expirationDate;
@property(strong,nonatomic) NSString* userID;


@end
