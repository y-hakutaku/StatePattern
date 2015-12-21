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


- (NSString*)currentSeasonText {
	return nil;
}
+ (instancetype) initialState {
	return [IdleState sharedInstance];
}
- (void)progress {
	if([self.delegate respondsToSelector:@selector(currentSeasonText:currentSeasonState:)]) {
		[self.delegate currentSeasonText:[self currentSeasonText] currentSeasonState:[SpringState sharedInstance]];
		[[SpringState sharedInstance] changeNextSeason];
	};
}

@end
