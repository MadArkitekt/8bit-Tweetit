//
//  EBSPostVC.m
//  8bitStatus
//
//  Created by MadArkitekt on 5/21/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "EBSPostVC.h"
#import "EBSData.h"
#import "STTwitterAPI.h"
/*==========================================*/
@interface EBSPostVC ()

@end
/*==========================================*/
@implementation EBSPostVC
{
    STTwitterAPI *twitter;
    UIButton *fbButton;
    UIButton *twtButton;
    UIImageView *faceChoice;
}
/*==========================================*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
            twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
            [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
                NSLog(@"USERNAME: %@",username);
            } errorBlock:^(NSError *error) {
                NSLog(@"PROBLEM: %@",error.userInfo);
            }];
            }
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
/*==========================================*/
- (void) viewDidLoad
{
    [super viewDidLoad];
 
    self.navigationController.navigationBarHidden = YES;
    
    NSLog(@"%@",[EBSData mainData].chosenFace);
    faceChoice = [[UIImageView alloc] init];
   [faceChoice setImage:[UIImage imageNamed:[EBSData mainData].chosenFace]];
    [faceChoice setFrame:CGRectMake((SCREEN_WIDTH / 5) -10, (SCREEN_HEIGHT / 3), (SCREEN_WIDTH * 2/3), (SCREEN_HEIGHT * 2/3) - 150)];
    [self.view addSubview:faceChoice];
    
    UIButton *postButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 3 + 30, SCREEN_HEIGHT * 5/6, 64, 48)];
    [postButton setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [postButton addTarget:self action:@selector(post) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:postButton];
    
    twtButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [twtButton setFrame:CGRectMake(SCREEN_WIDTH / 2 - 32 , 50, 64, 64)];
    [twtButton setImage:[UIImage imageNamed:@"twtgray"] forState:UIControlStateSelected];
    [twtButton setImage:[UIImage imageNamed:@"twtblu"] forState:UIControlStateNormal];
    [twtButton addTarget:self action:@selector(twitterPost:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twtButton];
    
    UILabel *banner = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 4, 140, SCREEN_WIDTH / 2, 25)];;
    [banner setText:@"The O.G. of Emoji:"];
    [banner setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:banner];
    
//    fbButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [fbButton setFrame:CGRectMake(self.view.frame.size.width *3/5, 50, 64, 64)];
//    [fbButton setImage:[UIImage imageNamed:@"fbgray"] forState:UIControlStateSelected];
//    [fbButton setImage:[UIImage imageNamed:@"fbblu"] forState:UIControlStateNormal];
//    [fbButton addTarget:self action:@selector(fbPost:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:fbButton];
}
/*==========================================*/
- (void)twitterPost:(UIButton *)sender
{
    if([sender isSelected])
    {
        [self post];
           [sender setSelected:NO];
    } else {
        [sender setSelected:YES];
    }
  }
/*==========================================*/
- (void)fbPost:(UIButton *)sender
{
    if([sender isSelected])
    {
        
        [sender setSelected:NO];
    } else {

        [sender setSelected:YES];
    }
    }
/*==========================================*/
- (void)post
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = paths[0];
    
    UIImageView *placeHolderImage = [[UIImageView alloc] init];
    [placeHolderImage setImage:[UIImage imageNamed:[EBSData mainData].chosenFace]];
    
    NSData * imageData = UIImagePNGRepresentation(placeHolderImage.image);
    
    NSString* pngPath = [documentPath stringByAppendingPathComponent:@"big_smilie.png"];
    [imageData writeToFile:pngPath atomically:YES];
    
    NSURL * url = [NSURL fileURLWithPath:pngPath];

    [twitter postStatusUpdate:@"The O.G. of Emoji: " inReplyToStatusID:nil mediaURL:url placeID:nil latitude:nil longitude:nil uploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
        
    } successBlock:^(NSDictionary *status) {
        
    } errorBlock:^(NSError *error) {
        NSLog(@"ERROR: %@", error.userInfo);
    }];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*==========================================*/
-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
/*==========================================*/
- (BOOL)prefersStatusBarHidden {return YES;};
/*==========================================*/

@end
