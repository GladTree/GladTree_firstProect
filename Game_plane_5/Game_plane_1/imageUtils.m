//
//  imageUtils.m
//  Game_plane_1
//
//  Created by tarena001 on 16/4/15.
//  Copyright © 2016年 Tree. All rights reserved.
//

#import "imageUtils.h"

@implementation imageUtils
+(UIImage *)heroImage
{
    return [UIImage imageNamed:@"plane_red_1"];
}
+(UIImage *)bulletImage
{
    return [UIImage imageNamed:@"bullet_1"];
}
+(UIImage *)enemyImageWithLevel:(int)level
{
    switch (level) {
        case 1:
            return [UIImage imageNamed:@"plane_enemy_01"];
        case 2:
            return [UIImage imageNamed:@"plane_enemy_02"];
        case 3:
            return [UIImage imageNamed:@"plane_enemy_03"];
        case 4:
            return [UIImage imageNamed:@"plane_enemy_04"];
    }
    return nil;
}
@end
