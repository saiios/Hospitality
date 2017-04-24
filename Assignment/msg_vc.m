//
//  msg_vc.m
//  Smatrimony
//
//  Created by INDOBYTES on 24/02/17.
//  Copyright © 2017 Indobytes. All rights reserved.
//

#import "msg_vc.h"

@interface msg_vc ()

@end

@implementation msg_vc

@synthesize contentArray;

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"index value %ld",(long)_index);
    _collection_view.delegate=self;
    _collection_view.dataSource=self;
    
    [_collection_view registerNib:[UINib nibWithNibName:@"Home_Tab_Cell" bundle:nil] forCellWithReuseIdentifier:@"Home_Tab_Cell_id"];
   // [_collection_view reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
    return CGSizeMake(_collection_view.frame.size.width/2-20, 220);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"Home_Tab_Cell_id";
    
    Home_Tab_Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.profile_img.layer.cornerRadius = 30.0;
    cell.profile_img.clipsToBounds = YES;
    
    cell.wbc_view.layer.borderColor = [UIColor grayColor].CGColor;
    cell.wbc_view.layer.borderWidth = 1.0f;
    cell.wbc_view.layer.cornerRadius = 10.0;
    
    cell.rbc_view.layer.borderColor = [UIColor grayColor].CGColor;
    cell.rbc_view.layer.borderWidth = 1.0f;
    cell.rbc_view.layer.cornerRadius = 10.0;
    
    cell.Hematocrit_view.layer.borderColor = [UIColor grayColor].CGColor;
    cell.Hematocrit_view.layer.borderWidth = 1.0f;
    cell.Hematocrit_view.layer.cornerRadius = 10.0;
    
    cell.mcv_view.layer.borderColor = [UIColor grayColor].CGColor;
    cell.mcv_view.layer.borderWidth = 1.0f;
    cell.mcv_view.layer.cornerRadius = 10.0;
    
    cell.mpv_view.layer.borderColor = [UIColor grayColor].CGColor;
    cell.mpv_view.layer.borderWidth = 1.0f;
    cell.mpv_view.layer.cornerRadius = 10.0;
    
    cell.mch_view.layer.borderColor = [UIColor grayColor].CGColor;
    cell.mch_view.layer.borderWidth = 1.0f;
    cell.mch_view.layer.cornerRadius = 10.0;
    
    cell.final_view.layer.borderColor = [UIColor grayColor].CGColor;
    cell.final_view.layer.borderWidth = 1.0f;
    cell.final_view.layer.cornerRadius = 10.0;

    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *) collectionView
                        layout:(UICollectionViewLayout *) collectionViewLayout
        insetForSectionAtIndex:(NSInteger) section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *) collectionView
                   layout:(UICollectionViewLayout *) collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger) section {
    return 5.0;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
