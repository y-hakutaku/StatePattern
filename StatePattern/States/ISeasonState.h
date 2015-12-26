//
//  ISeasonState.h
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import <Foundation/Foundation.h>

@class ISeasonState;
@protocol SeasonStateProtocol <NSObject>
+ (instancetype) sharedInstance;
- (void)resumeState;
// 季節系Stateでのみ実装
@optional
- (NSString*)currentStateText;
// start系のみで実装
@optional
- (void)startChangeOfSeasons;
@end

@protocol SeasonStateDelegate <NSObject>
- (void)currentSeasonText:(NSString*)currentSeasonText;
- (void)updateSeasonState:(ISeasonState<SeasonStateProtocol>*)currentSeasonState;
@end

@interface ISeasonState : NSObject
@property (nonatomic,weak) id <SeasonStateDelegate>delegate;
@end
