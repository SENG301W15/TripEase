//
//  Invite.h
//  TripEase
//
//  Created by Katie on 2015-03-25.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

//This class stores Invitee objects

@interface Invitee : NSObject

@property NSString *friendsName;         //Friends name as entered by user in "Invite A Friend" scene
//TO DO: NEED TO MAKE SURE THAT PHONE NUM IS FORMATTED AS A PHONE NUMBER!!
@property NSString *phoneNum;   //Phone number as entered by user in "Invite A Friend" scene
@property BOOL msgSent;                     //Set to TRUE when an SMS invite has been sent to this person
@property BOOL replied;     //Set to TRUE when invitee has RSVPed to the trip
@property BOOL attending;   //Set to TRUE when the invitee confirms that they will attend the trip
@property NSString *userName;               //Name of the user who checked off the item



@end
