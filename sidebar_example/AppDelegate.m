//
//  AppDelegate.m
//  sidebar_example
//
//  Created by boo on 17/02/2017.
//  Copyright © 2017 boo. All rights reserved.

#import "AppDelegate.h"
@implementation AppDelegate

@synthesize list,window,scrollview;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    list = [[NSMutableArray alloc] init];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"头条新闻",@"parent",
                          [NSArray arrayWithObjects:@"网易", nil],@"children",
                          nil];
    [list addObject:dic1];
    
    scrollview = [[NSScrollView alloc] initWithFrame:window.contentView.frame];
    NSOutlineView* outlineV = [[NSOutlineView alloc] initWithFrame:window.contentView.frame];
    NSTableColumn* tCol = [[NSTableColumn alloc] initWithIdentifier:@"tablecolumn"];
    [outlineV addTableColumn:tCol];
    [outlineV setOutlineTableColumn:tCol];
    [[outlineV.tableColumns objectAtIndex:0] setWidth:scrollview.frame.size.width];
    [outlineV setDelegate:self];
    [outlineV setDataSource:self];
    [outlineV setHeaderView:nil];
    [outlineV setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
    
    [scrollview setDocumentView:outlineV];
    [window.contentView addSubview:scrollview];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (item == nil) {
        return [list count];
    }
    if ([item isKindOfClass:[NSDictionary class]]) {
        return [[item objectForKey:@"children"] count];
    }
    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    if (item == nil) {
        return [list objectAtIndex:index];
    }
    if ([item isKindOfClass:[NSDictionary class]]) {
        return [[item objectForKey:@"children"] objectAtIndex:index];
    }
    return nil;
}


- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if ([item isKindOfClass:[NSDictionary class]]) {
        return YES;
    }else {
        return NO;
    }
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item{
    
    NSView* theView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 100, 30)];
    NSTextField* brand_text = [[NSTextField alloc] init];
    centered_textfield* centered_text = nil;
    if ([item isKindOfClass:[NSString class]]) {
        
        NSButton *myCheckBox = [[NSButton alloc] initWithFrame:NSMakeRect(0, theView.frame.size.height/2-10, 20, 20)];
        [myCheckBox setButtonType:NSSwitchButton];
        [theView addSubview:myCheckBox];
        
        NSImageView* logo =[[NSImageView alloc] initWithFrame:NSMakeRect(20, 0, 50, 30)];
        [logo setImage:[NSImage imageNamed:@"wangyi.png"]];
        [theView addSubview:logo];
        
        [brand_text setFrame:NSMakeRect(70, 0, 100, 30)];
        centered_text= [[centered_textfield alloc] initTextCell:item];
        
    } else {
        [brand_text setFrame:NSMakeRect(0, 0, 100, 30)];
        centered_text= [[centered_textfield alloc] initTextCell:[item objectForKey:@"parent"]];
    }
    
    [brand_text setCell:centered_text];
    [brand_text setBordered:NO];
    [brand_text setFont:[NSFont fontWithName:@"Arial" size:15]];
    [theView addSubview:brand_text];
    
    return theView;
}


- (CGFloat)outlineView:(NSOutlineView *)outlineView heightOfRowByItem:(id)item{

    return 30;

}


@end
