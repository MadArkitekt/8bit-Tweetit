//
//  EBSData.m
//  8bitStatus
//
//  Created by MadArkitekt on 5/21/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "EBSData.h"
/*==========================================*/
@implementation EBSData
{
    
}
/*==========================================*/
+ (EBSData *)mainData
{
    static dispatch_once_t create;
    static EBSData *singleton;
    
    dispatch_once(&create, ^{
        singleton = [[EBSData alloc] init];
    });
    return singleton;
}
/*==========================================*/
-(NSArray *)getFaces
{
    
    //@"yellow",@"red",@"blue",@"peach",@"pink",@"green",@"orange",@"purple",@"litegreen"
    
    NSInteger i = [EBSData mainData].chosenColor;
    switch (i) {
        case 0:
        {
            NSArray  * yellow = [[NSArray alloc] initWithObjects:@"0yellowface",@"1yellowface",@"2yellowface",@"3yellowface",@"4yellowface",@"5yellowface",@"6yellowface",@"7yellowface",@"8yellowface", nil];
            return yellow;
        }
            break;
        case 1:
        {
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
        }
            break;
        case 2:
        {
            NSArray  *blue = [[NSArray alloc] initWithObjects:@"0blueFace",@"1blueFace",@"2blueFace",@"3blueFace",@"4blueFace",@"5blueFace",@"6blueFace",@"7blueFace",@"8blueFace",nil];
            return blue;
        }
            break;
        case 3:
        {
            NSArray  *peach = [[NSArray alloc] initWithObjects:@"0peachFace",@"1peachFace",@"2peachFace",@"3peachFace",@"4peachFace",@"5peachFace",@"6peachFace",@"7peachFace",@"8peachFace",nil];
            return peach;
        }
            break;
        case 4:
        {
            NSArray  *pink = [[NSArray alloc] initWithObjects:@"0pinkFace",@"1pinkFace",@"2pinkFace",@"3pinkFace",@"4pinkFace",@"5pinkFace",@"6pinkFace",@"7pinkFace",@"8pinkFace",nil];
            return pink;
        }
            break;
        case 5:
        {
            NSArray  *green = [[NSArray alloc] initWithObjects:@"0greenFace",@"1greenFace",@"2greenFace",@"3greenFace",@"4greenFace",@"5greenFace",@"6greenFace",@"7greenFace",@"8greenFace",nil];
            return green;
        }
            break;
        case 6:
        {
            NSArray  *orange = [[NSArray alloc] initWithObjects:@"0orangeFace",@"1orangeFace",@"2orangeFace",@"3orangeFace",@"4orangeFace",@"5orangeFace",@"6orangeFace",@"7orangeFace",@"8orangeFace",nil];
            return orange;
        }
            break;
        case 7:
        {
            NSArray  *purple = [[NSArray alloc] initWithObjects:@"0purpleFace",@"1purpleFace",@"2purpleFace",@"3purpleFace",@"4purpleFace",@"5purpleFace",@"6purpleFace",@"7purpleFace",@"8purpleFace",nil];
            return purple;
        }
            break;
        case 8:
        {
            NSArray  *litegreen = [[NSArray alloc] initWithObjects:@"0litegreenFace",@"1litegreenFace",@"2litegreenFace",@"3litegreenFace",@"4litegreenFace",@"5litegreenFace",@"6litegreenFace",@"7litegreenFace",@"8litegreenFace",nil];
            return litegreen;
        }
            break;
            
        default:
        {
            return nil;
            break;
        }
    }
    return nil;
}
/*==========================================*/

@end
