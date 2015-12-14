//
//  LanchViewController.m
//  Friendly-Eye-Mover
//
//  Created by Superstar on 11/4/15.
//  Copyright (c) 2015 Superstar. All rights reserved.
//

#import "LanchViewController.h"
#import "ViewController.h"

@interface LanchViewController ()

@end

@implementation LanchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"FirstView"];
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:viewController animated:YES completion:nil];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
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
