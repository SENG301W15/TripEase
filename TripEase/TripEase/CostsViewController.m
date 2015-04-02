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


@property CostObject *costs;

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
    
    
    //THE FOLLOWING LINES *WORK*, DO NOT DELETE!!!!
    
    //get a reference to the tabBarController that controls this tab bar item (the details tab)
    TabBarViewController *temp = (TabBarViewController *)[self tabBarController];
    
    //If the existing trip is not null, populate static fields on this screen with the values from existing trip
    if (temp.existingTrip!=nil) {
        self.existingTripFromTab = temp.existingTrip;
        
        if (temp.existingTrip.tripCost.totalCost != nil) {
            NSString *attendeesString = [NSString stringWithFormat:@"%ld", (long)self.existingTripFromTab.tripInvites.numAttendees];
            NSDecimalNumber *attendeesDecimal = [NSDecimalNumber decimalNumberWithString:attendeesString];
            NSDecimalNumber *temp=[self.existingTripFromTab.tripCost.totalCost decimalNumberByDividingBy:attendeesDecimal];
            NSString *temp2 = [NSString stringWithFormat:@"%@", temp];
            self.costsLabel.text=temp2;
        }
        
        if (temp.existingTrip.tripCost.payee != nil) {
            self.payeeLabel.text = temp.existingTrip.tripCost.payee;
        }
        
        if (temp.existingTrip.tripCost.paymentDetails != nil) {
            self.paymentNotesTextView.text = temp.existingTrip.tripCost.paymentDetails;
        }
        
        /*
        //Trip Name
        if (temp.existingTrip.tripDetails.tripName != nil) {
            self.tripNameText.text = temp.existingTrip.tripDetails.tripName;
        }
        
        //Trip Location
        if (temp.existingTrip.tripDetails.tripLocation !=nil){
            self.tripLocationText.text = temp.existingTrip.tripDetails.tripLocation;
        }
        
        //Start Date
        if(temp.existingTrip.tripDetails.startDate !=nil){
            self.startDateText.text = temp.existingTrip.tripDetails.startDate;
        }
        
        //End Date
        if(temp.existingTrip.tripDetails.endDate !=nil){
            self.endDateText.text = temp.existingTrip.tripDetails.endDate;
        }
        
        //Additional Details
        if(temp.existingTrip.tripDetails.extraDetails !=nil){
            self.extraDetailsText.text = temp.existingTrip.tripDetails.extraDetails;
        }
         
         */
        
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)unwindToCosts:(UIStoryboardSegue *)segue {
    
    //Get the source view controller of the previous scene
    EditCostsViewController *source = [segue sourceViewController];
    
    //Retrieve the CostObject from the EditCostsViewController
    self.costs=source.costs;
    
    //If new details were inputted in the edit screen, update appropriate static fields on this screen
    if(self.costs.totalCost!=nil){
        
        //Rearrange types to enable division of the NSDecimalNumber
        NSString *attendeesString = [NSString stringWithFormat:@"%ld", (long)self.existingTripFromTab.tripInvites.numAttendees];
        NSDecimalNumber *attendeesDecimal = [NSDecimalNumber decimalNumberWithString:attendeesString];
        
        NSDecimalNumber *temp=[self.costs.totalCost decimalNumberByDividingBy:attendeesDecimal];
        NSString *temp2 = [NSString stringWithFormat:@"%@", temp];
        self.costsLabel.text=temp2;
    }
    
    if(self.costs.payee!=nil){
        self.payeeLabel.text=self.costs.payee;
    }
    
    if(self.costs.paymentDetails!=nil){
        self.paymentNotesTextView.text=self.costs.paymentDetails;
    }
    
    //Update value of details object in TripObject pointer
    self.existingTripFromTab.tripCost=self.costs;
    
    
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
