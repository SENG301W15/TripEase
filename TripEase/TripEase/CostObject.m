//
//  CostObject.m
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "CostObject.h"

@implementation CostObject

//Constructor for CostObject
-(id)init {
    if(self=[super init]){
        
        //Set default cost to 0 dollars
        self.totalCost=0;
    }
    return self;
}

@end
