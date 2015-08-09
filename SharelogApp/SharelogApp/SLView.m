//
//  SLView.m
//  SharelogApp
//
//  Created by dada on 15/7/19.
//  Copyright (c) 2015年 slog. All rights reserved.
//

#import "SLView.h"

@implementation SLView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.contextRef = UIGraphicsGetCurrentContext();
}

@end
