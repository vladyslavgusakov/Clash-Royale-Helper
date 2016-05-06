//
//  myCard.h
//  ClashRoyaleInfo
//
//  Created by Vladyslav Gusakov on 3/15/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface myCard : UIView

@property (nonatomic) double x;
@property (nonatomic) double y;

@property (nonatomic) double width;
@property (nonatomic) double height;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) NSString *name;

-(instancetype) initWithPosX: (CGFloat) x andPosY: (CGFloat) y;

@end
