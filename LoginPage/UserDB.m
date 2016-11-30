//
//  UserDB.m
//  LoginPage
//
//  Created by Kumar on 11/29/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "UserDB.h"

@implementation UserDB
-(id)init
{
    self = [super init];
    if(self)
    {
        NSString *docsDir;
        NSArray *dirPaths;
        dirPaths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir = dirPaths[0];
        _dbPath = [[NSString alloc]initWithString:[docsDir stringByAppendingString:@"UserDB.db"]];
        NSFileManager *manager = [NSFileManager defaultManager];
        if([manager fileExistsAtPath:_dbPath])
        {
            //Create the table User with the fields
            const char *dbasePath = [_dbPath UTF8String];
            if(sqlite3_open(dbasePath, &_dataBase) == SQLITE_OK)
            {
                char *error ;
                const char *sql_statement = "CREATE TABLE IF NOT EXISTS userDB (ID INTEGER PRIMARY KEY AUTOINCREMENT ,NAME TEXT UNIQUE , PASSWORD CHAR(32) , PHONE TEXT)";
                if(sqlite3_exec(_dataBase, sql_statement, NULL, NULL, &error)!=SQLITE_OK)
                {
                    NSLog(@"Cannot create a table");
            
                }
            }
            
            
            
            
        }
        
          sqlite3_close(self.dataBase);
    }
    return self;
}

-(NSString*)SaveDB:(User* )userObj
{    //Insert the data into the User Database.
    NSString *msg = @"" ;
    sqlite3_stmt *statement;
    const char *dbasePath = [self.dbPath UTF8String];
    if(sqlite3_open(dbasePath, &_dataBase)== SQLITE_OK)
    {
        NSString *insert_statement = [NSString stringWithFormat:@"INSERT INTO userDB (name,password ,phone) VALUES (\"%@\",\"%@\",\"%@\")", userObj.name ,userObj.passwordMD5,userObj.phone];
        const char *data = [insert_statement UTF8String];
        sqlite3_prepare(self.dataBase, data, -1, &statement, NULL);
        if(sqlite3_step(statement)==SQLITE_DONE)
        {
            NSLog(@"Inserted the data into the db");
        }
        else
        {   msg =  @"UserName already Exist";
            NSLog(@"Error in inserting into the db");
        }
        
    }
    sqlite3_finalize(statement);
    sqlite3_close(self.dataBase);
    NSLog(@"msg %@", msg);
    return msg;
    
}
-(NSString*)FindDB:(NSString*) name
{ NSString *pwd;
    //Query the data from the User Database.
    sqlite3_stmt *statement;
    const char *dbasePath = [self.dbPath UTF8String];
    if(sqlite3_open(dbasePath, &_dataBase)== SQLITE_OK)
    {
        NSString *query_statement = [NSString stringWithFormat:@"SELECT password FROM userDB WHERE name = \"%@\"" , name];
        const char *data = [query_statement UTF8String];
        sqlite3_prepare(self.dataBase, data, -1, &statement, NULL);
        if(sqlite3_step(statement)==SQLITE_ROW)
        {   pwd = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
            
            NSLog(@"Found the data %@", pwd);
        }
        else
        {
            NSLog(@"Error in query the db");
        }
        
    }
   
    sqlite3_finalize(statement);
    sqlite3_close(self.dataBase);
    
 return pwd;
}
/*
-(NSString*)LastDB:(NSString*) name
{ NSString *pwd;
    //Query the data from the User Database.
    sqlite3_stmt *statement;
    const char *dbasePath = [self.dbPath UTF8String];
    if(sqlite3_open(dbasePath, &_dataBase)== SQLITE_OK)
    {
        NSString *query_statement = [NSString stringWithFormat:@"SELECT password FROM user WHERE name = \"%@\"" , name];
        const char *data = [query_statement UTF8String];
        sqlite3_prepare(self.dataBase, data, -1, &statement, NULL);
        SELECT * FROM PHONEBOOK WHERE ROWID = last_insert_rowid()
        if(sqlite3_last_insert_row(_dataBase)==SQLITE_ROW)
        {   pwd = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
            
            NSLog(@"Found the data %@", pwd);
        }
        else
        {
            NSLog(@"Error in query the db");
        }
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(self.dataBase);
    
    return pwd;
}

*/

@end
