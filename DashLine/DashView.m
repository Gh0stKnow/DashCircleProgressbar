//
//  DashView.m
//  DashLine
//
//  Created by Xiaodong Ge on 2016/12/8.
//  Copyright © 2016年 heygears. All rights reserved.
//

#import "DashView.h"
@interface DashView ()
@property (nonatomic, strong) CAShapeLayer* shapeLayer;

@end
@implementation DashView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor purpleColor];
    
    if (self) {
        [self dashCircle];
        
        
    }
    return self;
}

- (void)dashCircle
{
    
    
    //1.创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 150, 150);
    self.shapeLayer.position = self.center;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    // 设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 10.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    // 设置stroke起始点 一开始不显示
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 1;
    
    // 设置虚线格式
    [self.shapeLayer setLineDashPattern:@[@1,@10]];
    
    //2. 创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    
    
    //3. 让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
    //4. 添加并显示
    [self.layer addSublayer:self.shapeLayer];
    
}

// 开始动画的方法
- (void)startAnim
{
    CABasicAnimation *startAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    startAnim.duration = 0.2f;
    
    // 调整strokeEnd点的位置达到动画效果
    startAnim.fromValue = [NSNumber numberWithFloat:0.0f];
    startAnim.toValue = [NSNumber numberWithFloat:0.95f];
    startAnim.fillMode = kCAFillModeForwards;
    startAnim.removedOnCompletion = NO;
    [self.shapeLayer addAnimation:startAnim forKey:@"strokeEndAnimation"];
    
}

// 结束动画的方法
- (void)endAnim
{
    CABasicAnimation *startAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    startAnim.duration = 0.2f;
    // 调整strokeEnd点的位置达到动画效果
    startAnim.fromValue = [NSNumber numberWithFloat:0.95f];
    startAnim.toValue = [NSNumber numberWithFloat:0.0f];
    startAnim.fillMode = kCAFillModeForwards;
    startAnim.removedOnCompletion = NO;
    [self.shapeLayer addAnimation:startAnim forKey:@"strokeEndAnimation"];
}

@end
