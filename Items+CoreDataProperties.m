//
//  Items+CoreDataProperties.m
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Items+CoreDataProperties.h"

@implementation Items (CoreDataProperties)

+ (NSFetchRequest<Items *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Items"];
}

@dynamic name;
@dynamic quantity;
@dynamic purchase_by;

@end
