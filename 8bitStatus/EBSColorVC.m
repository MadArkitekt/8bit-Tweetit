//
//  EBSColorVC.m
//  8bitStatus
//
//  Created by MadArkitekt on 5/20/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "EBSColorVC.h"

@interface EBSColorVC ()

@end

@implementation EBSColorVC
{
    UIImageView*squareSelect;
    UIView *colorsView;
    NSArray *colors;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
   colorsView = [[UIView alloc] initWithFrame:self.view.frame];
    
    colorsView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:colorsView];
    
    
    squareSelect = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares"]];
    [squareSelect setFrame:CGRectMake(57, 138, 64, 64)];
    [colorsView addSubview:squareSelect];
    
    for (int row=0; row < 3; row++)
    {
        for (int col=0; col < 3; col++)
        {
            colors = [[NSArray alloc] initWithObjects:@"yellow",@"red",@"blue",@"peach",@"pink",@"green",@"orange",@"purple",@"litegreen",nil];
            
            int boxWidth = 48;
            int boxHeight = boxWidth;
            int boxX = (boxWidth * 1.5*col) +65;
            int boxY =  (boxHeight * 1.5*row) +146;
            NSInteger index = (row * 3 + col);
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(boxX, boxY, boxWidth, boxHeight)];
            button.backgroundColor = [UIColor clearColor];
            [button setImage:[UIImage imageNamed:colors[index]] forState:UIControlStateNormal];
            [button setTag:index];
            [button addTarget:self action:@selector(moveSelector:) forControlEvents:UIControlEventTouchUpInside];
            [colorsView addSubview:button];
            
        }
    }
    UIButton *forwardArrow = [[UIButton alloc] initWithFrame:CGRectMake(155, 510, 24, 40)];
    [forwardArrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [forwardArrow addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    [colorsView addSubview:forwardArrow];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)moveSelector:(UIButton *)sender
{
    [[EBSData mainData] setChosenColor:sender.tag];
    [squareSelect setFrame:CGRectMake(sender.frame.origin.x - 8, sender.frame.origin.y - 8, sender.frame.size.width + 16, sender.frame.size.height + 16)];
    NSLog(@"Selector Position: %f",squareSelect.frame.origin.x);
}
- (void)nextPage
{
    [self.navigationController pushViewController:[[EBSFacesVC alloc] initWithNibName:nil bundle:nil] animated:YES];
}

@end
