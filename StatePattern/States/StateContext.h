//
//  StateContext.h
//  StatePattern
//
//  Created by 白澤 義康 on 2015/12/04.
//  Copyright © 2015年 白澤 義康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SeasonState.h"

@class StateContext;
@protocol StateContextDelegate <NSObject>
@required
- (void)currentSeasonText:(NSString*)currentSeasonText;
@end

@interface StateContext : NSObject <SeasonStateDelegate>
+ (instancetype) sharedInstance;
- (NSString*)seasonText;
- (void) changeOfSeasons;
@property (nonatomic,weak)SeasonState * currentSeasonState;
@property (nonatomic,weak) id<StateContextDelegate> delegate;
@end


