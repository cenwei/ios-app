//
//  ViewController.m
//  SharelogApp
//
//  Created by titengjiang on 15/5/13.
//  Copyright (c) 2015年 slog. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define TEST_IMG @"test6.jpg"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.orgImg = [UIImage imageNamed:TEST_IMG];
    self.orgView.image = self.orgImg;
    /*
    self.filterList = [NSArray arrayWithObjects:
                       @"CISepiaTone",
                       @"CIVignetteEffect",
                       @"CIVignette",
                       @"CIColorMonochrome",nil];
    */
    NSArray *filters = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    if(filters==nil){
        NSLog(@"no any filters");
        exit(0);
    }
    self.filterList = filters;
    
    self.filterListView.dataSource = self;
    self.filterListView.delegate = self;
    self.filterIndex = 0;
    
    /*[self.filterSlider addTarget:self action:@selector(sliderValueChanged:) 
                        forControlEvents:UIControlEventValueChanged];
    self.filterSlider.continuous = FALSE;*/
    
    //初始化图片选择器
    self.imagePickerController=[[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    
    //初始化CIContext
    //创建基于CPU的图像上下文
    //    NSNumber *number=[NSNumber numberWithBool:YES];
    //    NSDictionary *option=[NSDictionary dictionaryWithObject:number forKey:kCIContextUseSoftwareRenderer];
    //    _context=[CIContext contextWithOptions:option];
    // 使用GPU渲染，推荐,但注意GPU的CIContext无法跨应用访问，例如直接在UIImagePickerController的完成方法中调用上下文处理就会自动降级为CPU渲染，所以推荐现在完成方法中保存图像，然后在主程序中调用
    self.context=[CIContext contextWithOptions:nil];
    //    EAGLContext *eaglContext=[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES1];
    //    _context=[CIContext contextWithEAGLContext:eaglContext];//OpenGL优化过的图像上下文
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onSubmit:(id)sender {
    /*
    void *data = [self getUIImageData:self.orgImg];
    unsigned width = self.orgImg.size.width;
    unsigned height = self.orgImg.size.height;

    UIImage *img = [self createUIImageWithData:data width:width height:height bytePerPixel:4];
    self.edtView.image = img;
    free(data);
    */
    // 绘制视图
    CGRect rc = CGRectMake(100, 100, 100, 400);
    self.drawView = [[SLView alloc]initWithFrame: rc];
    [self.view addSubview:self.drawView];
    
    [self drawImage2];
}

#pragma mark 打开图片选择器
- (IBAction) onAddImg:(id)sender{
    //打开图片选择器
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark 保存图片
-(void)savePhoto:(UIBarButtonItem *)btn{
    //保存照片到相册
    /*UIImageWriteToSavedPhotosAlbum(_imageView.image, nil, nil, nil);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Sytem Info" message:@"Save Success!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];*/
}

#pragma mark 图片选择器选择图片代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //关闭图片选择器
    [self dismissViewControllerAnimated:YES completion:nil];
    //取得选择图片
    UIImage *selectedImage=[info objectForKey:UIImagePickerControllerOriginalImage];
    self.orgView.image = selectedImage;
    self.orgImg = selectedImage;
    //初始化CIImage源图像
    //_image=[CIImage imageWithCGImage:selectedImage.CGImage];
    //[_colorControlsFilter setValue:_image forKey:@"inputImage"];//设置滤镜的输入图片
}

#pragma mark 将输出图片设置到UIImageView
-(void)setImage{
    /*
     CIImage *outputImage= [_colorControlsFilter outputImage];//取得输出图像
    CGImageRef temp=[_context createCGImage:outputImage fromRect:[outputImage extent]];
    _imageView.image=[UIImage imageWithCGImage:temp];//转化为CGImage显示在界面中
    
    CGImageRelease(temp);//释放CGImage对象
     */
}

#pragma mark 旋转图片
-(void)drawImage2{
    CGContextRef context=self.drawView.contextRef;
    UIImage *image=self.orgImg;
    CGSize size=[UIScreen mainScreen].bounds.size;
    CGContextSaveGState(context);
    CGFloat height=450,y=50;
    //上下文形变
    CGContextScaleCTM(context, 1.0, -1.0);//在y轴缩放-1相当于沿着x张旋转180
    CGContextTranslateCTM(context, 0, -(size.height-(size.height-2*y-height)));//向上平移
    //图像绘制
    CGRect rect= CGRectMake(10, y, 300, height);
    CGContextDrawImage(context, rect, image.CGImage);
    
    CGContextRestoreGState(context);
}

/* useless */
- (UIImage*)createUIImageWithData:(void*)data width:(int)width height:(int)height bytePerPixel:(int)bytes{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef newContext =   CGBitmapContextCreate(data,
                                width, height, 8,
                                width*bytes,
                                colorSpace,
                                kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedFirst);
    CGImageRef frame = CGBitmapContextCreateImage(newContext);
    UIImage *img = [UIImage imageWithCGImage:frame];
    CGImageRelease(frame);
    CGContextRelease(newContext);
    CGColorSpaceRelease(colorSpace);
    return img;
}

/* useless */
- (void*)getUIImageData:(UIImage*)img{
    CGImageRef image = [img CGImage];
    CGSize image_size = img.size;
    int bytesPerPixel = 4;
    int length = image_size.width * image_size.height * bytesPerPixel;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    void *data = malloc(length);
    if(!data){
        NSLog(@"no enough memory");
        return NULL;
    }
    CGContextRef context =  CGBitmapContextCreate(data,
                            image_size.width, image_size.height, 8,
                            bytesPerPixel*image_size.width,
                            colorSpace,
                            kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, CGRectMake(0, 0, image_size.width, image_size.height), image);
    CGContextRelease(context);
    return data;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault/*UITableViewCellStyleValue2*/ reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.filterList objectAtIndex:row];
    cell.imageView.image = [UIImage imageNamed:TEST_IMG];
    //cell.detailTextLabel.text = @"详细信息";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return indexPath.row;
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filterList.count;
}

- (void)updateImage{
    // 异步处理
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
    ^(void){
        for(UISlider *slider in self.filterPropertyView.subviews){
            NSNumber *num = [NSNumber numberWithFloat:slider.value];
            for(id key in self.filter.attributes){
                NSDictionary *property = [self.filter.attributes objectForKey:key];
                if([property isKindOfClass:[NSDictionary class]] && [property objectForKey:@"tag"]){
                    if(slider.tag == [[property valueForKey:@"tag"] integerValue]){
                        [self.filter setValue:num forKey:key];
                        NSLog(@"%@ = %@", key, num);
                    }
                }
            }
        }
        
        CIImage *outputImage = [self.filter outputImage];
        UIImage *newImage = [UIImage imageWithCIImage:outputImage];
                       
        dispatch_async(dispatch_get_main_queue(),
        ^(void){
            self.edtView.image = newImage;
        });
    });
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.filterIndex = indexPath.row;
    NSString *filterName = [self.filterList objectAtIndex:self.filterIndex];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    if(filter==nil) return;
    NSArray *inKeys = [filter inputKeys];
    //NSArray *outKeys = [filter outputKeys];
    // remove all UISlider
    for(id slider in self.filterPropertyView.subviews){
        if([slider isKindOfClass:[UISlider class]]){
            [slider setHidden:YES];
            [slider removeFromSuperview];
        }
    }
    // add new UISlider
    CGFloat width = self.filterPropertyView.frame.size.width;
    CGFloat height = self.filterPropertyView.frame.size.height / inKeys.count;
    NSInteger line = 0;
    for(NSInteger i=0; i<inKeys.count; i++){
        NSString *key = [inKeys objectAtIndex:i];
        NSDictionary *attribute = [filter.attributes objectForKey:key];
        NSString *type = [attribute objectForKey:@"CIAttributeClass"];
        if([type isEqualToString:@"NSInteger"] || [type isEqualToString:@"NSNumber"]){
            UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, line*height, width, height)];
            [slider addTarget:self action:@selector(sliderValueChanged:)
                        forControlEvents:UIControlEventValueChanged];
            slider.continuous = FALSE;
            slider.tag = i;// 记录标签
            [attribute setValue:[NSString stringWithFormat:@"%ld", (long)i] forKey:@"tag"];
            slider.minimumValue = [[attribute objectForKey:@"CIAttributeSliderMin"] floatValue];
            slider.maximumValue = [[attribute objectForKey:@"CIAttributeSliderMax"] floatValue];
            slider.value = [[attribute objectForKey:@"CIAttributeDefault"] floatValue];
            [self.filterPropertyView addSubview:slider];
            line++;
        }
        if([type isEqualToString:@"NSValue"]){
            // FIXME

        }
        if([type isEqualToString:@"CIImage"]){
            // FIXME
            
        }
        
    }
    self.filter = filter;
    CIImage *beginImage = [CIImage imageWithCGImage:[self.orgImg CGImage]];
    if([self.filter.attributes objectForKey:@"inputImage"]!=nil){
        [self.filter setValue:beginImage forKey:@"inputImage"];
    }
    //NSLog(@"\n%@", filter.attributes);
    [self updateImage];
}

#pragma mark 滑动按钮事件
- (void) sliderValueChanged:(id)sender{
    [self updateImage];
}

@end
