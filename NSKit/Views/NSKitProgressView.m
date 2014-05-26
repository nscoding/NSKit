//
//  NSKitProgressView.m
//  NSKit
//
//  Created by Patrick Chamelo on 26/05/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "NSKitProgressView.h"

#import <QuartzCore/QuartzCore.h>


// ------------------------------------------------------------------------------------------


@interface NSKitProgressView()

@property (nonatomic, assign) CGFloat currentProgress;
@property (nonatomic, strong) CAShapeLayer *backgroundLineLayer;
@property (nonatomic, strong) CAShapeLayer *progressLineLayer;

@end


// ------------------------------------------------------------------------------------------


@implementation NSKitProgressView


// ------------------------------------------------------------------------------------------
#pragma mark - Initializers
// ------------------------------------------------------------------------------------------
- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self configure];
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self configure];
    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Configure
// ------------------------------------------------------------------------------------------
- (void)configure
{
    self.wantsLayer = YES;
    self.currentProgress = 0.0;
    self.duration = 0.4f;
    
    self.progressLineWidth = 3.0f;
    self.progressLineColor = [NSColor lightGrayColor];
    
    self.backgroundLineWidth = 6.0f;
    self.backgroundLineColor = [NSColor darkGrayColor];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Getters
// ------------------------------------------------------------------------------------------
- (CAShapeLayer *)backgroundLineLayer
{
    if (_backgroundLineLayer == nil)
    {
        _backgroundLineLayer = [CAShapeLayer layer];
        [self.layer addSublayer:_backgroundLineLayer];
    }
    
    return _backgroundLineLayer;
}


- (CAShapeLayer *)progressLineLayer
{
    if (_progressLineLayer == nil)
    {
        _progressLineLayer = [CAShapeLayer layer];
        [self.layer addSublayer:_progressLineLayer];
    }
    
    return _progressLineLayer;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Setters
// ------------------------------------------------------------------------------------------
- (void)setProgress:(CGFloat)progress
{
    [self setProgress:progress animated:NO];
}


- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    // Boundry correctness
    progress = MIN(progress, 1.0f);
    progress = MAX(progress, 0.0f);
    
    _progress = progress;
    
    CGFloat borderWidth = MAX(self.progressLineWidth, self.backgroundLineWidth);
    CGFloat radius = (MIN(self.frame.size.width, self.frame.size.height) / 2.0f) - borderWidth;
    CGFloat diameter = (radius * 2.0f);
    CGRect cirlceRect = CGRectMake(NSMidX(self.bounds) - radius, NSMidY(self.bounds) - radius, diameter, diameter);
    
    CGPathRef path = [self createCirclePathRefForRect:cirlceRect];
    
    self.backgroundLineLayer.path = path;
    self.backgroundLineLayer.fillColor = [NSColor clearColor].CGColor;
    self.backgroundLineLayer.strokeColor = self.backgroundLineColor.CGColor;
    self.backgroundLineLayer.lineWidth = self.backgroundLineWidth;
    
    self.progressLineLayer.path = self.backgroundLineLayer.path;
    self.progressLineLayer.fillColor = [NSColor clearColor].CGColor;
    self.progressLineLayer.strokeColor = self.progressLineColor.CGColor;
    self.progressLineLayer.lineWidth = self.progressLineWidth;
    
    CFTimeInterval animationDuration = (animated ? self.duration : 0.0);
    [self.progressLineLayer addAnimation:[self fillAnimationWithDuration:animationDuration]
                                  forKey:@"strokeEnd"];
    
    self.currentProgress = _progress;
    
    CGPathRelease(path);
}


// ------------------------------------------------------------------------------------------
#pragma mark - Animation helper
// ------------------------------------------------------------------------------------------
- (CABasicAnimation *)fillAnimationWithDuration:(CFTimeInterval)duration
{
    CABasicAnimation *fillAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    fillAnimation.duration = duration;
    fillAnimation.removedOnCompletion = NO;
    fillAnimation.fillMode = kCAFillModeBoth;
    fillAnimation.fromValue = @(self.currentProgress);
    fillAnimation.toValue = @(self.progress);
    fillAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return fillAnimation;
}


// ------------------------------------------------------------------------------------------
#pragma mark - CGPath helper
// ------------------------------------------------------------------------------------------
- (CGPathRef)createCirclePathRefForRect:(CGRect)rect
{
    /**
     CGPathAddEllipseInRect creates the path in an anticlockwise direction and
     the "strokeEnd" values/animation is reverted. By creating the path ourselfs we ensure
     that the direction is clockwise and the animation direction is correct.
     */
    
    CGFloat cornerRadius = (rect.size.width / 2);
    CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect);
    CGFloat miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, midx + 0.5f, maxy + 0.5f);
    CGPathAddArcToPoint(path, NULL, maxx + 0.5f, maxy + 0.5f, maxx + 0.5f, midy + 0.5f, cornerRadius);
    CGPathAddArcToPoint(path, NULL, maxx + 0.5f, miny + 0.5f, midx + 0.5f, miny + 0.5f, cornerRadius);
    CGPathAddArcToPoint(path, NULL, minx + 0.5f, miny + 0.5f, minx + 0.5f, midy + 0.5f, cornerRadius);
    CGPathAddArcToPoint(path, NULL, minx + 0.5f, maxy + 0.5f, midx + 0.5f, maxy + 0.5f, cornerRadius);
    CGPathCloseSubpath(path);
    
    return path;
}


@end

