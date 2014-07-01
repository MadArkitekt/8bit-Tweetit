//
//  EBSFacesVC.m
//  8bitStatus
//
//  Created by MadArkitekt on 5/21/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "EBSFacesVC.h"

@interface EBSFacesVC ()

@end

@implementation EBSFacesVC
{
    UIImageView *squareSelect;
    UIView *facesView;
}
/*==========================================*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
/*==========================================*/
- (void)viewWillLayoutSubviews
{

    self.navigationController.navigationBarHidden = YES;

    facesView = [[UIView alloc] initWithFrame:self.view.frame];
    facesView.backgroundColor = [UIColor whiteColor];
    
    
    
    squareSelect = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares"]];
    squareSelect.frame = CGRectMake(57, 138, 64, 64);
    [self.view addSubview:squareSelect];
    ///NEED TO INCLUDE WAY TO SET A DEFAULT FACE VALUE
    for (int row=0; row < 3; row++)
    {
        for (int col=0; col < 3; col++)
        {
            
            int boxWidth = 48;
            int boxHeight = boxWidth;
            int boxX = (boxWidth * 1.5*col) +65;
            int boxY =  (boxHeight * 1.5*row) +146;
            NSInteger index = row * 3 + col;
            NSArray *faces = [[NSArray alloc]initWithArray:[[EBSData mainData]getFaces]];
            NSLog(@"%@", faces[index]);
            UIButton *button = [[UIButton alloc] init];
            [button setImage:[UIImage imageNamed:faces[index]] forState:UIControlStateNormal];
            [button setTitle:faces[index] forState:UIControlStateNormal];
            [button setFrame:CGRectMake(boxX, boxY, boxWidth, boxHeight)];
            
            
            [button addTarget:self action:@selector(moveSelector:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
            
        }
    }

    UIButton *forwardArrow = [[UIButton alloc] initWithFrame:CGRectMake(172.5, 510, 24, 40)];
    [forwardArrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [forwardArrow addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forwardArrow];
    
    UIButton *reverseArrow = [[UIButton alloc] initWithFrame:CGRectMake(122.5, 510, 24, 40)];
    [reverseArrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    reverseArrow.transform = CGAffineTransformMakeRotation(M_PI);
    [reverseArrow addTarget:self action:@selector(previousPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reverseArrow];
    
}
/*==========================================*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
/*==========================================*/
- (void)moveSelector:(UIButton *)sender
{
    [EBSData mainData].chosenFace = sender.titleLabel.text;
    
    NSLog(@"%@",[EBSData mainData].chosenFace);

    [squareSelect setFrame:CGRectMake(sender.frame.origin.x - 8, sender.frame.origin.y - 8, sender.frame.size.width + 16, sender.frame.size.height + 16)];
}
/*==========================================*/
-(void)nextPage
{
    [self.navigationController pushViewController:[[EBSPostVC alloc]initWithNibName:nil bundle:nil] animated:YES];
}
/*==========================================*/
- (void)previousPage
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*==========================================*/
- (BOOL)prefersStatusBarHidden {return YES;};
/*==========================================*/

@end
