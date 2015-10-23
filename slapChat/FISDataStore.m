//
//  FISDataStore.m
//  playingWithCoreData
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISDataStore.h"
#import "Message.h"

@implementation FISDataStore
@synthesize managedObjectContext = _managedObjectContext;

#pragma mark - Singleton

+ (instancetype)sharedDataStore {
    static FISDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISDataStore alloc] init];
    });

    return _sharedDataStore;
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"slapChat.sqlite"];
    
    NSError *error = nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"slapChat" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Fetch/Save

- (void)fetchData
{/*
    NSFetchRequest *messagesRequest = [NSFetchRequest fetchRequestWithEntityName:@"Message"];

    NSSortDescriptor *createdAtSorter = [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES];
    messagesRequest.sortDescriptors = @[createdAtSorter];

    self.messages = [self.managedObjectContext executeFetchRequest:messagesRequest error:nil];

    if ([self.messages count]==0) {
        [self generateTestData];
    }
  
  */
    
    NSFetchRequest *recipientRequest = [NSFetchRequest fetchRequestWithEntityName:@"Recipient"];
    self.recipients = [self.managedObjectContext executeFetchRequest:recipientRequest error:nil];
    if (self.recipients.count == 0) {
        [self generateTestData];
    }
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Test data

- (void)generateTestData
{
    //self.managedObjectContext = [FISDataStore sharedDataStore].managedObjectContext;
    
    Message *messageOne = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
    messageOne.content = @"Message 1";
    messageOne.createdAt = [NSDate date];
    
    Message *messageTwo = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
    messageTwo.content = @"Message 2";
    messageTwo.createdAt = [NSDate date];
    
    Message *messageThree = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
    
    messageThree.content = @"Message 3";
    messageThree.createdAt = [NSDate date];
    
    Message *messageFour = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
    
    messageFour.content = @"Message 4";
    messageFour.createdAt = [NSDate date];
    
    Message *messageFive = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
    
    messageFive.content = @"Message 5";
    messageFive.createdAt = [NSDate date];
    
    
    Recipient * recipient1 = [NSEntityDescription insertNewObjectForEntityForName:@"Recipient" inManagedObjectContext:self.managedObjectContext];
    
    NSLog(@"messageOne Added %@",recipient1.messages);
    recipient1.name = @"Guang";
    recipient1.twitterHandle = @"Whimisical Guang";
    recipient1.email = @"bha.guang@gmail.com";
    recipient1.phoneNumber = @71689234872;
    
    [recipient1 addMessagesObject:messageOne];
    
    
    Recipient * recipient2 = [NSEntityDescription insertNewObjectForEntityForName:@"Recipient" inManagedObjectContext:self.managedObjectContext];
    [recipient2 addMessagesObject:messageTwo];
    [recipient2 addMessagesObject:messageThree];
    NSLog(@"messageTwo Added %@",recipient2.messages);

    
    recipient2.name = @"Shane";
    recipient2.twitterHandle = @"shiftShane";
    recipient2.email = @"shiftShane@gmail.com";
    recipient2.phoneNumber = @334343432;
    
    
    Recipient * recipient3 = [NSEntityDescription insertNewObjectForEntityForName:@"Recipient" inManagedObjectContext:self.managedObjectContext];
    [recipient3 addMessagesObject:messageFour];
    [recipient3 addMessagesObject:messageFive];
    
    recipient3.name = @"ellie";
    recipient3.twitterHandle = @"ellie is fantastic";
    recipient3.email = @"ellie@gmail.com";
    recipient3.phoneNumber = @98935145;
    NSLog(@"messagethree Added ---%@",recipient3.messages);

    
    
    
    
    [self saveContext];
    [self fetchData];
}

#pragma mark - Helpers

- (Message *)createMessage
{
    return [Message messageWithContext:self.managedObjectContext];
}
@end
