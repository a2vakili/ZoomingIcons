//
//  SocialItemClass.m
//  Zooming Icons
//
//  Created by Arsalan Vakili on 2015-07-16.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "SocialItem.h"

@implementation SocialItem

- (instancetype)initWithImage: (NSString *)image color: (UIColor *)color name: (NSString *)name summary: (NSString *) summary
{
    self = [super init];
    if (self) {
        _imageName = image;
        _color = color;
        _name = name;
        _summary = summary;
        
    }
    return self;
}

@end
