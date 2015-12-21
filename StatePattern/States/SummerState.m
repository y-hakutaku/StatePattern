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
	if (self) {
		// do something
	}
	return self;
}

-(NSString *)currentSeasonText {
	return @"夏";
}

- (void)changeNextSeason {
	if([self.delegate respondsToSelector:@selector(currentSeasonText:currentSeasonState:)]){
		[self.delegate currentSeasonText:[self currentSeasonText] currentSeasonState:[FallState sharedInstance]];
	};
}

@end
