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

@interface HomeTableViewController ()

@property NSMutableArray *tripList;

@property TripObject *trip;

@property (weak, nonatomic) IBOutlet UINavigationItem *nwTripButton;

@end

@implementation HomeTableViewController

- (IBAction)unwindToHome:(UIStoryboardSegue *)segue {
    
    
    //Get the source view controller of the previous scene

    
    DetailsViewController *source = [segue sourceViewController];
    
    //Recover the item that was added by the user, if any
    DetailsObject *details = source.deets;
    
    //TripObject *trip = [[TripObject alloc]init];

    
    //If a new trip was saved, update table with the new entry and refresh view
    //Users are required to enter a trip name in order to save a trip,
    //therefore it's sufficient to check for trip name being nil
    if(details.tripName!=nil){
        self.activeTrip.tripDetails=details;
        [self.tripList addObject:self.activeTrip];
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
    
    
    //if([[segue identifier] isEqualToString:@"segueFromCell"]){
    
    
    // THESE LINES ARE CAUSING THE CRASH
        //Get reference to destination view controller i.e. DetailsViewController
        //DetailsViewController *vc = [segue destinationViewController];
        //Pass the active TripObject to the DetailsViewController
        //[vc setExistingTrip:self.activeTrip];
    
     //}
   
    
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
