//
//  StateContext.h
//  StatePattern
//
//  Created by 白澤 義康 on 2015/12/04.
//  Copyright © 2015年 白澤 義康. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StateContext : NSObject
+ (instancetype) sharedInstance;
- (void)changeOfSeasons;
- (NSString*)seasonText;
@end
