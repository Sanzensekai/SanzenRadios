//
//  ViewController.h
//  SanzenRadios
//
//  Created by Cours iPhone on 25/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) id delegate;

@end
