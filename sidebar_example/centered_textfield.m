//
//  centered_textfield.m
//  sidebar_example
//
//  Created by boo on 22/02/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "centered_textfield.h"

@implementation centered_textfield

- (NSRect) titleRectForBounds:(NSRect)frame {
    
    CGFloat stringHeight = self.attributedStringValue.size.height;
    NSRect titleRect = [super titleRectForBounds:frame];
    CGFloat oldOriginY = frame.origin.y;
    titleRect.origin.y = frame.origin.y + (frame.size.height - stringHeight) / 2.0;
    titleRect.size.height = titleRect.size.height - (titleRect.origin.y - oldOriginY);
    return titleRect;
}

- (void) drawInteriorWithFrame:(NSRect)cFrame inView:(NSView*)cView {
    [super drawInteriorWithFrame:[self titleRectForBounds:cFrame] inView:cView];
}




@end
