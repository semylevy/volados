//
//  ViewController.m
//  volados
//
//  Created by Semy Levy on 15/11/16.
//  Copyright © 2016 Semy Levy. All rights reserved.
//

#import "ViewController.h"
#import "Count.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize animationImageView,
            player,
            logo,
            player2,
            player3,
            player4,
            dedo,
            aguila,
            sol,
            porcentajes;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake((width/2)-141.5, 40, 283, 142)];
    UIImage *imageLogo = [UIImage imageNamed: @"logo.png"];
    [logo setImage:imageLogo];
    
    dedo = [[UIImageView alloc] initWithFrame:CGRectMake(50, 550, 108.3, 133.5)];
    UIImage *imageDedo = [UIImage imageNamed: @"dedo.png"];
    [dedo setImage:imageDedo];
    
    animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake((width/2)-64, 500, 128, 128)];
    UIImage *imageMoneda = [UIImage imageNamed: @"img8.png"];
    [animationImageView setImage:imageMoneda];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTouch:)];
    singleTap.numberOfTapsRequired = 1;
    [animationImageView setUserInteractionEnabled:YES];
    [animationImageView addGestureRecognizer:singleTap];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(lanzaFn:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [animationImageView addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(giraIzquierdaFn:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(giraDerechaFn:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/sound.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    player.numberOfLoops = 0;
    
    NSString *soundFilePath2 = [NSString stringWithFormat:@"%@/roll.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL2 = [NSURL fileURLWithPath:soundFilePath2];
    
    player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL2 error:nil];
    player2.numberOfLoops = 0;
    
    NSString *soundFilePath3 = [NSString stringWithFormat:@"%@/aguila.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL3 = [NSURL fileURLWithPath:soundFilePath3];
    
    player3 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL3 error:nil];
    player3.numberOfLoops = 0;
    
    NSString *soundFilePath4 = [NSString stringWithFormat:@"%@/sonidoSol.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL4 = [NSURL fileURLWithPath:soundFilePath4];
    
    player4 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL4 error:nil];
    player4.numberOfLoops = 0;

    [self.view addSubview:animationImageView];
    [self.view addSubview:logo];
    
    porcentajes = [[UITextField alloc] initWithFrame:CGRectMake(64, 110, 300, 100)];
    porcentajes.textColor = [UIColor blueColor];
    [porcentajes setFont:[UIFont fontWithName:@"Courier-Bold" size:24]];
    //porcentajes.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:porcentajes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)singleTouch:(id)sender {
    [self.view addSubview:dedo];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.duration = 0.7;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transformAnimation.removedOnCompletion = NO;
    transformAnimation.fillMode = kCAFillModeForwards;
    
    CATransform3D xform = CATransform3DIdentity;
    xform = CATransform3DScale(xform, 1.0, 1.0, 1.0);
    xform = CATransform3DTranslate(xform, 200, 0, 0);
    transformAnimation.toValue = [NSValue valueWithCATransform3D:xform];
    [self.dedo.layer addAnimation:transformAnimation forKey:@"transformAnimation"];
    
    double delayInSeconds = 0.7;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [dedo removeFromSuperview];
    });

}

- (void)lanzaFn:(id)sender {
    NSArray *imageNames = @[@"img1.png", @"img2.png", @"img3.png", @"img4.png", @"img5.png", @"img6.png", @"img7.png", @"img6.png", @"img5.png", @"img4.png", @"img3.png", @"img2.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 1.0;
    
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
                [self solFn];
                [animationImageView setImage:imageMoneda];
            } else {
                [self aguilaFn];
                [animationImageView setImage:imageMoneda2];
            }
            
        });
    });
}

- (void)giraDerechaFn:(id)sender {
    NSArray *imageNames = @[@"img13.png", @"img12.png", @"img11.png", @"img10.png", @"img9.png", @"img8.png", @"img9.png", @"img10.png", @"img11.png", @"img12.png", @"img13.png", @"img14.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;
    
    [player2 play];
    
    [animationImageView startAnimating];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [animationImageView stopAnimating];
        
        UIImage *imageMoneda = [UIImage imageNamed: @"img1.png"];
        UIImage *imageMoneda2 = [UIImage imageNamed: @"img7.png"];
        if(arc4random_uniform(2) == 1) {
            [self solFn];
            [animationImageView setImage:imageMoneda];
        } else {
            [self aguilaFn];
            [animationImageView setImage:imageMoneda2];
        }
    });
}

- (void)giraIzquierdaFn:(id)sender {
    NSArray *imageNames = @[@"img9.png", @"img10.png", @"img11.png", @"img12.png", @"img13.png", @"img14.png", @"img13.png", @"img12.png", @"img11.png", @"img10.png", @"img9.png", @"img8.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;
    
    [player2 play];
    
    [animationImageView startAnimating];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [animationImageView stopAnimating];
        
        UIImage *imageMoneda = [UIImage imageNamed: @"img1.png"];
        UIImage *imageMoneda2 = [UIImage imageNamed: @"img7.png"];
        if(arc4random_uniform(2) == 1) {
            [self solFn];
            [animationImageView setImage:imageMoneda];
        } else {
            [self aguilaFn];
            [animationImageView setImage:imageMoneda2];
        }
    });
}

- (void) aguilaFn {
    [Count SET_CONTADOR_AGUILA:([Count GET_CONTADOR_AGUILA] + 1)];
    NSString * porcentajeTxt = [NSString stringWithFormat:@"Águila: %d \n Sol: %d", [Count GET_CONTADOR_AGUILA], [Count GET_CONTADOR_SOL]];
    porcentajes.text = porcentajeTxt;
    
    aguila = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 300.3, 146.6)];
    UIImage *imageAguila = [UIImage imageNamed:@"aguila.png"];
    [aguila setImage:imageAguila];
    [self.view addSubview:aguila];
    
//    NSArray *imageNames = @[@"a1.png", @"a2.png", @"a3.png", @"a4.png"];
//    
//    NSMutableArray *images = [[NSMutableArray alloc] init];
//    for (int i = 0; i < imageNames.count; i++) {
//        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
//    }
//    
//    aguila.animationImages = images;
//    aguila.animationDuration = 2.0;
    
    [player3 play];
    
    [aguila startAnimating];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.duration = 1.0;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transformAnimation.removedOnCompletion = NO;
    transformAnimation.fillMode = kCAFillModeForwards;
    
    CATransform3D xform = CATransform3DIdentity;
    xform = CATransform3DScale(xform, 5.0, 5.0, 1.0);
    xform = CATransform3DTranslate(xform, 0, 0, 0);
    transformAnimation.toValue = [NSValue valueWithCATransform3D:xform];
    [self.aguila.layer addAnimation:transformAnimation forKey:@"transformAnimation"];
    
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [aguila removeFromSuperview];
    });

}

- (void) solFn {
    [Count SET_CONTADOR_SOL:([Count GET_CONTADOR_SOL] + 1)];
    NSString * porcentajeTxt = [NSString stringWithFormat:@"Águila: %d \n Sol: %d", [Count GET_CONTADOR_AGUILA], [Count GET_CONTADOR_SOL]];
    porcentajes.text = porcentajeTxt;
    
    sol = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    //UIImage *imageAguila = [UIImage imageNamed:@"aguila.png"];
    //[aguila setImage:imageAguila];
    
    [self.view addSubview:sol];
    
    NSArray *imageNames = @[@"S1.png", @"S2.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    sol.animationImages = images;
    sol.animationDuration = 0.5;
    
    [player4 play];
    
    [sol startAnimating];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.duration = 2.0;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transformAnimation.removedOnCompletion = NO;
    transformAnimation.fillMode = kCAFillModeForwards;
    
    CATransform3D xform = CATransform3DIdentity;
    xform = CATransform3DScale(xform, 1.5, 1.5, 1.0);
    xform = CATransform3DTranslate(xform, 0, 0, 0);
    transformAnimation.toValue = [NSValue valueWithCATransform3D:xform];
    [self.sol.layer addAnimation:transformAnimation forKey:@"transformAnimation"];
    
    double delayInSeconds = 2.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [sol removeFromSuperview];
    });
    
}

@end
