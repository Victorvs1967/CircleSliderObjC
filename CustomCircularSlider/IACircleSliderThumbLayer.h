//
//  IACircleSliderThumbLayer.h
//  CustomCircularSlider
//
//  Created by user on 01.01.17.
//  Copyright © 2017 I&N. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@class IACircularSlider;

@interface IACircleSliderThumbLayer : CALayer
@property (weak, nonatomic) IACircularSlider* slider;

@property (assign, nonatomic) BOOL removeOutline;
@property (assign, nonatomic) BOOL removeShadow;

@property (assign, nonatomic) BOOL isHighlighted;

-(void)setImage:(UIImage*)image;
@end
