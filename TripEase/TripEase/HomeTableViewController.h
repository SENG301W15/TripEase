//
//  HomeTableViewController.h
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripObject.h"
#import "TabBarViewController.h"

@interface HomeTableViewController : UITableViewController
- (IBAction)unwindToHome:(UIStoryboardSegue *)segue;

@property TripObject *activeTrip;




@end
