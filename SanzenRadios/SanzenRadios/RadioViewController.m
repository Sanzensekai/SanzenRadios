//
//  RadioViewController.m
//  SanzenRadios
//
//  Created by Cours iPhone on 26/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import "RadioViewController.h"
#import "AppDelegate.h"

@interface RadioViewController ()

@end

@implementation RadioViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.player = [[MPMoviePlayerController alloc] init];
    self.player.movieSourceType = MPMovieSourceTypeStreaming;
    self.player.view.hidden = YES;
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay = NO;
    [self.player prepareToPlay];
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
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    [context save:nil];
}

- (IBAction)playStream:(id)sender
{
    [self.player stop];
    self.player.contentURL = [NSURL URLWithString: self.urlField.text ];
    [self.player play];
}

- (IBAction)pauseStream:(id)sender
{
    [self.player pause];
}

- (IBAction)touchControl:(id)sender {
    [self.view endEditing:YES];
}
@end
