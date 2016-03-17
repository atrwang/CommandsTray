//
//  ListCell.h
//  yRadio
//
//  Created by yang jie on 14-3-30.
//  Copyright (c) 2014年 yangjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ListView.h"
@interface ListCell : NSView {

	NSTextField *_listTextField;
}

@property (strong, nonatomic)NSButton* runButton;

@property (strong, nonatomic)ListView* parentView;

- (void)setRunTitle:(NSString *)title;
- (void)setCellTitle:(NSString *)title;

@end
