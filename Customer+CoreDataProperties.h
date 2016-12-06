//
//  Customer+CoreDataProperties.h
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Customer+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Customer (CoreDataProperties)

+ (NSFetchRequest<Customer *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nullable, nonatomic, retain) NSSet<Items *> *buy;

@end

@interface Customer (CoreDataGeneratedAccessors)

- (void)addBuyObject:(Items *)value;
- (void)removeBuyObject:(Items *)value;
- (void)addBuy:(NSSet<Items *> *)values;
- (void)removeBuy:(NSSet<Items *> *)values;

@end

NS_ASSUME_NONNULL_END
