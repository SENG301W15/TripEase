//
//  InvitesObject.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "InvitesObject.h"
#import "InviteListItem.h"

@implementation InvitesObject


//Constructor for InvitesObject
-(id)init {
    if(self=[super init]){
        

        
        //Allocate memory for the mutable array that will hold the invitee list
        self.inviteeList = [[NSMutableArray alloc] init];
        
        //Create trip organizer InviteListItem
        //In the future this will be created by pulling user data from their device and/or in a settings tab
        InviteListItem *user = [[InviteListItem alloc]init];
        user.inviteeName = @"TripOrganizer";
        user.inviteePhone = @"555-555-5555";
        user.replied = YES;
        user.attending = YES;
        
        //Add trip organizer to attendee list
        [self.inviteeList addObject:user];
        
        //Set default (unassigned) value of numAttendees to 1
        self.numAttendees=[self.inviteeList count];

        
    }
    return self;
}

@end
