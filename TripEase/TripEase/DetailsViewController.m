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

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tripNameText;

@property (weak, nonatomic) IBOutlet UILabel *tripLocationText;
@property (weak, nonatomic) IBOutlet UILabel *startDateText;
@property (weak, nonatomic) IBOutlet UILabel *endDateText;

@property (weak, nonatomic) IBOutlet UITextView *extraDetailsText;

 
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Apply border around the "Additional Details" text field
    self.extraDetailsText.layer.borderWidth=1.0;
    self.extraDetailsText.layer.cornerRadius=7;
    self.extraDetailsText.layer.borderColor=[[[UIColor grayColor] colorWithAlphaComponent:0.2]CGColor];
    
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
    DetailsObject *deets = [[DetailsObject alloc]init];
    deets=source.details;
    
    //If new details were inputted in the edit screen, update appropriate static fields on this screen
    if(deets.tripName!=nil){
        self.tripNameText.text=deets.tripName;
    }
    
    if(deets.tripLocation!=nil){
        self.tripLocationText.text=deets.tripLocation;
    }
    
    if(deets.startDate!=nil){
        self.startDateText.text=deets.startDate;
    }
    
    if(deets.endDate!=nil){
        self.endDateText.text=deets.endDate;
    }
    
    if(deets.extraDetails!=nil){
        self.extraDetailsText.text=deets.extraDetails;
        
    }
    
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //Prepare fields of global deets to send up to Home screen upon unwind
    self.deets = [[DetailsObject alloc]init];
    self.deets.tripName=self.tripNameText.text;
    self.deets.tripLocation=self.tripLocationText.text;
    self.deets.startDate=self.startDateText.text;
    self.deets.endDate=self.endDateText.text;
    self.deets.extraDetails=self.extraDetailsText.text;
    
}




@end
