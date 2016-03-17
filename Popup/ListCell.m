//
//  ListCell.m
//  yRadio
//
//  Created by yang jie on 14-3-30.
//  Copyright (c) 2014年 yangjie. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell
- (id)init {
	if (self = [super init]) {
		self.frame = CGRectMake(0, 0, 400, 30);

		self.wantsLayer = YES;
//		self.layer.backgroundColor = [NSColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1.0].CGColor;

		NSTrackingArea* trackingArea = [[NSTrackingArea alloc]
										initWithRect:[self bounds]
										options:NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways
										owner:self userInfo:nil];
		[self addTrackingArea:trackingArea];
        
        self.runButton = [[NSButton alloc] initWithFrame:CGRectMake(10, 5, 100, 35)];
        _runButton.font = [NSFont boldSystemFontOfSize:13];
        [_runButton  setTarget:self];
        [_runButton setAction:@selector(buttonClick:)];
        [self addSubview:_runButton];
        
		_listTextField = [[NSTextField alloc] initWithFrame:CGRectMake(120, 5, 250, 35)];
		_listTextField.font = [NSFont boldSystemFontOfSize:13];
		[_listTextField setBackgroundColor:[NSColor clearColor]];
		[_listTextField setDrawsBackground:YES];
		[_listTextField setBordered:YES];
		[_listTextField.cell setUsesSingleLineMode:YES];
		[_listTextField setEditable:YES];
		[_listTextField setTextColor:[NSColor lightGrayColor]];
		[self addSubview:_listTextField];
	}
	return self;
}

- (void)setRunTitle:(NSString *)title{
    [_runButton setTitle:title];
}

-(void)buttonClick:(NSButton*)button{
    NSLog(@"string _ %@",_listTextField.stringValue);
//    NSString* cmd = @"open -n -a /Applications/nodewebkit.app  --args /Users/kevin/Desktop/bossv2/app";
    if (_listTextField.stringValue.length > 0) {
        [[NSTask launchedTaskWithLaunchPath:@"/bin/sh"
                                  arguments:[NSArray arrayWithObjects:@"-c", _listTextField.stringValue, nil]]
         waitUntilExit];
    }
    
    
}

- (void)setCellTitle:(NSString *)title {

	_listTextField.stringValue = title;
}

- (void)mouseEntered:(NSEvent *)theEvent {
	[_listTextField setTextColor:[NSColor colorWithRed:29/255.0 green:158/255.0 blue:140/255.0 alpha:1.0]];
}

- (void)mouseExited:(NSEvent *)theEvent {
	[_listTextField setTextColor:[NSColor lightGrayColor]];
}


- (void)drawRect:(NSRect)dirtyRect {
    // set any NSColor for filling, say white:
    [[NSColor clearColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}
@end






