//
//  ViewController.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "ViewController.h"
#import "StateContext.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentSeasonNameLabel;
- (IBAction)startChangeOfSeasonsAction:(id)sender;


@end

@implementation ViewController

#pragma View Life Cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma private methods

- (void) setSeasonText {
	self.currentSeasonNameLabel.text = [[StateContext sharedInstance]seasonText];
}

#pragma UI Actions

- (IBAction)startChangeOfSeasonsAction:(id)sender {
	[self setSeasonText];
	__weak typeof(self)wSelf = self;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[[StateContext sharedInstance] changeOfSeasons];
		[wSelf startChangeOfSeasonsAction:sender];
	});
	
}
@end
