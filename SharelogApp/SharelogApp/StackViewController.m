//
//  StackViewController.m
//  SharelogApp
//
//  Created by dada on 15/8/9.
//  Copyright (c) 2015年 slog. All rights reserved.
//

#import "StackViewController.h"

@interface StackViewController ()
    @property (nonatomic, strong) NSArray *photos;
    -(void)setup;
@end

@implementation StackViewController

@synthesize photoStack = _photoStack,
pageControl = _pageControl;

#pragma mark -
#pragma mark Getters

-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

-(NSArray *)photos {
    if(!_photos) {
        UIImage *img = [self OriginImage:[UIImage imageNamed:@"test1.jpg"] scaleToSize:CGSizeMake(250, 250)];
        _photos = [NSArray arrayWithObjects:img,nil];
    }
    return _photos;
}

-(PhotoStackView *)photoStack {
    if(!_photoStack) {
        _photoStack = [[PhotoStackView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _photoStack.center = CGPointMake(self.view.center.x, 170);
        _photoStack.dataSource = self;
        _photoStack.delegate = self;
    }
    
    return _photoStack;
}


#pragma mark -
#pragma mark Deck DataSource Protocol Methods

-(NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack {
    return [self.photos count];
}

-(UIImage *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index {
    return [self.photos objectAtIndex:index];
}

#pragma mark -
#pragma mark Deck Delegate Protocol Methods

-(void)photoStackView:(PhotoStackView *)photoStackView willStartMovingPhotoAtIndex:(NSUInteger)index {
    // User started moving a photo
}

-(void)photoStackView:(PhotoStackView *)photoStackView willFlickAwayPhotoAtIndex:(NSUInteger)index {
    // User flicked the photo away, revealing the next one in the stack
}

-(void)photoStackView:(PhotoStackView *)photoStackView didRevealPhotoAtIndex:(NSUInteger)index {
    self.pageControl.currentPage = index;
}

-(void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index {
    NSLog(@"selected %u", index);
}

#pragma mark -
#pragma mark Actions

- (IBAction)tappedInsertAnotherPhoto:(id)sender {
    NSMutableArray *photosMutable = [self.photos mutableCopy];
    [photosMutable addObject:[UIImage imageNamed:@"test5.jpg"]];
    self.photos = photosMutable;
    [self.photoStack reloadData];
    self.pageControl.numberOfPages = [self.photos count];
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
    UIImage *img = [self OriginImage:selectedImage scaleToSize:CGSizeMake(250, 250)];
    NSMutableArray *photosMutable = [self.photos mutableCopy];
    [photosMutable addObject:img];
    self.photos = photosMutable;
    [self.photoStack reloadData];
    self.pageControl.numberOfPages = [self.photos count];
}


#pragma mark -
#pragma mark Setup

-(void)setup {
    [self.view addSubview:self.photoStack];
    self.pageControl.numberOfPages = [self.photos count];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
    //初始化图片选择器
    self.imagePickerController=[[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self setPageControl:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
