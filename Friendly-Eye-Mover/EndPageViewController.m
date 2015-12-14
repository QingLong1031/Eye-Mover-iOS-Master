//
//  EndPageViewController.m
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/29/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "EndPageViewController.h"
#import "HBVLinkedTextView.h"
#import "UIColor+HBVHarmonies.h"

@interface EndPageViewController ()

@property (strong, nonatomic) IBOutlet HBVLinkedTextView *linkedTextView;
@property (strong, nonatomic) IBOutlet HBVLinkedTextView *linkedTextView1;
- (IBAction)goCoachmylife:(id)sender;
- (IBAction)goWingWave:(id)sender;

@end

@implementation EndPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self doTheDemo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) doTheDemo
{
    //Create 2 dictionaries to pass in the text attributes for default / highlighted states
    NSMutableDictionary *defaultAttributes = [self exampleAttributes];
    NSMutableDictionary *highlightedAttributes = [self exampleAttributes];
    
    //The first string we're going to link
    NSString *stringToLink = @"wingwave";
    
    // set the property of english textview.
    self.linkedTextView.selectable = YES;
    self.linkedTextView.directionalLockEnabled = YES;
    self.linkedTextView.allowsEditingTextAttributes = YES;

    //Pass in the string, attributes, and a tap handling block
    [self.linkedTextView linkString:stringToLink
                  defaultAttributes:defaultAttributes
              highlightedAttributes:highlightedAttributes
                         tapHandler:[self exampleHandlerWithTitle:@"http://www.coachmylife.de/was-ist-wingwave/"]];
    
    // set the propoerty of german textview.
    self.linkedTextView1.selectable = YES;
    self.linkedTextView1.directionalLockEnabled = YES;
    self.linkedTextView1.allowsEditingTextAttributes = YES;

    // Pass in the string, attributes and a tap handling block.
    [self.linkedTextView1 linkString:stringToLink
                   defaultAttributes:defaultAttributes
               highlightedAttributes:highlightedAttributes
                          tapHandler:[self exampleHandlerWithTitle:@"http://www.coachmylife.de/was-ist-wingwave/"]];

    // recognize the language.
    NSString *langStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
    NSLog(@"%@", langStr);
    
    if ([langStr isEqualToString:@"   ENGLISH"]) {
        self.linkedTextView.hidden = NO;
        self.linkedTextView1.hidden = YES;
    } else {
        self.linkedTextView.hidden = YES;
        self.linkedTextView1.hidden = NO;
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)goCoachmylife:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.coachmylife.de"]];
}

- (IBAction)goWingWave:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.wingwave.com"]];
}
@end
