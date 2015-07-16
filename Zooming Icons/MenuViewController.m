//
//  MenuViewController.m
//  
//
//  Created by Arsalan Vakili on 2015-07-16.
//
//

#import "MenuViewController.h"
#import "SocialItemCell.h"
#import "SocialItem.h"
#import "DetailsViewController.h"

@interface MenuViewController ()

@property(nonatomic) NSMutableArray *menuArray1;
@property(nonatomic) NSMutableArray *menuArray2;

@end

@implementation MenuViewController

static NSString * const reuseIdentifier = @"Cell";

static NSString * const segueIdentifier = @"showDetails";



-(void)configureModel{
    
    self.menuArray1 = [[NSMutableArray alloc]init];
    self.menuArray2 = [[NSMutableArray alloc]init];
    
    UIColor *twitterColor = [UIColor colorWithRed:0.255 green:0.557 blue:0.910 alpha:1];
    
    UIColor *facebookColor = [UIColor colorWithRed:0.239 green:0.353 blue:0.588 alpha:1];
    
    UIColor *youtubeColor = [UIColor colorWithRed:0.729 green:0.188 blue:0.588 alpha:1];
    
    UIColor *vimeoColor = [UIColor colorWithRed:0.329 green:0.737 blue:0.988 alpha:1];
    
    UIColor *instagramColor = [UIColor colorWithRed:0.325 green:0.498 blue:0.635 alpha:1];
    
    SocialItem *socialItem1 = [[SocialItem alloc]initWithImage:@"icon-twitter "color:twitterColor name:@"Twitter" summary:@"Twitter is an online social networking service that enables users to send and read short 140-character messages called \"tweets\".” }"];
    
    SocialItem *socialItem2 = [[SocialItem alloc]initWithImage:@"icon-facebook" color:facebookColor name:@"Facebook" summary:@"Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities."];
    
    SocialItem *socialItem3 = [[SocialItem alloc]initWithImage:@"icon-youtube" color:youtubeColor name:@"Youtube" summary:@"YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos."];
    
    SocialItem *socialItem4 = [[SocialItem alloc]initWithImage:@"icon-vimeo" color:vimeoColor name:@"Vimeo" summary:@"Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein"];
    
    SocialItem *socialItem5 = [[SocialItem alloc]initWithImage:@"icon-instagram" color:instagramColor name:@"Instagram" summary:@"Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr."];
    
    [self.menuArray1 addObjectsFromArray:@[socialItem1,socialItem2]];
    [self.menuArray2 addObjectsFromArray:@[socialItem3,socialItem4,socialItem5]];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    [self configureModel];
    
//    [self.collectionView registerClass:[SocialItemCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // overrides the storyboard version of SocialItemCell
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([[segue identifier] isEqualToString: segueIdentifier]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]objectAtIndex:0];
        
        if (indexPath.section == 0) {
            SocialItem *socialItem = self.menuArray1[indexPath.item];
            [[segue destinationViewController] setSocialItem:socialItem];
        }
        else{
                SocialItem *socialItem = self.menuArray2[indexPath.item];
            [[segue destinationViewController]setSocialItem:socialItem];
        }
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:segueIdentifier sender:self];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     SocialItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    if (indexPath.section == 0) {
      SocialItem *socialItems1 = [self.menuArray1 objectAtIndex:indexPath.item];
      cell.imageView.image = [UIImage imageNamed:socialItems1.imageName];
        cell.colorView.backgroundColor = socialItems1.color;
    } else {
        SocialItem *socialItems2 = [self.menuArray2 objectAtIndex:indexPath.item];
        cell.imageView.image = [UIImage imageNamed:socialItems2.imageName];
        cell.colorView.backgroundColor = socialItems2.color;
    }
   

return cell;
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    NSInteger cellCount = [collectionView numberOfItemsInSection:section];
    
    CGFloat cellSpacing = ((UICollectionViewFlowLayout *) collectionViewLayout).minimumInteritemSpacing;
    
    CGFloat cellWidth = ((UICollectionViewFlowLayout *) collectionViewLayout).itemSize.width;
    
    CGFloat collectionWidth = ((UICollectionViewFlowLayout *) collectionViewLayout).collectionView.bounds.size.width;
    
    

    CGFloat inset = (collectionWidth - (cellCount * (cellWidth + cellSpacing) - cellSpacing))/ 2;
    
    return UIEdgeInsetsMake(50, inset, 0, inset);
    
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
