//
//  PackingListTableViewController.m
//  TripEase
//
//  Created by Katie on 2015-03-24.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "PackingListTableViewController.h"
#import "PackingListItem.h"
#import "AddPackingListItemViewController.h"
#import "TabBarViewController.h" //M

@interface PackingListTableViewController ()

@property NSMutableArray *packingListItems; //Array to store shared packing list items

@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;


@end

@implementation PackingListTableViewController

//Adds "swipe row to delete" functionality
//When user swipes to the left on this row, the 'delete' button appears at the left of the row
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Remove deleted item from the array
    [self.packingListItems removeObjectAtIndex:indexPath.row];
    
    //Reload table view to display updated state
    [tableView reloadData];

}

//Defines the behaviour when returning from the "Add Packing List Items" modal screen
- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    //Get the source view controller of the previous scene
    AddPackingListItemViewController *source = [segue sourceViewController];
    
    //Recover the item that was added by the user, if any
    PackingListItem *item = source.packingListItem;
    
    //If item exists (i.e. if user entered any text), add item to the table and reload the view to display this. Also add item to the existingTripObject
    if (item != nil) {
        //Don't need to explicitly save to local packing list because we pointed local array to
        //the same location as the existingTrip array
        [self.existingTripFromTab.tripPacking.packingList addObject:item];
        [self.tableView reloadData];
    }
    
    //DID THIS ABOVE CAN PROB DELETE THESE LINES
    //Update value of PackingList object in TripObject pointer
    //self.existingTripFromTab.tripPacking.packingList=self.packingListItems;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.packingListItems = [[NSMutableArray alloc] init]; //initialize packing list items array
    
    //get a reference to the tabBarController that controls this tab bar item (the details tab)
    TabBarViewController *temp = (TabBarViewController *)[self tabBarController];
    
    if (temp.existingTrip!=nil) {
        self.existingTripFromTab = temp.existingTrip;
    
        //If viewing an existing trip, populate the array with the existing packing list items
        if(self.existingTripFromTab.tripPacking!=nil){
            self.packingListItems=self.existingTripFromTab.tripPacking.packingList;
            
            //reload view to display items
            [self.tableView reloadData];
        }
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.packingListItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    PackingListItem *PackingListItem = [self.packingListItems objectAtIndex:indexPath.row];
    cell.textLabel.text = PackingListItem.itemName;

    //Display checkmark next to item when it is checked off
    if (PackingListItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark; //Display checkmark next to completed items
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;      //No icon displayed next to un-completed items
    }
    
    
    
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    PackingListItem *tappedItem = [self.packingListItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;   //Check if currently unchecked and vice versa
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
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

- (IBAction)homeButtonAction:(id)sender {
}

@end
