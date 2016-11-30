//
//  User.h
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic, strong) NSString *pwd;
@property(nonatomic, strong) NSString *rePwd;
@property(nonatomic, strong) NSString *phone;
@property(nonatomic,strong) NSString *passwordMD5;
@property(nonatomic,strong) NSString *email;
-(id)init:(NSString*) name pwd:(NSString*)pwd rePwd:(NSString*) rePwd phone:(NSString *)phone passwordMD5:(NSString*)passwordMD5 email:(NSString*)email;
-(NSString*)Validation;
@end
