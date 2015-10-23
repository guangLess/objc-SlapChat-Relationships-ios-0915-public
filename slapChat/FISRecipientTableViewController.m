//
//  FISRecipientTableViewController.m
//  slapChat
//
//  Created by Guang on 10/22/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//
#import "FISTableViewController.h"
#import "FISRecipientTableViewController.h"
#import "FISDataStore.h"

@interface FISRecipientTableViewController ()
@property(nonatomic, strong)FISDataStore * dataStore;
@property(nonatomic, strong)NSArray * recipients;
@end

@implementation FISRecipientTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataStore = [FISDataStore sharedDataStore];
    [self reloadData];
}

-(void)reloadData{
    
    [self.dataStore fetchData];
    self.recipients = self.dataStore.recipients;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recipients.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basiccell" forIndexPath:indexPath];
    cell.textLabel.text = [self.recipients[indexPath.row] name];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    FISTableViewController * messageListVC = segue.destinationViewController;
    NSIndexPath * index = self.tableView.indexPathForSelectedRow;
//    NSLog(@"indexPath %lu",index.row);
    Recipient * recipient = self.recipients[index.row];
    messageListVC.recipient = recipient;
    
//    NSLog(@"Recipient Name ----- %@", recipient.name);
//    NSArray * messagArray = [recipient.messages allObjects];
//    NSLog(@"hello set %@",messagArray);
//    messageListVC.managedMessageObjects = messagArray;
}

@end
