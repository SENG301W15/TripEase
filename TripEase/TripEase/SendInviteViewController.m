//
//  SendInviteViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "SendInviteViewController.h"

@interface SendInviteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inviteeName;
@property (weak, nonatomic) IBOutlet UITextField *inviteePhone;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sendInviteButton;
@end

@implementation SendInviteViewController

- (void)viewDidLoad {
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
 
 
 //Check whether entered item should be saved
 
 //If save button not tapped, do nothing an return
 if (sender != self.sendInviteButton) return;
 
 //If reached this line - save button was tapped
 //If any text was entered do the following:
 if (self.inviteeName.text.length > 0) {
 self.InviteListItem = [[InviteListItem alloc] init];  //instantiate new invitelistitem item
 self.inviteListItem.inviteeName = self.inviteeName.text;    //name of new invitee = text user entered
 self.inviteListItem.inviteePhone = self.inviteePhone.text;                           //Initially item is not completed
     self.inviteListItem.replied = NO; //Initialize replied field
     self.inviteListItem.attending = NO; //Initialize attending field
 }
 
 }

@end
