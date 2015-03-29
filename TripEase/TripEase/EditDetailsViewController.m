
//
//  FirstViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-02-17.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "EditDetailsViewController.h"
#import "DetailsObject.h"

@interface EditDetailsViewController ()


@property (weak, nonatomic) IBOutlet UITextView *detailTextView;


@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;

@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;

@property (weak, nonatomic) IBOutlet UITextField *tripNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

//@property DetailsObject *details;

@end

@implementation EditDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Apply border around the "Additional Details" text field
    self.detailTextView.layer.borderWidth=1.0;
    self.detailTextView.layer.cornerRadius=7;
    self.detailTextView.layer.borderColor=[[[UIColor grayColor] colorWithAlphaComponent:0.2]CGColor];
    
    //Display date picker wheel when user taps start date text box
    UIDatePicker *startDatePicker = [[UIDatePicker alloc]init];
    UIDatePicker *endDatePicker = [[UIDatePicker alloc]init];
    //We don't care about time so set picker mode to Date only
    startDatePicker.datePickerMode=UIDatePickerModeDate;
    [startDatePicker setDate:[NSDate date]];
    endDatePicker.datePickerMode=UIDatePickerModeDate;
    [endDatePicker setDate:[NSDate date]];
    
    [startDatePicker addTarget:self action:@selector(updateStartDateTextField:) forControlEvents:UIControlEventValueChanged];
    [endDatePicker addTarget:self action:@selector(updateEndDateTextField:) forControlEvents:UIControlEventValueChanged];
    
    //call updateDateTextField method when either date text field is selected by user
    [self.startDateTextField setInputView:startDatePicker];
    [self.endDateTextField setInputView:endDatePicker];
    
    
}

//Update date text fields with values selected from DatePicker
-(void)updateStartDateTextField:(id)sender{ //(id)sender
    UIDatePicker *picker=(UIDatePicker *)self.startDateTextField.inputView;
    
    //Format time and date string to 'Day, Month date year'
    //Instantiate new NSDateFormatter object
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //set date format parameters, format date picker
    [dateFormatter setDateFormat:@" ' 'EEEE MMMM d yyyy'"];
    NSString *strStartDate = [dateFormatter stringFromDate:picker.date];
   
    
    self.startDateTextField.text=[NSString stringWithFormat:@"%@",strStartDate];
    
}

//Update date text fields with values selected from DatePicker
-(void)updateEndDateTextField:(id)sender{ //(id)sender
    UIDatePicker *picker=(UIDatePicker *)self.endDateTextField.inputView;
    
    //Format time and date string to 'Day, Month date year'
    //Instantiate new NSDateFormatter object
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //set date format parameters, format date picker
    [dateFormatter setDateFormat:@" ' 'EEEE MMMM d yyyy'"];
    NSString *strEndDate = [dateFormatter stringFromDate:picker.date];
    
    
    self.endDateTextField.text=[NSString stringWithFormat:@"%@",strEndDate];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
    self.predictionLabel.text = @"YES";
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    //Check whether the user tapped Save
    
    
    //If save button not tapped, do nothing and return
    if (sender != self.saveButton) return;
    
    //If reached this line - save button was tapped
    
    //Instantiate new DetailsObject to hold the data
    self.details = [[DetailsObject alloc]init];
    
    //If text was entered in trip name text field, save
    if(self.tripNameTextField.text.length>0){
        self.details.tripName=self.tripNameTextField.text;
    }
    
    //If text was entered in trip location text field, save
    if(self.locationTextField.text.length>0){
        self.details.tripLocation=self.locationTextField.text;
    }
    
    //If a start date was selected, save
    if(self.startDateTextField.text.length>0){
        self.details.startDate=self.startDateTextField.text;
    }
    
    //If an end date was selected, save
    if(self.endDateTextField.text.length>0){
        self.details.endDate=self.endDateTextField.text;
    }
    
    //If extra details were netered, save
    if(self.detailTextView.text.length>0){
        self.details.extraDetails=self.detailTextView.text;
    }
    
     
    
}

@end
