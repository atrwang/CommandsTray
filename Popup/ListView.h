//
//  ListView.h
//  ListViewTest
//
//  Created by ddtech on 14-4-8.
//  Copyright (c) 2014年 ddtech. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ListView : NSView <NSTableViewDataSource, NSTableViewDelegate> {
    NSScrollView *_tableContainer;
    NSTableView *_tableView;
}

@property(strong,nonatomic) NSDictionary* commands;
@property(strong,nonatomic) NSArray* commandKeys;

@end
