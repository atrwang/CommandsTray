//
//  ListView.m
//  ListViewTest
//
//  Created by ddtech on 14-4-8.
//  Copyright (c) 2014年 ddtech. All rights reserved.
//

#import "ListView.h"
#import "ListCell.h"

@implementation ListView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        
        _tableView = [[NSTableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _tableView.backgroundColor = [NSColor clearColor];
        
		NSTableColumn *_channTableColumn = [[NSTableColumn alloc] initWithIdentifier:@"channels"];
		[_tableView addTableColumn:_channTableColumn];
		_channTableColumn.width = frame.size.width;
		[_tableView setHeaderView:nil];
        
		_tableView.delegate = self;
		_tableView.dataSource = self;
        
		//[_tableView setAction:@selector(onRowClick:)];
		[_tableView setTarget:self];
        
		[_tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
        
		_tableContainer = [[NSScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _tableContainer.backgroundColor = [NSColor colorWithWhite:1 alpha:.9];
		[_tableContainer setDocumentView:_tableView];
		[_tableContainer setHasVerticalScroller:YES];
		[self addSubview:_tableContainer];
        
        
        self.commands = [NSMutableDictionary dictionaryWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"commands.plist"]];
        self.commandKeys = [self.commands allKeys];
        if ([self.commandKeys count]<=0) {
            NSAlert* alert = [NSAlert alertWithError:[NSError errorWithDomain:@"请在home目录下创建commands.plist 并设置命令字典{\"title\":\"command\"}" code:0 userInfo:nil]];
            [alert runModal];
        }
        
        [_tableView reloadData];
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

#pragma mark - table view data source
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
	return [self.commandKeys count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	return @"1";
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
	return 40;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	if ([tableColumn.identifier isEqualToString:@"channels"]) {
        
		ListCell *listCell = [[ListCell alloc] init];
        listCell.parentView = self;
        listCell.runButton.tag = row;
		if (row < [self.commandKeys count]) {
            [listCell setRunTitle:[self.commandKeys objectAtIndex:row]];
			[listCell setCellTitle:[self.commands valueForKey:[self.commandKeys objectAtIndex:row]]];
        }else {
             [listCell setRunTitle:[NSString stringWithFormat:@"%li Run", row+1]];
             [listCell setCellTitle:@""];
        }
        
		return listCell;
	}
	return nil;
}

@end
