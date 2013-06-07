//
//  ViewController.m
//  NTScrollADView
//
//  Created by Liu Zhuang on 6/6/13.
//  Copyright (c) 2013 Liu Zhuang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _scrollADView = [[NTScrollADView alloc] initWithFrame:CGRectMake(0, 20, 320, 137)];
    _scrollADView.bounces = NO;
    _scrollADView.dataSource = self;
    _scrollADView.delegate = self;
    [self.view addSubview:_scrollADView];
    [_scrollADView release];
}

- (NSArray *)itemImagesInNTScrollADView:(NTScrollADView *)scrollADView
{
    UIImage *iamge1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"3.jpg"];
    NSArray *arr = [[NSArray alloc] initWithObjects:@"http://ww1.sinaimg.cn/bmiddle/b0b68d1ajw1e5eduidtf3j20c30a0dg5.jpg",@"http://ww4.sinaimg.cn/mw600/8c5f3703jw1e5ei5gocg1j20dc09tjsi.jpg",@"http://ww3.sinaimg.cn/mw600/65bb73e0jw1e5eqc4tyb1j21hc0u0wp9.jpg", nil/*iamge1,image2,image3,nil*/];

    return arr;
}
- (NSArray *)itemTitlesInNTScrollADView:(NTScrollADView *)scrollADView
{
    NSArray *arr = @[@"aoe",@"你好",@"dajiahao"];
    return arr;
}

- (void)scrollADView:(NTScrollADView *)scrollADView didSelectImageAtIndex:(NSInteger)idx
{
    NSLog(@"点击了第%d个",idx);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
