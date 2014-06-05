//
//  EBSData.h
//  8bitStatus
//
//  Created by MadArkitekt on 5/21/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EBSColorVC.h"
#import "EBSFacesVC.h"
#import "EBSPostVC.h"
@interface EBSData : NSObject

+ (EBSData *) mainData;

@property (nonatomic) NSInteger chosenColor;

@property (nonatomic) NSString *chosenFace;

- (NSArray *)getFaces;


@end
