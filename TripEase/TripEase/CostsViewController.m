//
//  CostView.m
//  TripEase
//
//  Created by David Patterson on 2015-03-18.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "CostsViewController.h"
#import "EditCostsViewController.h"
#import "CostObject.h"
#import "HomeTableViewController.h"
#import "TripObject.h"


@interface CostsViewController ()

@end

@implementation CostsViewController

//Get value of existing trip passed in from Tab View Controller
//@synthesize existingTripFromTab;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Apply border around the "Payment Details" text field
    self.paymentNotesTextView.layer.borderWidth=1.0;
    self.paymentNotesTextView.layer.cornerRadius=7;
    self.paymentNotesTextView.layer.borderColor=[[[UIColor grayColor] colorWithAlphaComponent:0.2]CGColor];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)unwindToCosts:(UIStoryboardSegue *)segue {
    
    //Get the source view controller of the previous scene
    //EditDetailsViewController *source = [segue sourceViewController];
    
    /*
     //Recover the item that was added by the user, if any
     PackingListItem *item = source.packingListItem;
     
     //If item exists (i.e. if user entered any text), add item to the table and reload the view to display this
     if (item != nil) {
     [self.packingListItems addObject:item];
     [self.tableView reloadData];
     }
     
     */
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    //Check whether entered item should be saved
    
    /*
     //If save button not tapped, do nothing an return
     if (sender != self.saveButton) return;
     
     //If reached this line - save button was tapped
     //If any text was entered do the following:
     if (self.textField.text.length > 0) {
     self.PackingListItem = [[PackingListItem alloc] init];  //add new PackingListItem to array
     self.packingListItem.itemName = self.textField.text;    //name of new item = text user entered
     self.packingListItem.completed = NO;                           //Initially item is not completed
     }
     */
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
