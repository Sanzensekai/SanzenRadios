//
//  RadiosViewController.h
//  SanzenRadios
//
//  Created by Cours iPhone on 26/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface RadiosViewController : UITableViewController

- (IBAction)createRadio:(id)sender;
@property (weak, nonatomic) IBOutlet CustomCell *cell;

@end
