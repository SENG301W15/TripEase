//
//  EditCostsViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-02-17.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "EditCostsViewController.h"
#import "CostObject.h"
#import "TabBarViewController.h"
#import "CostsViewController.h"

@interface EditCostsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *totalCostInput;
@property (weak, nonatomic) IBOutlet UITextField *whoToPay;
@property (weak, nonatomic) IBOutlet UITextField *costsNotesInput;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation EditCostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //If save button not tapped, do nothing and return
    if (sender != self.saveButton) return;
    
    //Instantiate new CostObject to hold the data
    self.costs = [[CostObject alloc]init];
   
    //If text was entered in Total Cost text field, save
    if(self.totalCostInput.text.length>0){
        self.costs.totalCost=[NSDecimalNumber decimalNumberWithString: self.totalCostInput.text];
    }
    
    //If text was entered in Who to Pay text field, save
    if(self.whoToPay.text.length>0){
        self.costs.payee=self.whoToPay.text;
    }
    
    //If text was entered in Notes field, save
    if(self.costsNotesInput.text.length>0){
        self.costs.paymentDetails=self.costsNotesInput.text;
    }    
}




- (IBAction)saveButton:(id)sender {
}



@end
