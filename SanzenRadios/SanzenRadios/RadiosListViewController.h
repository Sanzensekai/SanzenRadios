//
//  RadiosListViewController.h
//  SanzenRadios
//
//  Created by Cours iPhone on 25/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadiosListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *radios;
@property (nonatomic, strong) NSMutableArray *radiourls;
@property (nonatomic, strong) NSDictionary *data;

- (IBAction)toggleEdit:(id)sender;

@end
