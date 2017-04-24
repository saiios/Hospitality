//
//  Home_Tab_Cell.h
//  Assignment
//
//  Created by INDOBYTES on 24/04/17.
//  Copyright © 2017 sai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home_Tab_Cell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *wbc_view;
@property (weak, nonatomic) IBOutlet UIView *rbc_view;
@property (weak, nonatomic) IBOutlet UIView *Hematocrit_view;
@property (weak, nonatomic) IBOutlet UIView *mcv_view;
@property (weak, nonatomic) IBOutlet UIView *mpv_view;
@property (weak, nonatomic) IBOutlet UIView *mch_view;
@property (weak, nonatomic) IBOutlet UIView *final_view;
@property (weak, nonatomic) IBOutlet UIImageView *profile_img;

@end
