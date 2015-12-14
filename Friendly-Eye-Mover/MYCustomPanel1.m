//
//  MYCustomPanel1.m
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/29/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "MYCustomPanel1.h"
#import "MYBlurIntroductionView.h"
#import "HBVLinkedTextView.h"
#import "UIColor+HBVHarmonies.h"

@interface MYCustomPanel1 ()

@property (strong, nonatomic) IBOutlet HBVLinkedTextView *linkedTextView;
- (IBAction)goCoachmylife:(id)sender;
- (IBAction)goWingWave:(id)sender;

@end


@implementation MYCustomPanel1

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Interaction Methods
//Override them if you want them!
-(void)panelDidAppear{
NSLog(@"Panel Did Appear");

//You can use a MYIntroductionPanel subclass to create custom events and transitions for your introduction view
//    [self.parentIntroductionView setEnabled:NO];

[self doTheDemo];
}

-(void) doTheDemo
{
    //Create 2 dictionaries to pass in the text attributes for default / highlighted states
    NSMutableDictionary *defaultAttributes = [self exampleAttributes];
    NSMutableDictionary *highlightedAttributes = [self exampleAttributes];
    
    //The first string we're going to link
    NSString *stringToLink = @"wingwave";
    
    self.linkedTextView.selectable = YES;
    self.linkedTextView.directionalLockEnabled = YES;
    self.linkedTextView.scrollEnabled = YES;
    
    //Pass in the string, attributes, and a tap handling block
    [self.linkedTextView linkString:stringToLink
                  defaultAttributes:defaultAttributes
              highlightedAttributes:highlightedAttributes
                         tapHandler:[self exampleHandlerWithTitle:@"http://www.coachmylife.de/was-ist-wingwave/"]];
    
}

- (NSMutableDictionary *)exampleAttributes
{
    return [@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0f],
              NSForegroundColorAttributeName:[UIColor colorWithRed:13.0/255.0f green:127.0f/255.0f blue:255.0f/255.0f alpha:1]}mutableCopy];
}

- (LinkedStringTapHandler)exampleHandlerWithTitle:(NSString *)title
{
    LinkedStringTapHandler exampleHandler = ^(NSString *linkedString) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:title]];
    };
    
    return exampleHandler;
}

-(void)panelDidDisappear{
    NSLog(@"Panel Did Disappear");
    
    //Maybe here you want to reset the panel in case someone goes backward and the comes back to your panel
    //    CongratulationsView.alpha = 0;
}


- (IBAction)goCoachmylife:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.coachmylife.de"]];
}

- (IBAction)goWingWave:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.wingwave.com"]];
}
@end
