//
//  RTRRentButton.h
//  RentTheGown
//
//  Created by Billy Tobon on 2/15/15.
//  Copyright (c) 2015 Rent The Runway. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^completionBlock)(BOOL completed);


@interface RTRRentButton : UIButton

+ (instancetype)rentButtonWithSKU:(NSString *)sku Center:(CGPoint)center completionBlock:(completionBlock)block;

@end
