//
//  LPViewController.h
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAccountViewController.h"
#import "NSString+MD5Conversion.h"
#import "UserDB.h"
#import "NSString+Sha1.h"

@interface LPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
- (IBAction)SignINPressed:(id)sender;

@end
