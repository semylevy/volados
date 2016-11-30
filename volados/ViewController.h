//
//  ViewController.h
//  volados
//
//  Created by Semy Levy on 15/11/16.
//  Copyright © 2016 Semy Levy. All rights reserved.
//

#import "Count.h"
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) UIImageView *animationImageView;
@property (strong, nonatomic) UIImageView *logo;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVAudioPlayer *player2;
@property (strong, nonatomic) AVAudioPlayer *player3;
@property (strong, nonatomic) AVAudioPlayer *player4;
@property (strong, nonatomic) UIImageView *dedo;
@property (strong, nonatomic) UIImageView *aguila;
@property (strong, nonatomic) UIImageView *sol;
@property (strong, nonatomic) UITextField *porcentajes;

@end

