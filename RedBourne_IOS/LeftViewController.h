//
//  LeftViewController.h
//  RedBourne
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChildModel;

#import "ChildSelectionDelegate.h"


@interface LeftViewController : UITableViewController < UISearchBarDelegate, UISearchDisplayDelegate>


@property (nonatomic, assign) id<ChildSelectionDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *childList;

@property (nonatomic, strong) NSMutableArray *filterChildArray;
@property IBOutlet UISearchBar *childSearchBar;




@end
