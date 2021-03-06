//
//  PackingObject.h
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PackingListItem.h"

@interface PackingObject : NSObject

@property PackingListItem *listItem;

@property NSMutableArray *packingList;

@end
