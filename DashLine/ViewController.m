//
//  ViewController.m
//  DashLine
//
//  Created by Xiaodong Ge on 2016/12/8.
//  Copyright © 2016年 heygears. All rights reserved.
//

#import "ViewController.h"
#import "DashView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *end;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DashView * myView = [[DashView alloc] initWithFrame:CGRectMake(0, 0, 200 , 200)];
    [self.view addSubview:myView];
    
//    [self.start addTarget:myView action:@selector(startAnim) forControlEvents:UIControlEventTouchUpInside];
//    [self.end addTarget:myView action:@selector(endAnim) forControlEvents:UIControlEventTouchUpInside];
    
}




@end
