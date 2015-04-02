//
//  InvitesObject.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "InvitesObject.h"

@implementation InvitesObject

//Constructor for InvitesObject
-(id)init {
    if(self=[super init]){
        
        //Set default (unassigned) value of numAttendees to 1
        self.numAttendees=1;
        
        //Allocate memory for the mutable array that will hold the invitee list
        self.inviteeList = [[NSMutableArray alloc] init];

        
    }
    return self;
}

@end
