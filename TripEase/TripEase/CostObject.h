//
//  CostObject.h
//  TripEase
//
//  Created by David Patterson on 2015-03-27.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CostObject : NSObject

@property NSDecimalNumber *totalCost;
@property NSDecimalNumber *indivCost;
@property NSString *payee;
@property NSString *paymentDetails;



@end
