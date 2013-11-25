//
//  RadiosListDelegate.h
//  SanzenRadios
//
//  Created by Cours iPhone on 25/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RadiosListDelegate <NSObject>

- (void)setEditedName:(NSString *)name atIndexPath:(NSIndexPath *)indexPath;

@end
