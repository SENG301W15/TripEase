//
//  TabBarViewController.m
//  TripEase
//
//  Created by Katie on 2015-03-29.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "TabBarViewController.h"
#import "TripObject.h"
#import "DetailsViewController.h"

@interface TabBarViewController ()



@end

@implementation TabBarViewController
/*
@synthesize existingTrip = _existingTrip;

- (TripObject *)existingTrip {
    return _existingTrip;
}
*/


//You need to pass a UIStoryboardSegue into viewDidLoad so that you can
//pass data down to the individual tabs
- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
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
    
    //Point the existinTripFromTab TripObject in the destination view controller to the same location as the existingTrip TripObject
    DetailsViewController *dvc = (DetailsViewController *)sender;
    dvc.existingTripFromTab=self.existingTrip;
}


@end
