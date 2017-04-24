//
//  Home_Screen.h
//  Assignment
//
//  Created by INDOBYTES on 24/04/17.
//  Copyright © 2017 sai. All rights reserved.

#import <UIKit/UIKit.h>
#import "msg_vc.h"
#import "PageCollectionViewCell.h"
#import "UIFloatLabelTextField.h"

@interface Home_Screen : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate>
{
    NSArray *sent_ary;
    int presentIndex;
    UIView *cellSelectionBar;
    NSIndexPath *path;
    NSUserDefaults *user_inf;
    NSArray *tabsArray;
}
@property (strong, nonatomic) UIPageViewController      *pageController;
@property (strong, nonatomic) IBOutlet UIView *profileTableBgView;
@property (strong, nonatomic) IBOutlet UICollectionView *tabsView;
@end
