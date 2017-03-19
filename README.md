# CircularSlider
 Customizable Circular Slider on Objective-C 

#How to Use

Add IACircularSlider, IACircularSliderTrackLayer, IACircleSliderThumbLayer .h.m files in your project, than `#import` 
IACircularSlider.h where you want to use the slider.

#Features

- Track Color
- Highlighted Track Color
- Thumb Color and Image
- Highlighted Thumb Color
- Start and End Angle
- Gradient Color for Highlighted Track Color
- Track's and Thumb's width
- Setting Minimum and Maximum Value

#Example
##Code
In viewDidLoad:
``` objective-c
    
    IACircularSlider* slider = [[IACircularSlider alloc] initWithFrame:CGRectZero];
    [self.view addSubview:slider];

    
    slider.trackHighlightedTintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    slider.thumbTintColor = [UIColor whiteColor];
    slider.trackTintColor = [UIColor lightGrayColor];
    slider.thumbHighlightedTintColor = [UIColor whiteColor];
    slider.trackWidth = 20;
    slider.thumbWidth = 25;
    
    
    slider.minimumValue = 0;
    slider.startAngle = 3*M_PI/4;
    slider.endAngle = M_PI/4;
    slider.clockwise = YES;
    
    CGPoint start = CGPointMake(200, 100);
    CGPoint end = CGPointMake(0, 100);
    
    [slider setGradientColorForHighlightedTrackWithFirstColor:[UIColor orangeColor] secondColor:[UIColor blueColor] colorsLocations:CGPointMake(0.3, 0.9) startPoint:start andEndPoint:end];
```

In viewDidLayoutSubviews:
``` objective-c
    [self.slider setFrame:CGRectMake(100, 100, 200, 200)];
```
##Result
![alt result](https://pp.vk.me/c604524/v604524074/4424d/ZHMpIVUSxrg.jpg)

