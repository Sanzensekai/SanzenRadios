//
//  RadioViewController.h
//  SanzenRadios
//
//  Created by Cours iPhone on 26/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface RadioViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UITextField *urlField;

@property (strong, nonatomic) MPMoviePlayerController *player;
@property (strong, nonatomic) NSManagedObject *radio;

@end
