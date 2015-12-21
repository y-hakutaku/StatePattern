//
//  FallState.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "FallState.h"
#import "WinterState.h"

@implementation FallState

+ (instancetype) sharedInstance {
	static FallState *_instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[FallState alloc] initInstance];
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
	return @"秋";
}

- (void)changeNextSeason {
	if([self.delegate respondsToSelector:@selector(currentSeasonText:currentSeasonState:)]){
		[self.delegate currentSeasonText:[self currentSeasonText] currentSeasonState:[WinterState sharedInstance]];
	};
}
@end
