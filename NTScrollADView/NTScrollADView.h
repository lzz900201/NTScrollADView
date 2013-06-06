//
//  NTScrollADView.h
//  NTScrollADView
//
//  Created by Liu Zhuang on 6/6/13.
//  Copyright (c) 2013 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NTScrollADViewDataSource;
@protocol NTScrollADViewDelegate;

@interface NTScrollADView : UIView<UIScrollViewDelegate>
{
    UIScrollView    *_scrollView;
    UIView          *_titleView;
    UILabel         *_titleLabel;
    UIImageView     *_imageView;
    UIPageControl   *_pageControl;
    
    NSArray         *_itemTitles;
    NSArray         *_itemImages;
    
    NSInteger       _idx;
    
    id<NTScrollADViewDataSource> _dataSource;
    id<NTScrollADViewDelegate> _delegate;
    
};

@property (nonatomic, retain) NSArray *itemTitles;
@property (nonatomic, retain) NSArray *itemImages;

@property (nonatomic, assign) BOOL bounces;

@property (nonatomic, assign) id<NTScrollADViewDataSource> dataSource;
@property (nonatomic, assign) id<NTScrollADViewDelegate> delegate;


@end

@protocol NTScrollADViewDataSource <NSObject>

@required
- (NSArray *)itemImagesInNTScrollADView:(NTScrollADView *)scrollADView;
- (NSArray *)itemTitlesInNTScrollADView:(NTScrollADView *)scrollADView;

@end

@protocol NTScrollADViewDelegate <NSObject>

- (void)scrollADView:(NTScrollADView *)scrollADView didSelectImageAtIndex:(NSInteger)idx;

@end
