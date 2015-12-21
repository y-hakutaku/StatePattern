//
//  SeasonState.h
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import <Foundation/Foundation.h>

@class SeasonState;
@protocol SeasonStateDelegate <NSObject>
- (void)currentSeasonText:(NSString*)currentSeasonText currentSeasonState:(SeasonState*)currentSeasonState;
@end

@interface SeasonState : NSObject
+ (instancetype) sharedInstance;
- (NSString*)currentSeasonText;
+ (instancetype) initialState;
- (void)changeNextSeason;
@property (nonatomic,weak) id <SeasonStateDelegate>delegate;
@end
