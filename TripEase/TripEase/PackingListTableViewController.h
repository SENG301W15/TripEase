//
//  PackingListTableViewController.h
//  TripEase
//
//  Created by Katie on 2015-03-24.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripObject.h"

@interface PackingListTableViewController : UITableViewController
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property (nonatomic) TripObject *existingTripFromTab;

@end
