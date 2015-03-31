//
//  DetailsViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "DetailsViewController.h"
#import "EditDetailsViewController.h"
#import "DetailsObject.h"
#import "HomeTableViewController.h"
//#import "TabBarViewController.h"
#import "TripObject.h"



@interface DetailsViewController ()
/*
@property (weak, nonatomic) IBOutlet UILabel *tripNameText;

@property (weak, nonatomic) IBOutlet UILabel *tripLocationText;
@property (weak, nonatomic) IBOutlet UILabel *startDateText;
@property (weak, nonatomic) IBOutlet UILabel *endDateText;

@property (weak, nonatomic) IBOutlet UITextView *extraDetailsText;

*/
 
@end

@implementation DetailsViewController

@synthesize existingTripFromTab;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Apply border around the "Additional Details" text field
    self.extraDetailsText.layer.borderWidth=1.0;
    self.extraDetailsText.layer.cornerRadius=7;
    self.extraDetailsText.layer.borderColor=[[[UIColor grayColor] colorWithAlphaComponent:0.2]CGColor];
    
    //If the details object in the existing TripObject passed in by the HomeTableController is not nil,
    //populate fields on this screen with the existing details fields
    //if(existingTripFromTab.tripDetails.tripName!=nil){
    //    self.tripNameText.text=existingTripFromTab.tripDetails.tripName;
    // }
    
    /////////////////////////////////////////////////////////////////////////////////////////////
    //PASSING DATA FROM TAB BAR VIEW CONTROLLER TO DETAILS VIEW CONTROLLER:
    //THE FOLLOWING LINES *WORK*, DO NOT DELETE!!!!
    
    //get a reference to the tabBarController that controls this tab bar item (the details tab)
    TabBarViewController *temp = (TabBarViewController *)[self tabBarController];
    
    //If the existing trip is not null, populate static fields on this screen with the values from existing trip
    if (temp.existingTrip!=nil) {
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
        
    }
    
   
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Defines the behaviour when returning from the "Add Packing List Items" modal screen
- (IBAction)unwindToDetails:(UIStoryboardSegue *)segue {
    
    //Get the source view controller of the previous scene
    EditDetailsViewController *source = [segue sourceViewController];
    
    //Retrieve the DetailsObject from the EditDetailsViewController
    //DetailsObject *deets = [[DetailsObject alloc]init];
    self.deets=source.details;
    
    //If new details were inputted in the edit screen, update appropriate static fields on this screen
    if(self.deets.tripName!=nil){
        self.tripNameText.text=self.deets.tripName;
    }
    
    if(self.deets.tripLocation!=nil){
        self.tripLocationText.text=self.deets.tripLocation;
    }
    
    if(self.deets.startDate!=nil){
        self.startDateText.text=self.deets.startDate;
    }
    
    if(self.deets.endDate!=nil){
        self.endDateText.text=self.deets.endDate;
    }
    
    if(self.deets.extraDetails!=nil){
        self.extraDetailsText.text=self.deets.extraDetails;
        
    }
    
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //Prepare fields of global deets to send up to Home screen upon unwind
    /*
    self.deets = [[DetailsObject alloc]init];
    self.deets.tripName=self.tripNameText.text;
    self.deets.tripLocation=self.tripLocationText.text;
    self.deets.startDate=self.startDateText.text;
    self.deets.endDate=self.endDateText.text;
    self.deets.extraDetails=self.extraDetailsText.text;
    */
}




@end
