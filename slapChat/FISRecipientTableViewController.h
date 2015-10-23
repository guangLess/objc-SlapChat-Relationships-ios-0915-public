//
//  FISRecipientTableViewController.h
//  slapChat
//
//  Created by Guang on 10/22/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISRecipientTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *managedMessageObjects;
@property (strong, nonatomic) FISDataStore *store;

@end
