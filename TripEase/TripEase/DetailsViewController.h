//
//  DetailsViewController.h
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsObject.h"
#import "HomeTableViewController.h"
#import "TripObject.h"


@interface DetailsViewController : UIViewController{
    TripObject *existingTrip;
}

@property DetailsObject *deets;

@property (nonatomic) TripObject *existingTrip;

- (IBAction)unwindToDetails:(UIStoryboardSegue *)segue;

@end
