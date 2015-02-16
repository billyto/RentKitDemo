//
//  RentKitTests.m
//  RentKitTests
//
//  Created by Billy Tobon on 2/15/15.
//  Copyright (c) 2015 Rent The Runway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RTRRentButton.h"

#define RTRtimeoutInterval 2.0

@interface RentKitTests : XCTestCase

@end

@implementation RentKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRentButton {

    XCTestExpectation *expectation = [self expectationWithDescription:@"Expects complete block execution."];
    
    RTRRentButton *rentButton = [RTRRentButton rentButtonWithSKU:@"123456" Center:CGPointMake(100, 200) completionBlock:^(BOOL completed) {
        
        if (completed) {
            [expectation fulfill];
        }else{
        
            XCTAssert(completed,@"Rent should be completed");
        }
    }];
    
    [rentButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    [rentButton rentItem];
    
    [self waitForExpectationsWithTimeout:RTRtimeoutInterval handler:^(NSError *error) {
        if(error){
            XCTFail(@"Expectation Error: %@", [error localizedDescription]);
        }
    }];
    
    
}


@end
