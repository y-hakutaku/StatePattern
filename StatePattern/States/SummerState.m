//
//  SummerState.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "SummerState.h"
#import "FallState.h"

@implementation SummerState

+ (instancetype) sharedInstance {
	static SummerState *_instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[SummerState alloc] initInstance];
	});
	
	return _instance;
}

- (id)initInstance {
	self = [super init];
	return self;
}

-(NSString *)currentStateText {
	return @"夏";
}

- (void)resumeState {
	if([self.delegate respondsToSelector:@selector(currentSeasonText:)]) {
		[self.delegate currentSeasonText:[self currentStateText]];
	};
	[self progressState];
}

- (void)progressState {
	__weak typeof (self) wSelf = self;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
		if([wSelf.delegate respondsToSelector:@selector(updateSeasonState:)]) {
			[wSelf.delegate updateSeasonState:[FallState sharedInstance]];
			[[FallState sharedInstance] resumeState];
		}
		
	});
}

@end
