//
//  FirstViewController.h
//  TripEase
//
//  Created by David Patterson on 2015-02-17.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsObject.h"

@interface EditDetailsViewController : UIViewController

//@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
//- (IBAction)buttonPressed;

@property DetailsObject *details;

@property DetailsObject *existingDetails;

@end

