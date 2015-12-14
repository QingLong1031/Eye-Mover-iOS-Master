//
//  MyBallViewController.m
//  Friendly-Eye-Mover
//
//  Created by Superstar on 10/29/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "MyBallViewController.h"

#import "EndPageViewController.h"

@interface MyBallViewController ()

- (IBAction)stopApp:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *stopBtn;

@end

@implementation MyBallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set the background music.
    NSString *musicFilePath = [[NSBundle mainBundle] pathForResource:@"Music" ofType:@"mp3"];
    NSURL *musicFileURL = [NSURL fileURLWithPath:musicFilePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFileURL error:nil];
    player.numberOfLoops = -1;
    player.pan = 0;
    run_flag = YES;
    
    [player play];
    
    NSString *gong_musicFilePath = [[NSBundle mainBundle] pathForResource:@"chinese_gong" ofType:@"mp3"];
    gong_musicFileURL = [NSURL fileURLWithPath:gong_musicFilePath];

    gong_player = [[AVAudioPlayer alloc] initWithContentsOfURL:gong_musicFileURL error:nil];
    gong_player.numberOfLoops = -1;
    gong_player.pan = 0;
    
    [gong_player play];

    
    // Do any additional setup after loading the view.
    
    // get the window size.
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    moving_index = 0;
    index = 0;
    action_end = 0;
 
    pos = CGPointMake(14.0, 0);
    
//    movingBall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
//    movingBall.frame = CGRectMake(0, 0, 50, 50);
//    movingBall.center = CGPointMake(movingBall.bounds.size.width, movingBall.bounds.size.height);
//    [self.view addSubview:movingBall];
    
    // set the ball position according to state.
    ballPos3 = CGPointMake(movingBall.bounds.size.width/3*2, screenBounds.size.height - movingBall.bounds.size.height/2);
    ballPos2 = CGPointMake(movingBall.bounds.size.width/3*2, screenBounds.size.height / 2);
    ballPos1 = CGPointMake(movingBall.bounds.size.width/3*2, movingBall.bounds.size.height/2);
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        pos = CGPointMake(21.0, 0);
    }
    
//    movingBall.center = ballPos1;
    
    [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(BOOL) shouldAutorotate
{
    return YES;
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (fromInterfaceOrientation == UIInterfaceOrientationPortrait || fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        pos = CGPointMake(21.0, 0);
    } else if (fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight || fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        
        pos = CGPointMake(14.0, 0);
    }
}

-(void) onTimer
{
    if (!run_flag) {
        return;
    }
    
    if (action_end) {
        return;
    }

    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    
    if (movingBall.center.x > screenBounds.size.width - movingBall.bounds.size.width/2 || movingBall.center.x < movingBall.bounds.size.width/2) {
        pos.x = -pos.x;
        moving_index++;
        NSLog(@"%f", movingBall.center.x);
        if (pos.x > 0) {
            gong_player = [[AVAudioPlayer alloc] initWithContentsOfURL:gong_musicFileURL error:nil];
            gong_player.pan = -1;
            
            [gong_player play];

        } else if (pos.x < 0) {
            gong_player = [[AVAudioPlayer alloc] initWithContentsOfURL:gong_musicFileURL error:nil];
            gong_player.pan = 1;

            [gong_player play];
            
        }
    }

    movingBall.center = CGPointMake(movingBall.center.x + pos.x, movingBall.center.y);

    if (moving_index%16 == 0) {
        if (moving_index/16 == 0) {
            movingBall.center = CGPointMake(movingBall.center.x, movingBall.bounds.size.height/3*2);
        } else if (moving_index/16 == 1) {
            movingBall.center = CGPointMake(movingBall.center.x, screenBounds.size.height/2);
        } else if (moving_index/16 == 2) {
            movingBall.center = CGPointMake(movingBall.center.x, screenBounds.size.height - movingBall.bounds.size.height/3*2);
        }
        
        if (moving_index/16 == 3) {
            moving_index = 0;
            index++;
            
            if (index == 3) {
                NSLog(@"action end");
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                EndPageViewController *endPageViewController = [storyBoard instantiateViewControllerWithIdentifier:@"EndPage"];
                
                [self presentViewController:endPageViewController animated:YES completion:nil];
                
                [player stop];
                [gong_player stop];
                action_end = 1;
            }
        }
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    touchNumber++;
// 
//    if (touchNumber%4 == 0) {
//        movingBall.hidden = NO;
//        movingBall.center = ballPos1;
//    } else if (touchNumber%4 == 1) {
//        movingBall.hidden = NO;
//        movingBall.center = ballPos2;
//    } else if (touchNumber%4 == 2) {
//        movingBall.hidden = NO;
//        movingBall.center = ballPos3;
//    } else if (touchNumber%4 == 3) {
//        movingBall.hidden = YES;
//    }
//    
//    if (touchNumber >= 11) {
//        NSLog(@"action end");
//        
//        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        EndPageViewController *endPageViewController = [storyBoard instantiateViewControllerWithIdentifier:@"EndPage"];
//        
//        [self presentViewController:endPageViewController animated:YES completion:nil];
//    }
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

- (IBAction)stopApp:(id)sender {
    
    NSLog(@"action end");
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EndPageViewController *endPageViewController = [storyBoard instantiateViewControllerWithIdentifier:@"EndPage"];
    
    [self presentViewController:endPageViewController animated:YES completion:nil];
    
    [player stop];
    [gong_player stop];
    action_end = 1;

//    if (run_flag) {
//        [self.stopBtn setTitle:@"Play" forState:UIControlStateNormal];
//        run_flag = NO;
//        moving_index = 0;
//        [gong_player stop];
//        [player stop];
//        player.currentTime = 0;
//        
//        return;
//        
//    } else if (!run_flag) {
//        [self.stopBtn setTitle:@"Stop" forState:UIControlStateNormal];
//        run_flag = YES;
//        [gong_player play];
//        [player play];
//        
//        return;
//    }
}
@end
