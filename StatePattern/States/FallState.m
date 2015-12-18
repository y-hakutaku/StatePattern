//
//  FallState.m
//  StatePattern
//
//  Created by 白澤 義康 on 2015/12/05.
//  Copyright © 2015年 白澤 義康. All rights reserved.
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

- (void)chanegeNextSeason{
	if([self.delegate respondsToSelector:@selector(currentSeasonText:currentSeasonState:)]){
		[self.delegate currentSeasonText:@"秋" currentSeasonState:[WinterState sharedInstance]];
	};
}
@end
