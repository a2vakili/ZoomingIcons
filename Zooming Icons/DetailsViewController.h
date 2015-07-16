//
//  DetailsViewController.h
//  Zooming Icons
//
//  Created by Arsalan Vakili on 2015-07-16.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialItem.h"

@interface DetailsViewController : UIViewController

@property(nonatomic,strong) SocialItem *socialItem;
@property (weak, nonatomic) IBOutlet UIImageView *socialImageView;
@property (weak, nonatomic) IBOutlet UILabel *socialNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *socialSummaryLabel;

@end
