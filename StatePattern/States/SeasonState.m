//
//  SeasonState.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "SeasonState.h"

@implementation SeasonState

+ (instancetype) sharedInstance {
	static SeasonState * _instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[SeasonState alloc] initInstance];
	});
	
	return _instance;
}

- (id)initInstance {
	self = [super init];
	return self;
}

+ (instancetype) initialState {
	[NSException raise:NSInternalInconsistencyException
				format:@"This Is Optional method You must override %@ in a initialStateClass", NSStringFromSelector(_cmd)];
	return nil;
}

- (NSString*)currentSeasonText {
	[NSException raise:NSInternalInconsistencyException
				format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
	return nil;
}

- (void)changeNextSeason {
	[NSException raise:NSInternalInconsistencyException
				format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end
