//
//  PackingListItem.h
//  TripEase
//
//  Created by Katie on 2015-03-24.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

//This class stores items that have been added to the shared packing list

@interface PackingListItem : NSObject

@property NSString *itemName;               //Item name as it will appear in the app
@property BOOL completed;                   //TRUE when item checked off
@property (readonly) NSDate *creationDate;  //Date item created - so items can be sorted by add date
@property NSString *userName;               //Name of the user who checked off the item



@end
