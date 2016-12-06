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
     self.pwdText.secureTextEntry = YES;
     self.rePwdText.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
 {
 if ([[segue identifier] isEqualToString:@"signUP"]) {
 
 MyAccountViewController *vc = [segue destinationViewController];
 
 vc.account = self.nameText.text;
 }
 }
 }


- (IBAction)SubmitPressed:(id)sender {
    
    if(([self.pwdText.text isEqualToString:@""]) || ([self.rePwdText.text isEqualToString:@""])||([self.phoneText.text isEqualToString:@""]))
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Enter all the fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        

        
    }
    //Convert password into MD5 String
   // NSString *passwordMD5 = [self.pwdText.text MD5];
    
    
    NSString *passwordSha1 = [self.pwdText.text sha1];
    
    userObj = [[User alloc] init:self.nameText.text pwd:self.pwdText.text rePwd:self.rePwdText.text phone:self.phoneText.text passwordMD5:passwordSha1  email:self.email.text];
    
    
    
    
    //NSString *passwordMD5 = [self.pwdText.text MD5];
    
    // Convert and print the MD5 value to the console
    NSLog(@" PAsssworddddddddddddddddddddddddddddddd%@", passwordSha1);
    
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
        
        else
        {
            AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            
        NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
        Customer *customer = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:context];
       // NSError *error;
        [customer setValue:self.nameText.text forKey:@"name"];
       // [customer setValue:@"4154941140" forKey:@"phone"];
        // newUser.purchase_by = @"Dhara";
            NSError *error1;
        if (![context save:&error1]) {
            NSLog(@"Can't Save! ");
        }
            
            [self performSegueWithIdentifier:@"signUP" sender:self];
        }

        
    }
          
    
   
}

- (IBAction)CancelPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
