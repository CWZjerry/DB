//
//  User.m
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "User.h"

@implementation User


@synthesize image;

@synthesize name;

@synthesize birthday;

@synthesize phoneNum;

@synthesize password;

@synthesize comeDate;


-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.phoneNum forKey:@"phoneNum"];
    [aCoder encodeObject:self.password forKey:@"password"];
    
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ([self init]) {
        //解压过程
        self.image=[aDecoder decodeObjectForKey:@"image"];
        self.name= [aDecoder decodeObjectForKey:@"name"];
        self.birthday=[aDecoder decodeObjectForKey:@"birthday"];
        self.phoneNum=[aDecoder decodeObjectForKey:@"phoneNum"];
        self.password=[aDecoder decodeObjectForKey:@"password"];
        
    }
    return self;
    
}

@end
