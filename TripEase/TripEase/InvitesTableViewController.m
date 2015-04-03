//
//  InvitesTableViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "InvitesTableViewController.h"
#import "TabBarViewController.h"
#import "InvitesObject.h"
#import "SendInviteViewController.h"

@interface InvitesTableViewController ()

@property NSMutableArray *inviteeList; //Array to store invitees

@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;


@end

@implementation InvitesTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.inviteeList = [[NSMutableArray alloc] init]; //initialize invitee list  array
    
    //get a reference to the tabBarController that controls this tab bar item (the details tab)
    TabBarViewController *temp = (TabBarViewController *)[self tabBarController];
    
    if (temp.existingTrip!=nil) {
        self.existingTripFromTab = temp.existingTrip;
        
        //If viewing an existing trip, populate the array with the existing packing list items
        if(self.existingTripFromTab.tripInvites!=nil){
            self.inviteeList=self.existingTripFromTab.tripInvites.inviteeList;
            
            //reload view to display items
            [self.tableView reloadData];
        }
    }

    
    //Only display the Edit button if the user is an organier
    if(!self.existingTripFromTab.isOrganizer){
        
        [self.navigationItem setRightBarButtonItem:nil];
    }
    
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.inviteeList count];
}


- (IBAction)unwindToInvites:(UIStoryboardSegue *)segue {
    
    //Get the source view controller of the previous scene
    SendInviteViewController *source = [segue sourceViewController];
    
    //Recover the item that was added by the user, if any
    InviteListItem *item = source.inviteListItem;
    
    //If item exists (i.e. if user entered any text), add item to the table and reload the view to display this. Also add item to the existingTripObject
    if (item != nil) {
        //Don't need to explicitly save to local packing list because we pointed local array to
        //the same location as the existingTrip array
        [self.existingTripFromTab.tripInvites.inviteeList addObject:item];
        [self.tableView reloadData];
        self.existingTripFromTab.tripInvites.numAttendees = [self.existingTripFromTab.tripInvites.inviteeList count];
    }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   

}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    /*
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ListPrototypeCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    */
    
    
    //Display the invitees name in the list
    InviteListItem *InviteListItem = [self.inviteeList objectAtIndex:indexPath.row];
    cell.textLabel.text = InviteListItem.inviteeName;
    
    //Display RSVP info
    if (!InviteListItem.replied) {
        cell.detailTextLabel.text = @"Not Yet Replied";
    } else if (InviteListItem.attending) {
        cell.detailTextLabel.text = @"Attending";
    } else {
        cell.detailTextLabel.text = @"Declined";
    }
    
    return cell;
}


//Only permit user to return to home if a trip name has been entereed
//Check whether a trip name exists
//If it does, return YES
//If it does not, return NO and pop up an error message
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if(sender==self.homeButton){
        //Only permit save if at least a trip name was entered
        //- if trip name not entered, display alert and do not segue
        
        //Get a reference to the source view controller
        TabBarViewController *tvc = (TabBarViewController *)[self tabBarController];
        
        //if there is no trip name,
        if(tvc.existingTrip.tripDetails.tripName==nil){
            //pop up error message, do not permit segue
            [self showNoTitleAlert];
            return NO;
        }
        
        
    }
    //Otherwise, permit segue to Home
    return YES;
}

//We want to enforce that the user MUST enter at least a trip name before saving.
//This alert pops up if the user attempts to save without first entering a trip name
- (void) showNoTitleAlert{
    //Define the alert window
    UIAlertView *noTitleAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Oops!"
                                 message:@"You must enter a Trip Name before saving!\n\n Name your trip in the Details Tab."
                                 delegate:nil
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil
                                 ];
    //display the alert
    [noTitleAlert show];
    
    //[noTitleAlert release];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
