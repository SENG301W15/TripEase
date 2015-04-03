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


@interface DetailsViewController : UIViewController; 

@property DetailsObject *deets;

@property (nonatomic) TripObject *existingTripFromTab;

@property (weak, nonatomic) IBOutlet UILabel *tripNameText;

@property (weak, nonatomic) IBOutlet UILabel *tripLocationText;
@property (weak, nonatomic) IBOutlet UILabel *startDateText;
@property (weak, nonatomic) IBOutlet UILabel *endDateText;

@property (weak, nonatomic) IBOutlet UITextView *extraDetailsText;


- (IBAction)unwindToDetails:(UIStoryboardSegue *)segue;

@end
