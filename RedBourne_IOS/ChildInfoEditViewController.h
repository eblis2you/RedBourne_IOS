//
//  ChildInfoEditViewController.h
//  RedBourne
//
//  Created by Jerry on 3/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildModel.h"


@interface ChildInfoEditViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) ChildModel *child;



- (void)saveName;
- (void)saveChildWhenClosing;


@end
