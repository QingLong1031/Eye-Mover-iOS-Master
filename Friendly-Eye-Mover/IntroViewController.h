//
//  IntroViewController.h
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/28/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYCustomPanel.h"
#import "MYCustomPanel1.h"

#import "MYBlurIntroductionView.h"

@interface IntroViewController : UIViewController <MYIntroductionDelegate> {

    UIImageView *movingBall;
    UILabel *noticeLabel1;
    UILabel *noticeLabel2;
    CGPoint pos;
    MYCustomPanel *panel1;
    MYCustomPanel *panel2;
    MYCustomPanel *panel3;
    MYCustomPanel *panel4;
    MYCustomPanel *panel5;

    MYCustomPanel1 *panel1_1;
    MYCustomPanel1 *panel1_2;
    MYCustomPanel1 *panel1_3;
    MYCustomPanel *panel1_4;
    MYCustomPanel1 *panel1_5;
    
    MYBlurIntroductionView *introductionView;
}

@end
