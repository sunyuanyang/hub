//
//  ColorView.m
//  TextElement
//
//  Created by cty on 14-9-30.
//  Copyright (c) 2014年 cty. All rights reserved.
//

#import "ColorView.h"
#define PI 3.14159265358979323846
#define radius 100
@implementation ColorView
static inline void drawArc(CGContextRef ctx, CGPoint point, float angle_start, float angle_end, UIColor* color) {
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextSetFillColor(ctx, CGColorGetComponents( [color CGColor]));
    CGContextAddArc(ctx, point.x, point.y, radius,  angle_start, angle_end, 0);
    //CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

static inline float radians(double degrees) {
    return degrees * PI / 180;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    
    
    float angle_start = radians(0.0);
    float angle_end = radians(121.0);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor yellowColor]);
    
    
    angle_start = angle_end;
    angle_end = radians(228.0);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor greenColor]);
    
    
    angle_start = angle_end;
    angle_end = radians(260);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor orangeColor]);
    
    
    angle_start = angle_end;
    angle_end = radians(360);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor purpleColor]);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
