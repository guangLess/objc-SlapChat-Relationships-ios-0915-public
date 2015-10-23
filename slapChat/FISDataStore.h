//
//  FISDataStore.h
//  playingWithCoreData
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "Recipient.h"

@interface FISDataStore : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic)NSArray *messages;
@property (strong, nonatomic)NSArray *recipients;

+ (instancetype) sharedDataStore;

- (void) saveContext;
- (void) generateTestData;
- (void) fetchData;
- (Message *) createMessage;
@end

/*
 NOTES: 
 >NavigationController set segue to push, because it pushes to another storyLine. Model comes and goes not a whole narrative.
 >DataStore, one to many relationships. In this case, same message doesnot make sense to be shared with different recipients, think text messages to the shane and guang, does my message to shane need to be the same with ellie?...message as many relationship is NSSet uniqe. 
 >Try to get use to pass the customlized class instant of array string between VCs. In this case, passing by recipient is way better.
 >When change core data, try to regenerate the managedObjects. 
 
 
*/