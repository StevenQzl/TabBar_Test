//
//  SETableViewCell.m
//  Tabbar_Test
//
//  Created by 屈亮 on 2018/7/5.
//  Copyright © 2018年 屈亮. All rights reserved.
//

#import "SETableViewCell.h"

@implementation SETableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

@end
