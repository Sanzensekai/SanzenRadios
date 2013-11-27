//
//  RadioViewController.m
//  SanzenRadios
//
//  Created by Cours iPhone on 26/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import "RadioViewController.h"

@interface RadioViewController ()

@end

@implementation RadioViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.nameField.text = [self.radio valueForKey:@"name"];
    self.categoryField.text = [self.radio valueForKey:@"category"];
    self.urlField.text = [self.radio valueForKey:@"url"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.radio setValue:self.nameField.text forKey:@"name"];
    [self.radio setValue:self.categoryField.text forKey:@"category"];
    [self.radio setValue:self.urlField.text forKey:@"url"];
}

@end
