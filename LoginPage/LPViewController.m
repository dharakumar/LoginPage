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
   // UIImage *backgroundImage = [UIImage imageNamed:@"img1.jpeg"];
   // UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
  //  backgroundImageView.image=backgroundImage;
  //  [self.view insertSubview:backgroundImageView atIndex:0];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nameText.text = [defaults objectForKey:@"LastEntName"];
    self.pwdText.secureTextEntry = YES;
  
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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.nameText.text forKey:@"LastEntName"];
   
    
    //Convert the password to NSString of MD5 Hash value
   // NSString *passwordMD5 = [self.pwdText.text MD5];
    
    
    //Convert string into sha1 hash value
    NSString *passwordSha1 = [self.pwdText.text sha1];

    //Query the DataBase to fetch the password
    UserDB *userDBObj = [[UserDB alloc]init];
    NSString *password = [userDBObj FindDB:self.nameText.text];
    

    if([password isEqualToString:passwordSha1])

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
