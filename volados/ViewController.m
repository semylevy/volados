//
//  ViewController.m
//  volados
//
//  Created by Semy Levy on 15/11/16.
//  Copyright © 2016 Semy Levy. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize animationImageView,
            player,
            logo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    NSArray *imageNames = @[@"img1.png", @"img2.png", @"img3.png", @"img4.png", @"img5.png", @"img6.png", @"img7.png", @"img6.png", @"img5.png", @"img4.png", @"img3.png", @"img2.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake((width/2)-141.5, 40, 283, 142)];
    UIImage *imageLogo = [UIImage imageNamed: @"logo.png"];
    [logo setImage:imageLogo];
    
    animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake((width/2)-64, 500, 128, 128)];
    UIImage *imageMoneda = [UIImage imageNamed: @"img1.png"];
    [animationImageView setImage:imageMoneda];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 1.0;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lanzaFn:)];
    singleTap.numberOfTapsRequired = 1;
    [animationImageView setUserInteractionEnabled:YES];
    [animationImageView addGestureRecognizer:singleTap];
    
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/sound.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    player.numberOfLoops = 0;
    
    [self.view addSubview:animationImageView];
    [self.view addSubview:logo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)lanzaFn:(id)sender {
    [player play];
    
    [animationImageView startAnimating];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.duration = 0.7;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transformAnimation.removedOnCompletion = NO;
    transformAnimation.fillMode = kCAFillModeForwards;
    
    CATransform3D xform = CATransform3DIdentity;
    xform = CATransform3DScale(xform, 1.0, 1.0, 1.0);
    xform = CATransform3DTranslate(xform, 0, -1000, 0);
    transformAnimation.toValue = [NSValue valueWithCATransform3D:xform];
    [self.animationImageView.layer addAnimation:transformAnimation forKey:@"transformAnimation"];
    
    double delayInSeconds = 0.7;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        CABasicAnimation *transformAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform"];
        transformAnimation2.duration = 0.7;
        transformAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        transformAnimation2.removedOnCompletion = NO;
        transformAnimation2.fillMode = kCAFillModeForwards;
        
        CATransform3D xform2 = CATransform3DIdentity;
        xform2 = CATransform3DScale(xform2, 1.0, 1.0, 1.0);
        xform2 = CATransform3DTranslate(xform2, 0, 0, 0);
        transformAnimation2.toValue = [NSValue valueWithCATransform3D:xform2];
        [self.animationImageView.layer addAnimation:transformAnimation2 forKey:@"transformAnimation2"];
        
        double delayInSeconds = 0.7;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [animationImageView stopAnimating];
            
            UIImage *imageMoneda = [UIImage imageNamed: @"img1.png"];
            UIImage *imageMoneda2 = [UIImage imageNamed: @"img7.png"];
            if(arc4random_uniform(2) == 1) {
                [animationImageView setImage:imageMoneda];
            } else {
                [animationImageView setImage:imageMoneda2];
            }
            
        });
        
        
    });
    
    

}

@end
