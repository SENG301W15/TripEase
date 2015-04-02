//
//  InvitesTableViewController.h
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripObject.h"

@interface InvitesTableViewController : UITableViewController
- (IBAction)unwindToInvites:(UIStoryboardSegue *)segue;


@property (nonatomic) TripObject *existingTripFromTab;

@end
