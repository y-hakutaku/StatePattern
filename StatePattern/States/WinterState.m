//
//  WinterState.m
//  StatePattern
//
//  Created by 白澤 義康 on 2015/12/05.
//  Copyright © 2015年 白澤 義康. All rights reserved.
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

- (SeasonState*)chanegeNextSeason{
	return [SpringState sharedInstance];
}
@end
