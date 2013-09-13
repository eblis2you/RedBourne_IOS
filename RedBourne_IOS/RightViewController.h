//
//  RightViewController.h
//  RedBourne
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChildModel;
#import "ChildSelectionDelegate.h"

@interface RightViewController : UIViewController
    <UISplitViewControllerDelegate, ChildSelectionDelegate>

@property (nonatomic, strong) UIPopoverController *popover;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UINavigationItem *navBarItem;

@property (weak, nonatomic) IBOutlet UILabel *childLabel1;
@property (weak, nonatomic) IBOutlet UILabel *childLabel2;
@property (weak, nonatomic) IBOutlet UILabel *childLabel3;
@property (weak, nonatomic) IBOutlet UILabel *childLabel4;

@property (weak, nonatomic) IBOutlet UILabel *childLabel1_R;
@property (weak, nonatomic) IBOutlet UILabel *childLabel2_R;
@property (weak, nonatomic) IBOutlet UILabel *childLabel3_R;
@property (weak, nonatomic) IBOutlet UILabel *childLabel4_R;

@property (nonatomic, strong) ChildModel *child;

@property (nonatomic, strong) UISegmentedControl *segmentedControl;


@end
