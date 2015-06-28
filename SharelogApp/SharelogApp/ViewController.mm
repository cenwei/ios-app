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



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.orgImg = [UIImage imageNamed:@"Lena1.jpg"];
    self.orgView.image = self.orgImg;
    self.filterList = [NSArray arrayWithObjects:
                       @"CISepiaTone",
                       @"CIVignetteEffect",
                       @"CIVignette",
                       @"CIColorMonochrome",nil];
    /*
    self.filterList = [NSArray arrayWithObjects:
                       // CICategoryBlur
                       @"CIBoxBlur",
                       @"CIDiscBlur",
                       @"CIGaussianBlur",
                       @"CIMaskedVariableBlur",
                       @"CIMedianFilter",
                       @"CIMotionBlur",
                       @"CINoiseReduction",
                       @"CIZoomBlur",
                       // CICategoryColorAdjustment
                       @"CIColorClamp",
                       @"CIColorControls",
                       @"CIColorMatrix",
                       @"CIColorPolynomial",
                       @"CIExposureAdjust",
                       @"CIGammaAdjust",
                       @"CIHueAdjust",
                       @"CILinearToSRGBToneCurve",
                       @"CISRGBToneCurveToLinear",
                       @"CITemperatureAndTint",
                       @"CIToneCurve",
                       @"CIVibrance",
                       @"CIWhitePointAdjust",
                       // CICategoryColorEffect
                       @"CIColorCrossPolynomial",
                       @"CIColorCube",
                       @"CIColorCubeWithColorSpace",
                       @"CIColorInvert",
                       @"CIColorMap",
                       @"CIColorMonochrome",
                       @"CIColorPosterize",
                       @"CIFalseColor",
                       @"CIMaskToAlpha",
                       @"CIMaximumComponent",
                       @"CIMinimumComponent",
                       @"CIPhotoEffectChrome",
                       @"CIPhotoEffectFade",
                       @"CIPhotoEffectInstant",
                       @"CIPhotoEffectMono",
                       @"CIPhotoEffectNoir",
                       @"CIPhotoEffectProcess",
                       @"CIPhotoEffectTonal",
                       @"CIPhotoEffectTransfer",
                       @"CISepiaTone",
                       @"CIVignette",
                       @"CIVignetteEffect",
                       // CICategoryCompositeOperation
                       @"CIAdditionCompositing",
                       @"CIColorBlendMode",
                       @"CIColorBurnBlendMode",
                       @"CIColorDodgeBlendMode",
                       @"CIDarkenBlendMode",
                       @"CIDifferenceBlendMode",
                       @"CIDivideBlendMode",
                       @"CIExclusionBlendMode",
                       @"CIHardLightBlendMode",
                       @"CIHueBlendMode",
                       @"CILightenBlendMode",
                       @"CILinearBurnBlendMode",
                       @"CILinearDodgeBlendMode",
                       @"CILuminosityBlendMode",
                       @"CIMaximumCompositing",
                       @"CIMinimumCompositing",
                       @"CIMultiplyBlendMode",
                       @"CIMultiplyCompositing",
                       @"CIOverlayBlendMode",
                       @"CIPinLightBlendMode",
                       @"CISaturationBlendMode",
                       @"CIScreenBlendMode",
                       @"CISoftLightBlendMode",
                       @"CISourceAtopCompositing",
                       @"CISourceInCompositing",
                       @"CISourceOutCompositing",
                       @"CISourceOverCompositing",
                       @"CISubtractBlendMode",
                       // CICategoryDistortionEffect
                       @"CIBumpDistortion",
                       @"CIBumpDistortionLinear",
                       @"CICircleSplashDistortion",
                       @"CICircularWrap",
                       @"CIDroste",
                       @"CIDisplacementDistortion",
                       @"CIGlassDistortion",
                       @"CIGlassLozenge",
                       @"CIHoleDistortion",
                       @"CILightTunnel",
                       @"CIPinchDistortion",
                       @"CIStretchCrop",
                       @"CITorusLensDistortion",
                       @"CITwirlDistortion",
                       @"CIVortexDistortion",
                       // CICategoryGenerator
                       @"CIAztecCodeGenerator",
                       @"CICheckerboardGenerator",
                       @"CICode128BarcodeGenerator",
                       @"CIConstantColorGenerator",
                       @"CILenticularHaloGenerator",
                       @"CIQRCodeGenerator",
                       @"CIRandomGenerator",
                       @"CIStarShineGenerator",
                       @"CIStripesGenerator",
                       @"CISunbeamsGenerator",
                       // CICategoryGeometryAdjustment
                       @"CIAffineTransform",
                       @"CICrop",
                       @"CILanczosScaleTransform",
                       @"CIPerspectiveCorrection",
                       @"CIPerspectiveTransform",
                       @"CIPerspectiveTransformWithExtent",
                       @"CIStraightenFilter",
                       // CICategoryGradient
                       @"CIGaussianGradient",
                       @"CILinearGradient",
                       @"CIRadialGradient",
                       @"CISmoothLinearGradient",
                       // CICategoryHalftoneEffect
                       @"CICircularScreen",
                       @"CICMYKHalftone",
                       @"CIDotScreen",
                       @"CIHatchedScreen",
                       @"CILineScreen",
                       // CICategoryReduction
                       @"CIAreaAverage",
                       @"CIAreaHistogram",
                       @"CIRowAverage",
                       @"CIColumnAverage",
                       @"CIHistogramDisplayFilter",
                       @"CIAreaMaximum",
                       @"CIAreaMinimum",
                       @"CIAreaMaximumAlpha",
                       @"CIAreaMinimumAlpha",
                       // CICategorySharpen
                       @"CISharpenLuminance",
                       @"CIUnsharpMask",
                       // CICategoryStylize
                       @"CIBlendWithAlphaMask",
                       @"CIBlendWithMask",
                       @"CIBloom",
                       @"CIComicEffect",
                       @"CIConvolution3X3",
                       @"CIConvolution5X5",
                       @"CIConvolution7X7",
                       @"CIConvolution9Horizontal",
                       @"CIConvolution9Vertical",
                       @"CICrystallize",
                       @"CIDepthOfField",
                       @"CIEdges",
                       @"CIEdgeWork",
                       @"CIGloom",
                       @"CIHeightFieldFromMask",
                       @"CIHexagonalPixellate",
                       @"CIHighlightShadowAdjust",
                       @"CILineOverlay",
                       @"CIPixellate",
                       @"CIPointillize",
                       @"CIShadedMaterial",
                       @"CISpotColor",
                       @"CISpotLight",
                       // CICategoryTileEffect
                       @"CIAffineClamp",
                       @"CIAffineTile",
                       @"CIEightfoldReflectedTile",
                       @"CIFourfoldReflectedTile",
                       @"CIFourfoldRotatedTile",
                       @"CIFourfoldTranslatedTile",
                       @"CIGlideReflectedTile",
                       @"CIKaleidoscope",
                       @"CIOpTile",
                       @"CIParallelogramTile",
                       @"CIPerspectiveTile",
                       @"CISixfoldReflectedTile",
                       @"CISixfoldRotatedTile",
                       @"CITriangleKaleidoscope",
                       @"CITriangleTile",
                       @"CITwelvefoldReflectedTile",
                       // CICategoryTransition
                       @"CIAccordionFoldTransition",
                       @"CIBarsSwipeTransition",
                       @"CICopyMachineTransition",
                       @"CIDisintegrateWithMaskTransition",
                       @"CIDissolveTransition",
                       @"CIFlashTransition",
                       @"CIModTransition",
                       @"CIPageCurlTransition",
                       @"CIPageCurlWithShadowTransition",
                       @"CIRippleTransition",
                       @"CISwipeTransition",
                       nil];
     */
    
    self.filterListView.dataSource = self;
    self.filterListView.delegate = self;
    self.filterIndex = 0;
    
    [self.filterSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.filterSlider.continuous = FALSE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSubmit:(id)sender {
    void *data = [self getUIImageData:self.orgImg];
    unsigned width = self.orgImg.size.width;
    unsigned height = self.orgImg.size.height;

    UIImage *img = [self createUIImageWithData:data width:width height:height bytePerPixel:4];
    self.edtView.image = img;
    free(data);
}

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
    cell.imageView.image = [UIImage imageNamed:@"Lena1.jpg"];
    cell.detailTextLabel.text = @"详细信息";
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.filterIndex = indexPath.row;
    NSLog(@"select %@", [self.filterList objectAtIndex:self.filterIndex]);
}

- (void) sliderValueChanged:(id)sender{
    UISlider* control = (UISlider*)sender;
    if(control == self.filterSlider){
        self.filterValue = control.value;
        NSLog(@"slider value %f", self.filterValue);
        /* 添加自己的处理代码 */
        /*
        // 1
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"" ofType:@"jpg"];
        NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
        
        // 2
        CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
        */
        CIImage *beginImage = [CIImage imageWithCGImage:[self.orgImg CGImage]];
        
        // 3
        NSNumber *num = [NSNumber numberWithFloat:self.filterValue];
        NSString *filterName = [self.filterList objectAtIndex:self.filterIndex];
        CIFilter *filter = [CIFilter filterWithName:filterName
                                      keysAndValues: kCIInputImageKey, beginImage,
                            @"inputIntensity", num, nil];
        
        CIImage *outputImage = [filter outputImage];
        
        // 4
        UIImage *newImage = [UIImage imageWithCIImage:outputImage];
        self.edtView.image = newImage;
    }
}

@end
