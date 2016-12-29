//
//  TopScroll.m
//  滚动标题Demo
//
//  Created by Pro on 2016/11/28.
//  Copyright © 2016年 liuhanwen. All rights reserved.
//

#import "TopScroll.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface TopScroll()
//判断标题居中按钮
@property(nonatomic,strong)UIButton*judgeBth;

@end
@implementation TopScroll
//滚动宽度
static CGFloat content;
//每个按钮宽度
static CGFloat bthWidth;

-(NSMutableArray * )titleArr
{
    if (!_titleArr) {
        _titleArr=[NSMutableArray array];
    }
    return _titleArr;
}
//初始化
-(id)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)titleArr
{
    if (self=[super initWithFrame:frame]) {
        [self addHeadBth:titleArr];
        self.showsHorizontalScrollIndicator=NO;
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
    
}
//添加按钮
-(void)addHeadBth:(NSArray*)arr
{
    
    bthWidth = WIDTH/arr.count;
    for (int i = 0 ; i<arr.count; i++) {
        
        UIButton*bth=[UIButton buttonWithType:UIButtonTypeCustom];
        if (bthWidth>WIDTH/5) {
            bth.frame=CGRectMake(i*bthWidth, 0, bthWidth, 40);
        }
        else
        {
            bth.frame=CGRectMake(i*WIDTH/5, 0, WIDTH/5, 40);
        }
        
        bth.tag=i;
        if (bth.tag == 0) {
            bth.selected = YES;
        }
        [bth addTarget:self action:@selector(selectTitleCente:) forControlEvents:UIControlEventTouchUpInside];
        
        [bth setTitle:arr[i] forState:UIControlStateNormal];
        [bth setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bth setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [self addSubview:bth];
        [self.titleArr addObject:bth];
    }
    content = WIDTH/5*arr.count;
    if (content>WIDTH) {
        self.contentSize=CGSizeMake(content, 0);
    }
}
//标题居中
- (void)titleCenter:(UIButton * )bth
{
    CGFloat centerX=bth.center.x-WIDTH*0.5;
    CGFloat maxX=self.contentSize.width-WIDTH;
    if (centerX<0)    centerX =0;
    if (centerX>maxX)     centerX = maxX;
    [self setContentOffset:CGPointMake(centerX, 0) animated:YES];
}
//按钮为选中状态
- (void)selectTitleCente:(UIButton *)selectBth
{
    if (_judgeBth==nil) {
        selectBth.selected=YES;
        _judgeBth=selectBth;
    }
    else if (_judgeBth!=nil&&_judgeBth==selectBth)
    {
        selectBth.selected=YES;
    }
    else if (_judgeBth!=selectBth&&_judgeBth!=nil)
    {
        _judgeBth.selected=NO;
        selectBth.selected=YES;
        _judgeBth=selectBth;
    }
    
    //显示居中
    if (content>WIDTH) {
        [self titleCenter:selectBth];
        
    }
    
    
    //代理实现
    [self.TopDelegate selectTitleAtIndex:selectBth.tag];
}
@end
