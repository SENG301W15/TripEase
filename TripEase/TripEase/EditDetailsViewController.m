
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

@end

@implementation EditDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.DetailTextField.layer.borderWidth=1.0;
    self.DetailTextField.layer.cornerRadius=8;
    self.DetailTextField.layer.borderColor=[[UIColor grayColor]CGColor];
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
