//
//  EBSData.m
//  8bitStatus
//
//  Created by MadArkitekt on 5/21/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "EBSData.h"

@implementation EBSData
{
    
}
+ (EBSData *)mainData
{
    static dispatch_once_t create;
    static EBSData *singleton;
    
    dispatch_once(&create, ^{
        singleton = [[EBSData alloc] init];
    });
    return singleton;
}


-(NSArray *)getFaces
{
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
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
        }
            break;
            
            
            
        case 3:
        {
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
        }
            break;
            
            
            
        case 4:
        {
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
        }
            break;
            
            
            
        case 5:
        {
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
        }
            break;
            
            
            
        case 6:
        {
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
        }
            break;
            
            
            
        case 7:
        {
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
        }
            break;
            
            
            
        case 8:
        {
            NSArray  *red = [[NSArray alloc] initWithObjects:@"0redface",@"1redface",@"2redface",@"3redface",@"4redface",@"5redface",@"6redface",@"7redface",@"8redface",nil];
            return red;
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


@end
