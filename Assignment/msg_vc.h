//
//  msg_vc.h
//  Smatrimony
//
//  Created by INDOBYTES on 24/02/17.
//  Copyright © 2017 Indobytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Home_Tab_Cell.h"

@interface msg_vc : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (assign, nonatomic) NSInteger index;
@property(strong,nonatomic) NSMutableArray *contentArray;
@property (strong, nonatomic) IBOutlet UICollectionView *collection_view;

@end
