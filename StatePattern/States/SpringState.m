//
//  SpringState.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "SpringState.h"
#import "SummerState.h"

@implementation SpringState

+ (instancetype) sharedInstance {
	static SpringState * _instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[SpringState alloc] initInstance];
	});
	
	return _instance;
}

+ (instancetype)initialState{
	return [SpringState sharedInstance];
}

- (id)initInstance {
	self = [super init];
	if (self) {
		// do something
	}
	return self;
}

-(NSString *)currentSeasonText {
	return @"春";
}

- (void)changeNextSeason {
	if([self.delegate respondsToSelector:@selector(currentSeasonText:currentSeasonState:)]) {
		[self.delegate currentSeasonText:[self currentSeasonText] currentSeasonState:[SummerState sharedInstance]];
	};
}

@end
