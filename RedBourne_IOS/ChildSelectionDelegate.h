//
//  ChildSelectionDelegate.h
//  RedBourne
//
//  Created by Jerry on 28/08/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//


@class ChildModel;

@protocol ChildSelectionDelegate <NSObject>

@required
-(void)selectedChild:(ChildModel *)newChild;
@end
