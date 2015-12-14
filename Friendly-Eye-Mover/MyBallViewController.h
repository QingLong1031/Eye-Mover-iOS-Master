//
//  MyBallViewController.h
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/29/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MyBallViewController : UIViewController {
    
    CGPoint pos;
    CGPoint prevPos;
    CGPoint ballPos1;
    CGPoint ballPos2;
    CGPoint ballPos3;
//    UIImageView *movingBall;
    IBOutlet UIImageView *movingBall;
//    int touchNumber;
    int moving_index, index;
    BOOL run_flag;
    int action_end;
    
    AVAudioPlayer *player;
    AVAudioPlayer *gong_player;
    NSURL *gong_musicFileURL;
}

@end
