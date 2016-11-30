//
//  UserDB.huser
//  LoginPage
//
//  Created by Kumar on 11/29/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "User.h"

@interface UserDB : NSObject
@property (nonatomic, strong) NSString *dbPath;
@property sqlite3 *dataBase;
-(NSString*)SaveDB:(User* )userObj;
-(NSString*)FindDB:(NSString*) name;

@end
