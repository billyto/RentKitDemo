//
//  RTRRentButton.m
//  RentTheGown
//
//  Created by Billy Tobon on 2/15/15.
//  Copyright (c) 2015 Rent The Runway. All rights reserved.
//

#import "RTRRentButton.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RTRButtonStyle.h"



@interface RTRRentButton ()

@property (nonatomic) CGPoint *center;
@property (nonatomic) BOOL pressed;
@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *sku;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, copy) void (^completionBlock)(BOOL completed);

@end


@implementation RTRRentButton


+ (instancetype)rentButtonWithSKU:(NSString *)sku Center:(CGPoint)center completionBlock:(completionBlock)block {
    RTRRentButton *button = [RTRRentButton new];
    [button setFrame:CGRectMake(center.x, center.y, 260, 100)];
    [button addTarget:button action:@selector(rentItem) forControlEvents:UIControlEventTouchUpInside];
    button.label =@"Rent me";
    button.pressed = NO;
    if (block) {
        button.completionBlock = block;
    }
    if (sku){
        button.sku = sku;
    
    }

    [button setNeedsDisplay];
    
    return button;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    [RTRButtonStyle drawRateButtonWithRadius:5 title:self.label pressed:self.pressed];

}

- (void)rentItem{

    [NSTimer scheduledTimerWithTimeInterval:1.8
                                     target:self
                                   selector:@selector(rentCompleted)
                                   userInfo:nil
                                    repeats:NO];
    
    self.pressed = YES;
    self.label = @"Renting...";
    [self setNeedsDisplay];

}

- (void)rentCompleted {

    self.pressed = NO;
    self.label = self.sku ? @"Rented": @"Error";
    [self setNeedsDisplay];

    if (self.completionBlock) {
        
        if (self.sku) {
            self.completionBlock(YES);
        }else{
            self.completionBlock(NO);
        }
    }
}


@end
