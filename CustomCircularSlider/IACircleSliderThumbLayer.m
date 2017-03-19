//
//  IACircleSliderThumbLayer.m
//  CustomCircularSlider
//
//  Created by user on 01.01.17.
//  Copyright © 2017 I&N. All rights reserved.
//

#import "IACircleSliderThumbLayer.h"
#import "IACircularSlider.h"


@implementation IACircleSliderThumbLayer
{
    BOOL _hasImage;
    UIImage* _image;
}
-(void)drawInContext:(CGContextRef)ctx{
    [super drawInContext:ctx];
    if (!_hasImage) {

    CGRect thumbFrame = CGRectInset(self.bounds, 2.f, 2.f);
    UIBezierPath* path = [UIBezierPath
                          bezierPathWithRoundedRect:
                          thumbFrame
                          cornerRadius:thumbFrame.size.width/2];
    
    
    UIColor* shadowColor = [UIColor grayColor];
    if (!self.removeShadow) {
         CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 1.0, shadowColor.CGColor);
    }
    
    CGContextSetFillColorWithColor(ctx, self.slider.thumbTintColor.CGColor);
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
    

    if (!self.removeOutline) {
        CGContextSetStrokeColorWithColor(ctx, shadowColor.CGColor);
        CGContextSetLineWidth(ctx, 0.5);
        CGContextAddPath(ctx, path.CGPath);
        CGContextStrokePath(ctx);
    }

    
    if (self.isHighlighted) {
        CGContextSetFillColorWithColor(ctx, self.slider.thumbHighlightedTintColor.CGColor);
        CGContextAddPath(ctx, path.CGPath);
        CGContextFillPath(ctx);
    }
    }else {
        CGContextDrawImage(ctx, self.bounds, _image.CGImage);
    }
}

-(void)setImage:(UIImage*)image{
    
    _hasImage = image != nil;
    _image  = image;
    [self setNeedsDisplay];
}

@end
