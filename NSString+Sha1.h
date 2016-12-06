//
//  NSString+Sha1.h
//  LoginPage
//
//  Created by Admin on 12/4/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSString (sha1)
- (NSString *)sha1;
@end

