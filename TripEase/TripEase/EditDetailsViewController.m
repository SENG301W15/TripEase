
//
//  FirstViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-02-17.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "EditDetailsViewController.h"

@interface EditDetailsViewController ()


@property (weak, nonatomic) IBOutlet UITextView *DetailTextField;

@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;

@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;

@end

@implementation EditDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Apply border around the "Additional Details" text field
    self.DetailTextField.layer.borderWidth=1.0;
    self.DetailTextField.layer.cornerRadius=8;
    self.DetailTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    
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
    
    
    //Check whether entered item should be saved
    
    /*
    //If save button not tapped, do nothing and return
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
