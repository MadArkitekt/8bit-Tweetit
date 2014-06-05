//
//  EBSPostVC.m
//  8bitStatus
//
//  Created by MadArkitekt on 5/21/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "EBSPostVC.h"
#import "EBSData.h"
#import "STTwitterAPI.h"
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
@interface EBSPostVC ()

@end

@implementation EBSPostVC
{
    STTwitterAPI *twitter;
    UIButton *fbButton;
    UIButton *twtButton;
    UIImageView *faceChoice;
}
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

    }
    return self;
}
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
- (void) viewDidLoad
{        self.view.backgroundColor = [UIColor whiteColor];

    [super viewDidLoad];
    
    NSLog(@"%@",[EBSData mainData].chosenFace);
    faceChoice = [[UIImageView alloc] init];
   [faceChoice setImage:[UIImage imageNamed:[EBSData mainData].chosenFace]];
    [faceChoice setFrame:CGRectMake((self.view.frame.size.width / 5) -10, (self.view.frame.size.height / 3), (self.view.frame.size.width *2/3), (self.view.frame.size.height * 2/3) - 150)];
    [self.view addSubview:faceChoice];
    
    UIButton *postButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/3 + 30, self.view.frame.size.height * 5/6, 64, 48)];
    [postButton setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [postButton addTarget:self action:@selector(post) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:postButton];
    
    twtButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [twtButton setFrame:CGRectMake(self.view.frame.size.width *1/5, 50, 64, 64)];
    [twtButton setImage:[UIImage imageNamed:@"twtgray"] forState:UIControlStateSelected];
    [twtButton setImage:[UIImage imageNamed:@"twtblu"] forState:UIControlStateNormal];
    [twtButton addTarget:self action:@selector(twitterPost:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twtButton];
    
    fbButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [fbButton setFrame:CGRectMake(self.view.frame.size.width *3/5, 50, 64, 64)];
    [fbButton setImage:[UIImage imageNamed:@"fbgray"] forState:UIControlStateSelected];
    [fbButton setImage:[UIImage imageNamed:@"fbblu"] forState:UIControlStateNormal];
    [fbButton addTarget:self action:@selector(fbPost:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fbButton];
}

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

- (void)fbPost:(UIButton *)sender
{
    if([sender isSelected])
    {
        
        [sender setSelected:NO];
    } else {

        [sender setSelected:YES];
    }
    }

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

    [twitter postStatusUpdate:@"Test" inReplyToStatusID:@"Test" mediaURL:url placeID:nil latitude:nil longitude:nil uploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
        
    } successBlock:^(NSDictionary *status) {
        
    } errorBlock:^(NSError *error) {
        NSLog(@"ERROR: %@", error.userInfo);
    }];
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];

              }
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
