//
//  AnimalState.m
//  StatePattern
//
//  Created by 白澤 義康 on 2015/12/04.
//  Copyright © 2015年 白澤 義康. All rights reserved.
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

- (SeasonState*)chanegeNextSeason{
	return [SummerState sharedInstance];
}

@end
