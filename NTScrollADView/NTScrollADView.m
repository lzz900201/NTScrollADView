//
//  NTScrollADView.m
//  NTScrollADView
//
//  Created by Liu Zhuang on 6/6/13.
//  Copyright (c) 2013 Liu Zhuang. All rights reserved.
//

#import "NTScrollADView.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>

@implementation NTScrollADView

- (void)dealloc
{
    [_itemImages release];
    [_itemTitles release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 2);
        self.layer.shadowOpacity = 0.5;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        [_scrollView release];
        
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 31, self.bounds.size.width, 31)];
        _titleView.backgroundColor = [UIColor blackColor];
        _titleView.alpha = 0.5;
        [self addSubview:_titleView];
        [_titleView release];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
        CGPoint labelCenter = _titleLabel.center;
        labelCenter.y = _titleView.center.y;
        _titleLabel.center = labelCenter;
        _titleLabel.numberOfLines = 1;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont fontWithName:@"Helevetica_Bold" size:12.0f];
        _titleLabel.textColor  = [UIColor whiteColor];
        _titleLabel.alpha = 1;
        _titleLabel.text = @"好的";
        [self addSubview:_titleLabel];
        [_titleLabel release];
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 0, 50, 20)];
        CGPoint pagerCenter = _pageControl.center;
        pagerCenter.y = _titleView.center.y;
        _pageControl.center = pagerCenter;
        _pageControl.backgroundColor = [UIColor clearColor];
        [self addSubview:_pageControl];
        [_pageControl release];


    }
    return self;
}

- (void)setBounces:(BOOL)bounces
{
    _scrollView.bounces = bounces;
}

- (void)setDataSource:(id<NTScrollADViewDataSource>)dataSource
{
    if (dataSource && [dataSource respondsToSelector:@selector(itemImagesInNTScrollADView:)]) {
        
        self.itemImages = [dataSource itemImagesInNTScrollADView:self];
        
        _pageControl.numberOfPages = [_itemImages count];
        int c = [_itemImages count];
        int width = self.frame.size.width;
        int height = self.frame.size.height;
        _scrollView.contentSize = CGSizeMake(width * c, self.frame.size.height);
        for (int i = 0 ; i < [_itemImages count]; i ++) {
            
            id item = _itemImages[i];
            
            int x = i * width;
            UIImageView *iamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, width, height)];
            iamgeView.backgroundColor = [UIColor clearColor];
            [_scrollView addSubview:iamgeView];
            [iamgeView release];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            button.frame = iamgeView.frame;
            button.backgroundColor = [UIColor clearColor];
            [_scrollView addSubview:button];
            
            if ([item isKindOfClass:[NSURL class]] || [item isKindOfClass:[NSString class]]) {
                
                if ([item isKindOfClass:[NSURL class]]) {
                    [iamgeView setImageWithURL:item];
                }
                
                if ([item isKindOfClass:[NSString class]]) {
                    NSURL *url = [NSURL URLWithString:item];
                    [iamgeView setImageWithURL:url];
                }
                
            } else if ([item isKindOfClass:[UIImage class]]) {
                
                [iamgeView setImage:[_itemImages objectAtIndex:i]];
                
            }
        } 

    }
    
    if (dataSource && [dataSource respondsToSelector:@selector(itemTitlesInNTScrollADView:)]) {
        self.itemTitles = [dataSource itemTitlesInNTScrollADView:self];
        _titleLabel.text = _itemTitles[0];   

    }
}

- (void)buttonClicked:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(scrollADView:didSelectImageAtIndex:)]) {
        [_delegate scrollADView:self didSelectImageAtIndex:_idx];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int x = scrollView.contentOffset.x;
    int page = x / self.frame.size.width;
    _idx = page;
    _pageControl.currentPage = page;
    _titleLabel.text = _itemTitles[page];

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
