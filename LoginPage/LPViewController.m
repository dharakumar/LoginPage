//
//  LPViewController.m
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "LPViewController.h"

@interface LPViewController ()

@end

@implementation LPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View Controller 1 Loaded");
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     if ([[segue identifier] isEqualToString:@"signIN"]) {
         
         MyAccountViewController *vc = [segue destinationViewController];
    
    vc.account = self.nameText.text;
     }
    
}



- (IBAction)SignINPressed:(id)sender {
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *passwordMD5 = [self.pwdText.text MD5];
    
    NSString *password =[defaults objectForKey:self.nameText.text];
     */
    
    //Convert the password to NSString of MD5 Hash value
    NSString *passwordMD5 = [self.pwdText.text MD5];
    
    //Query the DataBase to fetch the password
    UserDB *userDBObj = [[UserDB alloc]init];
    NSString *password = [userDBObj FindDB:self.nameText.text];
    

    if([password isEqualToString:passwordMD5])

    {
        NSLog(@"Successfuly sign In");
        [self performSegueWithIdentifier:@"signIN" sender:self];
    }
    else
    {
        NSLog(@"Unsucessful login");
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"UserName not exist" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
         [self presentViewController:alertController animated:YES completion:nil];

        
        
    }
}
@end
