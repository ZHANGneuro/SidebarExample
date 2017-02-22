//
//  AppDelegate.h
//  sidebar_example
//
//  Created by boo on 17/02/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "centered_textfield.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,NSOutlineViewDelegate,NSOutlineViewDataSource>

@property (weak) IBOutlet NSWindow *window;
@property NSScrollView *scrollview;
@property NSMutableArray *list;

@end

