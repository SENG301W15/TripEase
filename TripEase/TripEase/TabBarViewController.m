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
#import "CostsViewController.h"
#import "PackingListTableViewController.h"
#import "InvitesTableViewController.h"

@interface TabBarViewController ()



@end

@implementation TabBarViewController



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
    UIViewController *genericsender = (UIViewController *)sender;


    
    //Check which tab called prepareForSegue, cast dvc as that specific type of controller
    //Then send existing trip object from this controller to the destination controller
    if([genericsender isKindOfClass:[DetailsViewController class] ]){
        //DetailsViewController *dvc = [[DetailsViewController alloc]init];
        DetailsViewController *dvc = (DetailsViewController *)sender;
        dvc.existingTripFromTab=self.existingTrip;
    }else if ([genericsender isKindOfClass:[CostsViewController class]]){
        CostsViewController *dvc = (CostsViewController *)sender;
        dvc.existingTripFromTab=self.existingTrip;
    }else if ([genericsender isKindOfClass:[PackingListTableViewController class]]){
        PackingListTableViewController *dvc = (PackingListTableViewController *)sender;
        dvc.existingTripFromTab=self.existingTrip;
    }else if ([genericsender isKindOfClass:[InvitesTableViewController class]]){
        InvitesTableViewController *dvc = (InvitesTableViewController *)sender;
        dvc.existingTripFromTab=self.existingTrip;
    }
    
   
}


@end
