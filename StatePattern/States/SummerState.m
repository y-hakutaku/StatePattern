//
//  CatState.m
//  StatePattern
//
//  Created by 白澤 義康 on 2015/12/04.
//  Copyright © 2015年 白澤 義康. All rights reserved.
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

- (SeasonState*)chanegeNextSeason{
	return [FallState sharedInstance];
}

@end
