//
//  ZoomingIconTransition.m
//  Zooming Icons
//
//  Created by Arsalan Vakili on 2015-07-16.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ZoomingIconTransition.h"
#import "MenuViewController.h"
#import "DetailsViewController.h"





static const NSTimeInterval kZoomingIconTransitionDuration = 1.0;

@implementation ZoomingIconTransition


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContex{
    return kZoomingIconTransitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *MenuViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* DetailViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // add both controller's view to the view hierarchy.
    
    [[transitionContext containerView] insertSubview:DetailViewController.view belowSubview:MenuViewController.view];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        MenuViewController.view.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        MenuViewController.view.alpha = 1.0;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
    
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return self;
}

@end
