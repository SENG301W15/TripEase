//
//  TripEaseTests.m
//  TripEaseTests
//
//  Created by David Patterson on 2015-02-17.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TripObject.h"


@interface TripEaseTests : XCTestCase

@end

@implementation TripEaseTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testTripObjectConstructor {
    
    TripObject *trip = [[TripObject alloc]init];
    XCTAssertEqual(trip.tripID, -1, @"Trip ID number not -1");
    
}

- (void)testDetailsObjectConstructor {
    
    DetailsObject *details = [[DetailsObject alloc]init];
    XCTAssertNil(details.tripName, @"Trip object name not nil");
    XCTAssertNil(details.tripLocation, @"Trip object location not nil");
    XCTAssertNil(details.startDate, @"Trip object start date not nil");
    XCTAssertNil(details.endDate, @"Trip object end date not nil");
    XCTAssertNil(details.extraDetails, @"Trip object extra details not nil");
    
}

- (void)testCostObjectConstructor {
    
    CostObject *costs = [[CostObject alloc]init];
    NSDecimalNumber *decZero = [[NSDecimalNumber alloc]initWithInt:0];
    XCTAssertEqualObjects(costs.totalCost, decZero, @"Costs object totalCost not initialized to 0");
    XCTAssertNil(costs.indivCost, @"Cost object individual cost not nil");
    XCTAssertNil(costs.payee, @"Cost object payee not nil");
    XCTAssertNil(costs.paymentDetails, @"Cost object payment details not nil");
    
}

-(void)testPackingListObjectConstructor{
    PackingObject *pack = [[PackingObject alloc]init];
    XCTAssertNil(pack.listItem, @"Packing Object listitem not nil");
    XCTAssertNotNil(pack.packingList, @"Packing Object list not instantiated");
    XCTAssertEqual([pack.packingList count], 0, @"Packing Object list not empty");
}

-(void)testPackingListItemConstructor{
    PackingListItem *item =[[PackingListItem alloc]init];
    XCTAssertNil(item.itemName, @"PackingListItem itemName not nil");
    XCTAssertNil(item.userName, @"PackingListItem userName not nil");
    XCTAssertFalse(item.completed, @"PackingListItem completed booean not NO by default");
}

- (void)testInvitesObjectConstructor {
    
    InvitesObject *invites = [[InvitesObject alloc]init];
    XCTAssertEqual(invites.numAttendees, 1, @"Invites object numattendees not 1");
    NSString *initString = @"TripOrganizer";
    InviteListItem *initItem = [invites.inviteeList firstObject];
    XCTAssertEqualObjects(initItem.inviteeName, initString, @"Invites object initial list item not TripOrganizer");

    XCTAssertEqualObjects(initItem.inviteePhone, @"555-555-5555", @"Invites object initial list phone number not 555-555-5555");
    XCTAssertTrue(initItem.replied, @"Invites object inital list item Replied boolean not YES by defualt");
    XCTAssertTrue(initItem.attending, @"Invites object inital list item Attending boolean not YES by defualt");
    
}


-(void)testTripObjectContstructorCallsOtherConstructors{
    TripObject *trip = [[TripObject alloc]init];
    NSDecimalNumber *decZero = [[NSDecimalNumber alloc]initWithInt:0];
    XCTAssertEqualObjects(trip.tripCost.totalCost, decZero, @"total cost in TripCost not initizlied to 0");
    //XCTAssertEqual(trip.tripPacking.);
    
    //XCTAssertEqual(trip.tripID, -1, @"Trip ID number not -1");
}

@end
