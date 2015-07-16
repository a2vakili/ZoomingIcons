//
//  SocialItemClass.h
//  Zooming Icons
//
//  Created by Arsalan Vakili on 2015-07-16.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SocialItem : NSObject


@property(nonatomic, strong) NSString *imageName;
@property(nonatomic,strong) UIColor *color;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *summary;

- (instancetype)initWithImage: (NSString *)image color: (UIColor *)color name: (NSString *)name summary: (NSString *) summary;

@end
