//
//  ViewController.m
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/27/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "ViewController.h"
#import "IGLDropDownMenu.h"
#import "IntroViewController.h"
#import "AppDelegate.h"

static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

@interface ViewController () <IGLDropDownMenuDelegate>

@property (nonatomic, strong) IGLDropDownMenu *dropDownMenu;
@property (nonatomic, strong) UILabel *textLabel;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set the country name to detault.
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"lang"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"startInfo"];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // using self.navigationController.view - to display EAIntroView above navigation bar

    self.view.backgroundColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.0];
    
    NSArray *dataArray = @[@{@"image":@"england.png",@"title":@"   ENGLISH"},
                           @{@"image":@"germany.png",@"title":@"   GERMAN"},];

    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dict = dataArray[i];
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
        [item setText:dict[@"title"]];
        [dropdownItems addObject:item];
    }
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

//    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, screenBounds.size.height/2 + 70, screenBounds.size.width, 50)];
//    self.textLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.textLabel];
//    self.textLabel.text = @"no selected";
//    self.textLabel.textColor = [UIColor blueColor];

    
    UIInterfaceOrientation interfaceOrientation;
    interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    
    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
    self.dropDownMenu.menuText = @"Choose Language";
    self.dropDownMenu.dropDownItems = dropdownItems;
    self.dropDownMenu.paddingLeft = 15;
    
    if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown || interfaceOrientation == UIInterfaceOrientationPortrait) {
        [self.dropDownMenu setFrame:CGRectMake(screenBounds.size.width/2 - 100, screenBounds.size.height/2, 200, 45)];
//        [self.textLabel setFrame:CGRectMake(screenBounds.size.height/2 - 100, screenBounds.size.width/3 + 70, 200, 50)];

    } else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [self.dropDownMenu setFrame:CGRectMake(screenBounds.size.width/2 - 100, screenBounds.size.height/3, 200, 45)];
        [self.textLabel setFrame:CGRectMake(screenBounds.size.width/2 - 100, screenBounds.size.height/3 + 70, 200, 50)];
    }
    
    self.dropDownMenu.delegate = self;
    
    [self setUpParamsForDemo4];
    
    [self.dropDownMenu reloadView];
    
    [self.view addSubview:self.dropDownMenu];
}

- (void)setUpParamsForDemo4
{
    self.dropDownMenu.type = IGLDropDownMenuTypeStack;
    self.dropDownMenu.flipWhenToggleView = YES;
}

-(BOOL) shouldAutorotate
{
    return YES;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    prevInterfaceOrientation = toInterfaceOrientation;
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

    if (fromInterfaceOrientation == UIInterfaceOrientationPortrait || fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [self.dropDownMenu setFrame:CGRectMake(screenBounds.size.width/2 - 100, screenBounds.size.height/3, 200, 45)];
        [self.textLabel setFrame:CGRectMake(screenBounds.size.width/2 - 100, screenBounds.size.height/3 + 70, 200, 50)];
        
    } else if (fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        if (prevInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || prevInterfaceOrientation  == UIInterfaceOrientationLandscapeRight) {
            return;
        }
        [self.dropDownMenu setFrame:CGRectMake(screenBounds.size.width/2 - 100, screenBounds.size.height/2, 200, 45)];
        [self.textLabel setFrame:CGRectMake(screenBounds.size.width/2 - 100, screenBounds.size.height/2 + 70, 200, 50)];
    }
}

#pragma mark - IGLDropDownMenuDelegate

- (void)selectedItemAtIndex:(NSInteger)index
{
    IGLDropDownItem *item = self.dropDownMenu.dropDownItems[index];
    self.textLabel.text = [NSString stringWithFormat:@"Language: %@", item.text];

    [[NSUserDefaults standardUserDefaults] setObject:item.text forKey:@"lang"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showIntro:(id)sender {

    startInfo = @"startBtn";

    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
    [[NSUserDefaults standardUserDefaults] setObject:startInfo forKey:@"startInfo"];

    if (str == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message"
                                                       message:@"Please select the language."
                                                      delegate:nil
                                             cancelButtonTitle:@"O K"
                                             otherButtonTitles:nil, nil];
        
        [alert show];

    } else {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        IntroViewController *introViewController = [storyBoard instantiateViewControllerWithIdentifier:@"IntroView"];
        introViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:introViewController animated:YES completion:nil];
    }
}

- (IBAction)showExplanation:(id)sender {
    
    startInfo = @"introBtn";
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
    [[NSUserDefaults standardUserDefaults] setObject:startInfo forKey:@"startInfo"];
    
    if (str == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message"
                                                       message:@"Please select the language."
                                                      delegate:nil
                                             cancelButtonTitle:@"O K"
                                             otherButtonTitles:nil, nil];
        
        [alert show];
        
    } else {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        IntroViewController *introViewController = [storyBoard instantiateViewControllerWithIdentifier:@"IntroView"];
        introViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:introViewController animated:YES completion:nil];
    }
}

@end
