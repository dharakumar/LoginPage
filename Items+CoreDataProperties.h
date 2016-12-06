//
//  Items+CoreDataProperties.h
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Items+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Items (CoreDataProperties)

+ (NSFetchRequest<Items *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *quantity;
@property (nullable, nonatomic, retain) Customer *purchase_by;

@end

NS_ASSUME_NONNULL_END
