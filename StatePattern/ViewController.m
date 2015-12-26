//
//  ViewController.m
//  StatePattern
//
//  Created by y.hakutaku on 2015/12/04.
//  Copyright © 2015年 y.hakutaku All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentSeasonNameLabel;
- (IBAction)startChangeOfSeasonsAction:(id)sender;
@end

@implementation ViewController

#pragma View Life Cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	[StateContext sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma UI Actions
- (IBAction)startChangeOfSeasonsAction:(id)sender {
	[[StateContext sharedInstance] changeOfSeasons];
}

#pragma StateContext delegate
- (void)currentSeasonText:(NSString*)currentSeasonText {
	self.currentSeasonNameLabel.text = currentSeasonText;
}
@end
