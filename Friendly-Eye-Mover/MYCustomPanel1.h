//
//  MYCustomPanel1.h
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/29/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "MYIntroductionPanel.h"

@interface MYCustomPanel1 : MYIntroductionPanel <UITextViewDelegate> {
    
    __weak IBOutlet UIView *CongratulationsView;
}

@end
