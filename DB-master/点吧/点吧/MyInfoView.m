//
//  MyInfoView.m
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "MyInfoView.h"

@implementation MyInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.myTable];
    }
    return self;
}


- (UITableView *)myTable {
    if (!_myTable) {
        
        _myTable = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStyleGrouped];
    }
    
    return _myTable;
}


@end
