//
//  ViewController.m
//  SanzenRadios
//
//  Created by Cours iPhone on 25/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import "RadioViewController.h"
#import "RadiosListDelegate.h"

@interface RadioViewController ()

@end

@implementation RadioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.textView.text = self.name;
    [self.textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(setEditedName:atIndexPath:)]) {
        // Finish editing
        [self.textView endEditing:YES];
        // Prepare selection info
        NSString *name = self.textView.text;
        [self.delegate setEditedName:name atIndexPath:self.indexPath];
    }
}

@end
