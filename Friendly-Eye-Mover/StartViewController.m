//
//  StartViewController.m
//  Friendly-Eye-Mover
//
//  Created by Superstar on 11/6/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "StartViewController.h"

#import "MyBallViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self startAction];
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
