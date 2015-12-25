//
//  StateContext.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "StateContext.h"
#import "IdleState.h"

@implementation StateContext

+ (instancetype) sharedInstance {
	static StateContext * _instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[StateContext alloc] initInstance];
	});

	return _instance;
}

- (id)initInstance {
	self = [super init];
	if (self) {
		self.currentSeasonState = [IdleState sharedInstance];		
	}
	return self;
}

- (NSString*)seasonText {
	return [_currentSeasonState currentStateText];
}

- (void) changeOfSeasons {
	if ([self.currentSeasonState isMemberOfClass:[IdleState class]]) {
		self.currentSeasonState.delegate = self;
		[self.currentSeasonState startChangeOfSeasons];
	} else {
		NSLog(@"Current State is %@ could not start change of season",[self.currentSeasonState class]);
	}
}

#pragma SeasonState delegate
- (void)updateSeasonState:(ISeasonState<SeasonStateProtocol>*)currentSeasonState {
	self.currentSeasonState = currentSeasonState;
	self.currentSeasonState.delegate = self;
}

- (void)currentSeasonText:(NSString*)currentSeasonText {
	if ([self.delegate respondsToSelector:@selector(currentSeasonText:)]) {
		[self.delegate currentSeasonText:currentSeasonText];
	}
};
@end
