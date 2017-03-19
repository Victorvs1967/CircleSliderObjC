//
//  IACircularSliderTrackLayer.h
//  CustomCircularSlider
//
//  Created by user on 01.01.17.
//  Copyright © 2017 I&N. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
@class IACircularSlider;

@interface IACircularSliderTrackLayer : CALayer
@property (weak, nonatomic) IACircularSlider* slider;
@end
