//
//  SignUPViewController.h
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "MyAccountViewController.h"
#import "NSString+MD5Conversion.h"
#import "UserDB.h"

@interface SignUPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UITextField *rePwdText;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
- (IBAction)SubmitPressed:(id)sender;
- (IBAction)CancelPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end
