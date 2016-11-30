//
//  SignUPViewController.m
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "SignUPViewController.h"

@interface SignUPViewController ()
{
    User *userObj;
}
@end

@implementation SignUPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 NSLog(@"View Controller 2 Loaded");    
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

- (IBAction)SubmitPressed:(id)sender {
    NSString *passwordMD5 = [self.pwdText.text MD5];
    
    userObj = [[User alloc] init:self.nameText.text pwd:self.pwdText.text rePwd:self.rePwdText.text phone:self.phoneText.text passwordMD5:passwordMD5  email:self.email.text];
    
    
    
    
    //NSString *passwordMD5 = [self.pwdText.text MD5];
    
    // Convert and print the MD5 value to the console
    NSLog(@" PAsssworddddddddddddddddddddddddddddddd%@", passwordMD5);
    
    NSString *msg = [userObj Validation];
    if(![msg isEqualToString:@""])
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cannot Create the new Login" message:msg preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    
    }
        
    if([msg isEqualToString:@""])
    {  /*
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:passwordMD5 forKey:self.nameText.text];
        [defaults synchronize];
        NSLog(@"successfully stored");
        */
        //self.pwdText.text = passwordMD5;
        UserDB *userDBObj = [[UserDB alloc]init];
        NSString * error = [userDBObj SaveDB:userObj];
        if(![error isEqualToString:@""])
        {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cannot Create the new Login" message:error preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        }

        
    }
          
    
   
}

- (IBAction)CancelPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
