//
//  HomeTableViewController.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "HomeTableViewController.h"
#import "TripObject.h"
#import "DetailsViewController.h"
#import "DetailsObject.h"
#import "TabBarViewController.h"
#import "CostsViewController.h"


@interface HomeTableViewController ()

@property NSMutableArray *tripList;

//@property TripObject *trip;

@property (weak, nonatomic) IBOutlet UINavigationItem *nwTripButton;

@end

@implementation HomeTableViewController

- (IBAction)unwindToHome:(UIStoryboardSegue *)segue {
    
    //Get the source view controller of the previous scene
    UIViewController *source =[segue sourceViewController];
    DetailsViewController *legitSource;
    
    
    if([source isKindOfClass:[DetailsViewController class]]){
        legitSource=(DetailsViewController *)source;
    }//else if([source isKindOfClass:[CostsViewController class]]){
      //  legitSource=(CostsViewController *)source;
    //}
    
    //DetailsViewController *source = [segue sourceViewController];
    
    //Recover the item that was added by the user, if any
    //DetailsObject *details = legitSource.deets;
    
    TripObject *trip = [[TripObject alloc]init];
    
    
    //If a new trip was saved, update table with the new entry and refresh view
    //Users are required to enter a trip name in order to save a trip,
    //therefore it's sufficient to check for trip name being nil
    if(self.activeTrip.tripDetails.tripName!=nil){
        //trip.tripDetails=details;
      
        //Recover the info added/modified by the user
        trip=self.activeTrip;
        
        
        
        //Check whether a tripID has already been set for the active trip - create one if not
        //(tripID==-1 indiactes that we are saving this trip for the first time and so we need to create a trip id)
        if(self.activeTrip.tripID==-1){
            //tripID = the trip's index in the tripList array
            trip.tripID=[self.tripList count];
            [self.tripList addObject:trip];
            self.activeTrip.tripID=trip.tripID;
        }else{
            //If this trip already existed and was being edited, replace existing entry in the array
            //(do not insert a new array element)
            //Restore correct trip ID for the edited trip
            trip.tripID=self.activeTrip.tripID;
            [self.tripList replaceObjectAtIndex:(NSUInteger)self.activeTrip.tripID withObject:trip];
        }
        
        
        [self.tableView reloadData];
    }

   
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    //We want to pass the active Trip Object down to the tab bar controller
    //so that it can be used to populate fields in the various tables
    UINavigationItem *button  =(UINavigationItem *)sender;
    
    
    //[button ]
    if([button.title isEqualToString:@"New Trip"]){
    //if([sender isEqual:self.nwTripButton]){
        //If it's a new trip, instantiate a new TripObject
        self.activeTrip = [[TripObject alloc]init];
    }
    //Otherwise, an existing trip will have been stored into activeTrip when the user selects a row
    //and didSelectRowAtIndexPath is called
    
    
    //Point the existingTrip object from the destination view controller (i.e. Tab Bar controller) to the same location as the current activeTrip TripObject
    TabBarViewController *tabviewctrl = (TabBarViewController *)segue.destinationViewController;
    tabviewctrl.existingTrip=self.activeTrip;
    
    
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Instantiate New Trip button with title
    [self.nwTripButton setTitle:@"New Trip"];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //Allocate the array for storing the list of trips
    self.tripList = [[NSMutableArray alloc]init];
    
    //On initial entry into app, Load example trip
    //(simulates receiving an invitation from another app user)
    if([self.tripList count]==0){
        [self.tripList addObject:[self generateExampleTrip]];
    }

    
    /*
    TripObject *trip =[[TripObject alloc]init];
    trip.tripDetails.tripName=@"Test Trip";
  
    [self.tripList addObject:trip];
    [self.tableView reloadData];
*/
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Get TripObject stored in cell, if one exists
    self.activeTrip = [self.tripList objectAtIndex:[indexPath row]];
    [self performSegueWithIdentifier:@"segueToTabBar" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections - home screen has only 1 section
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.tripList count];
}


//Display a cell in the given row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    TripObject *trip = [self.tripList objectAtIndex:indexPath.row]; //instantiate new TripObject and insert into the array
    cell.textLabel.text=trip.tripDetails.tripName; //label the cell with the trip's name
    
    //return the contents of the selected cell
    return cell;
}


//Generate a sample exiting trip object
//(This simulates the user being invited to a trip by someone else)
-(TripObject *)generateExampleTrip{
    TripObject *exampleTrip = [[TripObject alloc]init];
    
    //Assign TripID=0;
    exampleTrip.tripID=0;
    
    //Identify user as an Attendee, not an organizer
    exampleTrip.isOrganizer=NO;
    
    //Fill in Details
    exampleTrip.tripDetails.tripName=@"Camping Weekend";
    exampleTrip.tripDetails.tripLocation=@"Kananaskis";
    exampleTrip.tripDetails.startDate=@"Friday April 17 2015";
    exampleTrip.tripDetails.endDate=@"Sunday April 19 2015";
    exampleTrip.tripDetails.extraDetails=@"Let's go camping to celebrate that the SENG301 nightmare is over!";
    
    //Fill in Costs
    NSString *costString = @"50.00";
    exampleTrip.tripCost.totalCost=[NSDecimalNumber decimalNumberWithString: costString];
    exampleTrip.tripCost.payee=@"Alaa Azazi";
    exampleTrip.tripCost.paymentDetails=@"Alaa will buy firewood. Bring small unmarked bills to pay him back.";
    
    //Fill in PackingList
    PackingListItem *pkitem1 = [[PackingListItem alloc]init];
    PackingListItem *pkitem2 = [[PackingListItem alloc]init];
    pkitem1.itemName=@"Coleman Stove";
    pkitem1.completed=YES;
    [exampleTrip.tripPacking.packingList addObject:pkitem1];
    pkitem2.itemName=@"Beer";
    pkitem2.completed=NO;
    [exampleTrip.tripPacking.packingList addObject:pkitem2];
   
    //Fill Invitees
    InviteListItem *person1 = [[InviteListItem alloc]init];
    InviteListItem *person2 = [[InviteListItem alloc]init];
    InviteListItem *person3 = [[InviteListItem alloc]init];
    person1.inviteeName=@"Katie";
    person1.inviteePhone=@"4031111111";
    [exampleTrip.tripInvites.inviteeList addObject:person1];
    
    person2.inviteeName=@"Dave";
    person2.inviteePhone=@"4032222222";
    person2.replied=YES;
    person2.attending=NO;
    [exampleTrip.tripInvites.inviteeList addObject:person2];
    
    person3.inviteeName=@"Tedd";
    person3.inviteePhone=@"4033333333";
    person3.replied=YES;
    person3.attending=YES;
    [exampleTrip.tripInvites.inviteeList addObject:person3];
    
    return exampleTrip;
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
