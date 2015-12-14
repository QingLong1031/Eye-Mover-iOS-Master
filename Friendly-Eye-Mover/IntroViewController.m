//
//  IntroViewController.m
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/28/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "IntroViewController.h"
#import "MYCustomPanel.h"
#import "MYCustomPanel1.h"

#import "MyBallViewController.h"

@interface IntroViewController () {
    NSString *langStr;
    NSString *btnStr;
}

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self startAction];
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}

-(void) viewDidAppear:(BOOL)animated
{
    langStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
    btnStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"startInfo"];
    
    NSLog(@"%@ %@", langStr, btnStr);
    
    if ([langStr isEqualToString:@"   ENGLISH"]) {

        //Calling this methods builds the intro and adds it to the screen. See below.
        if ([btnStr isEqualToString:@"introBtn"]) {
            [self buildIntro];
        }
    } else {
        
        //Calling this methods builds the intro and adds it to the screen. See below.
        if ([btnStr isEqualToString:@"introBtn"]) {
            [self buildIntro1];
        }
    }
}

-(void) startAction
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    pos = CGPointMake(15.0, 0);
    
    movingBall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    movingBall.frame = CGRectMake(0, 0, 50, 50);
    movingBall.center = CGPointMake(screenBounds.size.width / 2, screenBounds.size.height / 2);
    [self.view addSubview:movingBall];
    
    [NSTimer scheduledTimerWithTimeInterval:(0.07) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MyBallViewController *myBallViewController = [storyBoard instantiateViewControllerWithIdentifier:@"MyBall"];
    
    [self presentViewController:myBallViewController animated:YES completion:nil];
}

-(void) onTimer
{
    movingBall.center = CGPointMake(movingBall.center.x + pos.x, movingBall.center.y);
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    if (movingBall.center.x > screenBounds.size.width/4*3 || movingBall.center.x < screenBounds.size.width/4) {
        pos.x = -pos.x;
    }
}

-(void) buildIntro
{
    //Create custom panel with events
    panel1 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView1"];
    
    panel2 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView2"];

    panel3 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView3"];

    panel4 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"ImpressmView"];

    panel5 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView4"];
    
    //Add panels to an array
    NSArray *panels = @[panel1, panel2, panel3, panel4, panel5];

    //Create the introduction view and set its delegate
    introductionView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introductionView.delegate = self;
    
    //Build the introduction with desired panels
    [introductionView buildIntroductionWithPanels:panels];
    
    //Add the introduction to your view
    [self.view addSubview:introductionView];
    
}

-(void) buildIntro1
{
    //Create custom panel with events
    panel1_1 = [[MYCustomPanel1 alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView1_0"];
    
    panel1_2 = [[MYCustomPanel1 alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView2_0"];
    
    panel1_3 = [[MYCustomPanel1 alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView3_0"];
    
    panel1_4 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"ImpressmView"];

    panel1_5 = [[MYCustomPanel1 alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroView4_0"];
    
    //Add panels to an array
    NSArray *panels = @[panel1_1, panel1_2, panel1_3, panel1_4, panel1_5];
    
    //Create the introduction view and set its delegate
    introductionView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introductionView.delegate = self;

//    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
//    
//    if (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
//        introductionView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    } else {
//        introductionView.frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
//    }
    
    //Build the introduction with desired panels
    [introductionView buildIntroductionWithPanels:panels];
    
    //Add the introduction to your view
    [self.view addSubview:introductionView];
}

-(BOOL) shouldAutorotate
{
    return NO;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
