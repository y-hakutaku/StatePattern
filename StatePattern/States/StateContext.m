//
//  StateContext.m
//  StatePattern
//
//  Created by 白澤 義康 on 2015/12/04.
//  Copyright © 2015年 白澤 義康. All rights reserved.
//

#import "StateContext.h"
#import "SpringState.h"

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
		self.currentSeasonState = [SpringState initialState];
		
	}
	return self;
}

- (NSString*)seasonText {
	return [_currentSeasonState currentSeasonText];
}

- (void) changeOfSeasons {
	self.currentSeasonState.delegate = self;
	[self.currentSeasonState chanegeNextSeason];
}

#pragma SeasonState delegate
- (void)currentSeasonText:(NSString*)currentSeasonText currentSeasonState:(SeasonState*)currentSeasonState{
	self.currentSeasonState = currentSeasonState;
	if ([self.delegate respondsToSelector:@selector(currentSeasonText:)]) {
		[self.delegate currentSeasonText:currentSeasonText];
	}
};
@end
