//
//  HomeView.m
//  点吧
//
//  Created by Jerry on 2016/12/27.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView

-(UITableView *)homeTableView
{
    if(_homeTableView == nil)
    {
        _homeTableView =[[UITableView alloc]initWithFrame:CGRectMake(ZeroFrame, 44, WidthBounds,HeightBounds) style:UITableViewStylePlain];
    }
    return _homeTableView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self  = [super initWithFrame:frame])
    {
        [self addSubview:self.homeTableView];
    }
    return self;
}
@end
