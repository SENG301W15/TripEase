//
//  TripObject.h
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailsObject.h"
#import "CostObject.h"
#import "PackingObject.h"
#import "InvitesObject.h"

@interface TripObject : NSObject

@property NSInteger tripID; //A new unique ID will be created for each trip upon instantiation
@property DetailsObject *tripDetails;
@property CostObject *tripCost;
@property PackingObject *tripPacking;
@property InvitesObject *tripInvites;



@end
