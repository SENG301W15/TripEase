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
    
    //If the existing trip not null, pop static fields
    /*SAFETY COMMENT BEGINS HERE
    
    //get reference to tabBarController
    TabBarViewController *temp = (TabBarViewController *)[self tabBarController];
    
    //check if nil
    if(temp.existingTrip!=nil){
        //Shared Cost
        //(NSDecimalDivide((NSDecimal *)self.costsLabel, self.existingTrip.tripCost,(NSDecimal *)self.existingTrip.invitesObject.numAttendees))
        //self.costsLabel.text=temp.existingTrip.tripCost.totalCost/(NSDecimal *)temp.existingTrip.invitesObject.numAttendees;
    
        
        if(temp.existingTrip.tripCost.totalCost!=0){
        NSDecimal *tempDec=(NSDecimal *)self.existingTripFromTab.tripInvites.numAttendees;
        self.costsLabel.text=(NSString *)[self.existingTripFromTab.tripCost.totalCost decimalNumberByDividingBy:(__bridge NSDecimalNumber *)tempDec];
        }
        
        
        //self.costsLabel.text=(NSString *)[temp.existingTrip.tripCost.totalCost decimalNumberByDividingBy:(NSDecimalNumber *)temp.existingTrip.invitesObject.numAttendees];
    
        
        //Payee
        if(temp.existingTrip.tripCost.payee!=nil){
            self.payeeLabel.text=temp.existingTrip.tripCost.payee;
        }
        
        //Notes
        if(temp.existingTrip.tripCost.paymentDetails!=nil){
            self.paymentNotesTextView.text=temp.existingTrip.tripCost.paymentDetails;
        }
     
        
        
    }

  */
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)unwindToCosts:(UIStoryboardSegue *)segue {
    
    //Get source view controller of prev scence
    //EditCostsViewController *source = [segue sourceViewController];
    
    //Retreive entered info
    //self.costs=source.costs;
    
    //If new costs were inputted in the edit screen, update appropriate static fields on
    
    
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
