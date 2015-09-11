//
//  DetailsViewController.m
//  Zooming Icons
//
//  Created by Arsalan Vakili on 2015-07-16.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "DetailsViewController.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)configureView{
    
    if (self.socialItem) {
        self.socialImageView.image = [UIImage imageNamed:self.socialItem.imageName];
        self.socialNameLabel.text = self.socialItem.name;
        self.socialSummaryLabel.text = self.socialItem.summary;
        self.view.backgroundColor = self.socialItem.color;
    }
    
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}




@end
