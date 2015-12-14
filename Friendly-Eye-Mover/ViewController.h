//
//  ViewController.h
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/27/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    UIInterfaceOrientation prevInterfaceOrientation;
    IBOutlet UIButton *startBtn;
    IBOutlet UIButton *explanationBtn;
    NSString *startInfo;
    
}

- (IBAction)showIntro:(id)sender;
- (IBAction)showExplanation:(id)sender;

@end

