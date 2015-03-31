//
//  CostView.h
//  TripEase
//
//  Created by David Patterson on 2015-03-18.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CostsViewController : UIViewController
- (IBAction)unwindToCosts:(UIStoryboardSegue *)segue;
@property (weak, nonatomic) IBOutlet UILabel *costsLabel;
@property (weak, nonatomic) IBOutlet UILabel *payeeLabel;
@property (weak, nonatomic) IBOutlet UITextView *paymentNotesTextView;

@end
