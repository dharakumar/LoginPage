//
//  MyAccountViewController.m
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View Controller 3 Loaded");
    NSLog(@"success account");
}

-(void)viewDidAppear:(BOOL)animated
{    NSLog(@"View Controller 3 appeared");
    [super viewDidAppear:YES];
    NSString *msg = [self.account  stringByAppendingString:@" , You Are entered into your account"];
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
        

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

- (IBAction)NewST:(id)sender {
    
    
}
@end
