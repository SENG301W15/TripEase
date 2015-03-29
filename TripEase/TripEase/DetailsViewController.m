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
@property (weak, nonatomic) IBOutlet UILabel *extraDetailsText;


 
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Defines the behaviour when returning from the "Add Packing List Items" modal screen
- (IBAction)unwindToDetails:(UIStoryboardSegue *)segue {
    
    
    
    //YOU ARE HERE THIS IS WHAT YOU NEED TO DO:
    //Elsewhere you need to instantiate a new trip object - this should happen when you tap new trip on the home screen
    //Then in here
    //Apply the values from details to all of the fields on this screen
    //And then insert save this DetailsObject as part of the TripObject
    //Need to make sure that you can go back and change field without fucking everything
    
    //Assign values from deets to appropriate fields in this view
    //UITextField *newtext = [[UITextField alloc]init];
    //newtext.text=deets.tripLocation;
    //[self.tripNameText setInputView:newtext];
    //self.startDateTextField.text=[NSString stringWithFormat:@"%@",strStartDate];
    //self.tripNameText.text=deets.tripLocation;

    
    
    //Get the source view controller of the previous scene
    EditDetailsViewController *source = [segue sourceViewController];
    
    //Retrieve the DetailsObject from the EditDetailsViewController
    DetailsObject *deets = source.details;
    
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




@end
