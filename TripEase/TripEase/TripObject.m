//
//  TripObject.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "TripObject.h"

@implementation TripObject

//Constructor for TripObject
-(id)init {
    if(self=[super init]){
        
        //Set default (unassigned) value of tripID to -1
        self.tripID=-1;
    }
    return self;
}


@end
