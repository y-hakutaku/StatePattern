//
//  IdleState.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "IdleState.h"
#import "SpringState.h"

@implementation IdleState

+ (instancetype) sharedInstance {
	static IdleState * _instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[IdleState alloc] initInstance];
	});
	
	return _instance;
}

- (id)initInstance {
	self = [super init];
	return self;
}

- (void)startChangeOfSeasons {
	if([self.delegate respondsToSelector:@selector(currentSeasonText:)]) {
		[self.delegate currentSeasonText:[self currentStateText]];
	}
	
	if([self.delegate respondsToSelector:@selector(updateSeasonState:)]) {
		[self.delegate updateSeasonState:[SpringState sharedInstance]];
		[[SpringState sharedInstance] resumeState];
	}
}

- (void)resumeState {
	if ([self.delegate respondsToSelector:@selector(currentSeasonText:)]) {
		[self.delegate currentSeasonText:[self currentStateText]];
	}
}

@end
