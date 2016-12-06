//
//  Customer+CoreDataProperties.m
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Customer+CoreDataProperties.h"

@implementation Customer (CoreDataProperties)

+ (NSFetchRequest<Customer *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Customer"];
}

@dynamic name;
@dynamic password;
@dynamic email;
@dynamic phone;
@dynamic buy;

@end
