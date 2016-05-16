//
//  imageUtils.h
//  Game_plane_1
//
//  Created by tarena001 on 16/4/15.
//  Copyright © 2016年 Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface imageUtils : NSObject

+ (UIImage *)heroImage;
+ (UIImage *)bulletImage;
+ (UIImage *)enemyImageWithLevel:(int)level;
@end
