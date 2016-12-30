//
//  TopScroll.h
//  滚动标题Demo
//
//  Created by Pro on 2016/11/28.
//  Copyright © 2016年 liuhanwen. All rights reserved.
//

#import <UIKit/UIKit.h>
//代理方法
@protocol TopScrollDelagate<NSObject>
//通过下标判断加载视图
- (void)selectTitleAtIndex:(NSInteger)index;

@end

@interface TopScroll : UIScrollView
//代理
@property(nonatomic,weak)id<TopScrollDelagate>TopDelegate;
//标题数组
@property(nonatomic,strong)NSMutableArray*titleArr;
//初始化数组
- (id)initWithFrame:(CGRect)frame withTitleArr:(NSArray *  )titleArr;
//点击标题
- (void)selectTitleCente:(UIButton*)selectBth;

@end
