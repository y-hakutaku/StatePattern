//
//  AnimalState.h
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeasonState : NSObject
+ (instancetype) sharedInstance;
- (NSString*)currentSeasonText;
- (SeasonState*)chanegeNextSeason;
+ (instancetype) initialState;
@end

@protocol SeasonState <NSObject>
@required
- (NSString*)currentSeasonText;
@optional
+ (instancetype) initialState;

@end

