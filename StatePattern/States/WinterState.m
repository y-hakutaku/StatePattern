//
//  WinterState.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "WinterState.h"
#import "SpringState.h"

@implementation WinterState

+ (instancetype) sharedInstance {
	static WinterState *_instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[WinterState alloc] initInstance];
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
	return @"冬";
}

- (void)changeNextSeason {
	if([self.delegate respondsToSelector:@selector(currentSeasonText:currentSeasonState:)]){
		[self.delegate currentSeasonText:[self currentSeasonText] currentSeasonState:[SpringState sharedInstance]];
	};
}
@end