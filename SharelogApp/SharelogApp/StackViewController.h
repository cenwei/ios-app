//
//  StackViewController.h
//  SharelogApp
//
//  Created by dada on 15/8/9.
//  Copyright (c) 2015年 slog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStackView.h"

@interface StackViewController : UIViewController <
PhotoStackViewDataSource,
PhotoStackViewDelegate,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) PhotoStackView *photoStack;
@property UIImagePickerController *imagePickerController;//系统照片选择控制器

@end
