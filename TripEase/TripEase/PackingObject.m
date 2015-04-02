//
//  PackingObject.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "PackingObject.h"

@implementation PackingObject

//Constructor for PackingObject
-(id)init {
    if(self=[super init]){
        
        //Allocate memory for the mutable array that will hold the packing list
        self.packingList = [[NSMutableArray alloc] init]; 
    }
    return self;
}

@end
