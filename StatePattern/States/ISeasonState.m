//
//  SeasonState.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "ISeasonState.h"

@interface ISeasonState ()<SeasonStateProtocol>

@end

@implementation ISeasonState

+ (instancetype) sharedInstance {
	static ISeasonState * _instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[ISeasonState alloc] initInstance];
	});
	
	return _instance;
}

- (id)initInstance {
	self = [super init];
	return self;
}

- (NSString*)currentStateText {
	NSLog(@"Current SeasonState is %@ ",[self class]);
	return nil;
}

- (void)resumeState {
	NSLog(@"Current SeasonState is %@ ",[self class]);
}

- (void)startChangeOfSeasons {
	NSLog(@"Current SeasonState is %@. could not start change of season",[self class]);
}

@end
