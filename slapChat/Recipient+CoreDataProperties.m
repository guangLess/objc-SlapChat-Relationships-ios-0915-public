//
//  Recipient+CoreDataProperties.m
//  slapChat
//
//  Created by Guang on 10/23/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Recipient+CoreDataProperties.h"

@implementation Recipient (CoreDataProperties)

@dynamic name;
@dynamic email;
@dynamic phoneNumber;
@dynamic twitterHandle;
@dynamic messages;

@end
