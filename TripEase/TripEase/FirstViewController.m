
//
//  FirstViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-02-17.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextView *DetailTextField;

@end

@implementation FirstViewController

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
@end
