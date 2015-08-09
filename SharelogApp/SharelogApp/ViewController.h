//
//  ViewController.h
//  SharelogApp
//
//  Created by titengjiang on 15/5/13.
//  Copyright (c) 2015年 slog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLView.h"

@interface ViewController :
UIViewController<UITableViewDataSource,
UITableViewDelegate,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *orgView;// 原始图片显示视图
@property (strong, nonatomic) IBOutlet UIImageView *edtView;// 修改后图片显示视图
@property (strong, nonatomic) UIImage *orgImg;// 原始图片
@property (strong, nonatomic) IBOutlet UITableView *filterListView;// 滤镜列表
@property (strong, nonatomic) NSArray *filterList;// 滤镜名称
@property (strong, nonatomic) NSMutableArray *filterKeys;// 滤镜的属性UI控件
@property (strong, nonatomic) CIFilter *filter;// 滤镜
@property (strong, nonatomic) IBOutlet UIView *filterPropertyView;// 属性视图
@property NSInteger filterIndex;// 当前选择的滤镜索引
@property UIImagePickerController *imagePickerController;//系统照片选择控制器
@property CIContext *context;// Core Image上下文
@property SLView *drawView;// 绘制视图
- (IBAction)onSubmit:(id)sender;
- (IBAction)onAddImg:(id)sender;

@end

