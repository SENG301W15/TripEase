//
//  AddPackingListItemViewController.m
//  TripEase
//
//  Created by Katie on 2015-03-24.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "AddPackingListItemViewController.h"

@interface AddPackingListItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField; //Text field where user enters item name
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton; //Save button on the "Let's add an item" screen

@end

@implementation AddPackingListItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    //Check whether entered item should be saved
    
    //If save button not tapped, do nothing an return
    if (sender != self.saveButton) return;
    
    //If reached this line - save button was tapped
    //If any text was entered do the following:
    if (self.textField.text.length > 0) {
        self.PackingListItem = [[PackingListItem alloc] init];  //add new PackingListItem to array
        self.packingListItem.itemName = self.textField.text;    //name of new item = text user entered
        self.packingListItem.completed = NO;                           //Initially item is not completed
    }
    
}


@end
