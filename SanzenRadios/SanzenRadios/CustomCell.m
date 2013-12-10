//
//  CustomCell.m
//  SanzenRadios
//
//  Created by Cours iPhone on 10/12/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize customLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
