//
//  User.m
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "User.h"


@implementation User
-(id)init:(NSString*) name pwd:(NSString*)pwd rePwd:(NSString*) rePwd phone:(NSString *)phone passwordMD5:(NSString *)passwordMD5 email:(NSString*)email
{
   
    
    self = [super init];
    if(self)
    {
        _name = name;
        _pwd = pwd;
        _rePwd =rePwd;
        _phone = phone;
        _passwordMD5 = passwordMD5;
        _email = email;
    }
    return self;
    
}


-(NSString*)Validation
{
    NSString *msg=@"" ;
    if([self.name isEqual:@""])
    {    msg =@"Name is empty";
        NSLog(@"name empty");
        return msg;
        
    }
    NSString *regExp1 = @"^(?=.{6,})(?=.*[0-9])(?=.*[a-zA-Z])([@#$%^&=a-zA-Z0-9_-]+)$";
       NSPredicate *result1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regExp1];
    if (![result1 evaluateWithObject:self.pwd] == true)
    {
        msg = @"Enter  passsword  with Miminum of 6 characters";
        return msg;
    }
    
    
    if(![self.pwd isEqual:self.rePwd])
   {
        msg = @"Password Doesn't match";
       return msg;
        
    }
    if(self.email)
    {
        
        NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        if (![emailTest evaluateWithObject:self.email] == true)
        {
            msg = @"Enter  correct Email";
            return msg;
        }
        

    }
    
    if(self.phone)
    {   // NSString *phone =
        self.phone = [self.phone stringByReplacingOccurrencesOfString:@"(" withString:@""];
        self.phone = [self.phone stringByReplacingOccurrencesOfString:@")" withString:@""];
        self.phone = [self.phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
        self.phone = [self.phone stringByReplacingOccurrencesOfString:@" " withString:@""];
        self.phone= [self.phone stringByReplacingOccurrencesOfString:@"+" withString:@""];
        NSString *regExp = @"[0-9]{10}";
        NSPredicate *result = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regExp];
        if (![result evaluateWithObject:self.phone] == true)
        
        {  msg = @"Enter Correct Phone";
           
        }
       
       
        NSLog(@"  Phone Number %@",self.phone);
         return msg;
    }
   
    return msg;

}

@end
