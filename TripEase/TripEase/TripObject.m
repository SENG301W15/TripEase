//
//  TripObject.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "TripObject.h"
#import "DetailsObject.h"
#import "CostObject.h"
#import "PackingObject.h"
#import "InvitesObject.h"

@implementation TripObject

//Constructor for TripObject
-(id)init {
    if(self=[super init]){
        
        //Set default (unassigned) value of tripID to -1
        self.tripID=-1;
        
        //Since constructor is called when a new trip is created, the current user is the trip organizer
        self.isOrganizer=YES;
        
        //Instantiate component objects
        self.tripDetails = [[DetailsObject alloc]init];
        self.tripCost = [[CostObject alloc]init];
        self.tripPacking = [[PackingObject alloc]init];
        self.tripInvites = [[InvitesObject alloc]init];
        
        

        
        
    }
    return self;
}


@end
