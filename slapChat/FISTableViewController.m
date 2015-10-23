//
//  FISTableViewController.m
//  slapChat
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISTableViewController.h"
#import "Message.h"

@interface FISTableViewController ()

@property (strong, nonatomic) NSArray *managedMessageObjects;
@property (strong, nonatomic) FISDataStore *store;

@end

@implementation FISTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@'s Messages", self.recipient.name];
    self.managedMessageObjects = [self.recipient.messages allObjects];
    self.store = [FISDataStore sharedDataStore];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.managedMessageObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basiccell" forIndexPath:indexPath];
    
    Message * message = self.managedMessageObjects[indexPath.row];
    
    cell.textLabel.text = message.content;
    
    return cell;
}

@end
