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
    }
    
}

#pragma mark - Navigation
/*
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
 
    
}*/




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    //Display the invitees name in the list
    InviteListItem *InviteListItem = [self.inviteeList objectAtIndex:indexPath.row];
    cell.textLabel.text = InviteListItem.inviteeName;
    
    
    
    return cell;
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
