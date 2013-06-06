//
//  ViewController.h
//  NTScrollADView
//
//  Created by Liu Zhuang on 6/6/13.
//  Copyright (c) 2013 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTScrollADView.h"

@interface ViewController : UIViewController<NTScrollADViewDataSource,NTScrollADViewDelegate>
{
    NTScrollADView      *_scrollADView;
}

@end
