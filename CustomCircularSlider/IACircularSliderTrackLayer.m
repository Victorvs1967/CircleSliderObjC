//
//  IACircularSliderTrackLayer.m
//  CustomCircularSlider
//
//  Created by user on 01.01.17.
//  Copyright © 2017 I&N. All rights reserved.
//

#import "IACircularSliderTrackLayer.h"
#import "IACircularSlider.h"

@implementation IACircularSliderTrackLayer
{
    CGPoint _center;
    CGFloat _trackWidth;
}
-(void)drawInContext:(CGContextRef)ctx{
    CGPoint center = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    _center = center;
    CGFloat arcWidth = _trackWidth =  self.slider.trackWidth;
    CGFloat arcRadius = (CGRectGetWidth(self.frame)-arcWidth)/2;
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:arcRadius
                                                    startAngle:self.slider.startAngle
                                                      endAngle:self.slider.endAngle
                                                     clockwise:self.slider.clockwise];
    
    
    CGContextSetStrokeColorWithColor(ctx, self.slider.trackTintColor.CGColor);
    CGContextSetLineWidth(ctx, arcWidth);
    
    
    if (_slider.isCapRound) {
        CGContextSetLineCap(ctx, kCGLineCapRound);
    }
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    
    if (self.slider.isTrackHighlightedGradient) {
        CGContextSaveGState(ctx);
        CGContextBeginPath(ctx);

        CGFloat rad = self.slider.radian;
        CGFloat sA = self.slider.startAngle;
        
        UIBezierPath* hPath = [UIBezierPath bezierPathWithArcCenter:center radius:arcRadius+arcWidth/2
                                                     startAngle:rad
                                                       endAngle:sA
                                                      clockwise:!self.slider.clockwise];

        [hPath addArcWithCenter:[self mapRadianToPoint:self.slider.startAngle] radius:arcWidth/2 startAngle:self.slider.startAngle endAngle:M_PI+self.slider.startAngle clockwise:!self.slider.clockwise];
        
        [hPath addArcWithCenter:center radius:arcRadius-arcWidth/2 startAngle:sA endAngle:rad clockwise:self.slider.clockwise];
        
        [hPath addArcWithCenter:[self mapRadianToPoint:self.slider.radian] radius:arcWidth/2 startAngle:self.slider.radian endAngle:M_PI+self.slider.radian clockwise:self.slider.clockwise];
        
        [hPath closePath];
        
        CGContextAddPath(ctx, hPath.CGPath);
        CGContextEOClip(ctx);
        
        NSArray* colors = [NSArray
                           arrayWithObjects:(id)self.slider.trackHighlightedGradientFirstColor.CGColor,
                           (id)self.slider.trackHighlightedGradientSecondColor.CGColor, nil];
    
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
        CGFloat colorLocations[2] = {self.slider.trackHighlightedGradientColorsLocations.x,
            self.slider.trackHighlightedGradientColorsLocations.y};
    
        CGGradientRef gradient =  CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, colorLocations);
    
        CGContextDrawLinearGradient(ctx, gradient, self.slider.gradientStartPoint, self.slider.gradientEndPoint, 0);
        
        CGContextRestoreGState(ctx);
    }else{
        UIBezierPath* hPath = [UIBezierPath bezierPathWithArcCenter:center radius:arcRadius
                                                         startAngle:self.slider.startAngle
                                                           endAngle:self.slider.radian
                                                          clockwise:self.slider.clockwise];
        
        CGContextSetStrokeColorWithColor(ctx, self.slider.trackHighlightedTintColor.CGColor);
        CGContextSetLineWidth(ctx, arcWidth);
        CGContextAddPath(ctx, hPath.CGPath);
        CGContextStrokePath(ctx);
    }
    
    

    
}

-(CGPoint)mapRadianToPoint:(CGFloat)radian{
    return CGPointMake((_center.x-_trackWidth/2)*cos(radian)+_center.x,
                       (( _center.y - _trackWidth/2)*sin(radian)+_center.y));
}

@end
