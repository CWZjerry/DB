//
//  UIImage+JZ.m
//  我的微博
//
//  Created by peijz on 16/1/4.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import "UIImage+JZ.h"

@implementation UIImage (JZ)
+(UIImage *)imageWithNamed:(NSString *)name
{
    return [UIImage imageNamed:name];
}
+(UIImage *)resizeImageWithName:(NSString *)name
{
    UIImage * image = [UIImage imageWithNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
