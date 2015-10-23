//
//  Recipient+CoreDataProperties.h
//  slapChat
//
//  Created by Guang on 10/23/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Recipient.h"

NS_ASSUME_NONNULL_BEGIN

@interface Recipient (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSNumber *phoneNumber;
@property (nullable, nonatomic, retain) NSString *twitterHandle;
@property (nullable, nonatomic, retain) NSSet<Message *> *messages;

@end

@interface Recipient (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(Message *)value;
- (void)removeMessagesObject:(Message *)value;
- (void)addMessages:(NSSet<Message *> *)values;
- (void)removeMessages:(NSSet<Message *> *)values;

@end

NS_ASSUME_NONNULL_END
