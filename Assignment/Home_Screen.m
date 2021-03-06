//
//  Home_Screen.m
//  Assignment
//
//  Created by INDOBYTES on 24/04/17.
//  Copyright © 2017 sai. All rights reserved.
//

#import "Home_Screen.h"

@interface Home_Screen ()

@end

@implementation Home_Screen

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    cellSelectionBar = [[UIView alloc] init];
    cellSelectionBar.tag = 50;
    
    [_tabsView registerNib:[UINib nibWithNibName:@"PageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PagecollectionviewCell"];
    
    tabsArray =@[@"CRITICAL",@"WARNING",@"FEED"];
    [self createTabsView];
    [self updatePage];
}

#pragma mark paging
-(void)createTabsView
{
    [self.tabsView registerClass:[PageCollectionViewCell class] forCellWithReuseIdentifier:@"PagecollectionviewCell"];
    self.tabsView.backgroundColor = [UIColor clearColor];
    self.tabsView.showsHorizontalScrollIndicator =NO;
    
    //  self.tabsView.pagingEnabled =YES;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setMinimumInteritemSpacing:0];
    [flowLayout setMinimumLineSpacing:10];
    
    // not iPad pro
    float kk = self.view.frame.size.width/3;
    [flowLayout setItemSize:CGSizeMake(kk+10,44)];
    [flowLayout setSectionInset:UIEdgeInsetsMake(0, 0,0,0)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.tabsView setCollectionViewLayout:flowLayout];
    [self.tabsView reloadData];
}

#pragma mark - PagerViewDataSource
-(void)updatePage
{
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.view.autoresizesSubviews =YES;
    
    //self.pageController.view.autoresizingMask =UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth;
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    msg_vc *initialViewController = [self viewControllerAtIndex:0];
    
    // initialViewController.delegate =self;
    initialViewController.contentArray = @[@"test",@"tets"];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [_profileTableBgView addSubview:self.pageController.view];
    [self.pageController.view setFrame:CGRectMake(10,10,_profileTableBgView.bounds.size.width-20, _profileTableBgView.bounds.size.height-20)];
    
    [self.pageController didMoveToParentViewController:self];
}

- (msg_vc *)viewControllerAtIndex:(NSUInteger)index
{
    msg_vc *childViewController = [[msg_vc alloc] initWithNibName:@"msg_vc" bundle:nil];
   // childViewController.msg_delegate=self;
    childViewController.contentArray =@[@"",@""];
    childViewController.index = index;
    childViewController.view.frame = CGRectMake(10, 10, self.view.frame.size.width-20, self.pageController.view.frame.size.height-20);
    
    return childViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [(msg_vc *)viewController index];
    if (index == 0)
    {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(msg_vc *)viewController index];
    
    index++;
    if (index == [tabsArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed)
    {
        NSUInteger currentIndex = [[self.pageController.viewControllers lastObject] index];
        path = [NSIndexPath indexPathForRow:currentIndex inSection:0];
        presentIndex = (int)currentIndex;
        
        if (presentIndex <= tabsArray.count-1)
        {
            [self.tabsView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:presentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            [self.tabsView reloadData];
        }
    }
}

#pragma mark - CollectionView
- (NSInteger)numberOfColumnsInFlowLayout:(UICollectionViewFlowLayout *)flowlayout
{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return tabsArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"PagecollectionviewCell";
    
    PageCollectionViewCell   *cell =(PageCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.categoryTitle.text = [tabsArray objectAtIndex:indexPath.row];
    
    if (presentIndex == indexPath.row)
    {
        NSLog(@"%ld",(long)indexPath.row);
        float kk = self.view.frame.size.width/3;
        cellSelectionBar.frame = CGRectMake(5, collectionView.frame.size.height-2,150,3);
        
        cellSelectionBar.backgroundColor = [UIColor colorWithRed:172/255.0f green:0/255.0f blue:21/255.0f alpha:1.0];
        cellSelectionBar.tag = 500;
        [cell.contentView addSubview:cellSelectionBar];
        cell.categoryTitle.textColor = [UIColor blackColor];
    }
    else
    {
        for (UIView *vi in cell.contentView.subviews)
        {
            if (vi.tag == 50)
            {
                [vi removeFromSuperview];
            }
        }
       // cell.categoryTitle.textColor = [UIColor colorWithRed:208/255.0f green:198/255.0f blue:198/255.0f alpha:1.0];
        cell.categoryTitle.textColor = [UIColor grayColor];

    }
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(150, 50);
}

-(void)clicked:(UIButton *)sender{
    
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    msg_vc *initialViewController = [self viewControllerAtIndex:indexPath.row];
    // initialViewController.delegate =self;
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    initialViewController.contentArray =@[@"",@""];
    
    //initialViewController.currentIndex =presentIndex;
    if(presentIndex != indexPath.row)
    {
        if (presentIndex < indexPath.row)
        {
            [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        }
        else{
            [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
        }
        
    }
    presentIndex =(int)indexPath.row;
    
    [self.tabsView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:presentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
