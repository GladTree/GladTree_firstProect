//
//  Hero.m
//  Game_plane_1
//
//  Created by tarena001 on 16/4/15.
//  Copyright © 2016年 Tree. All rights reserved.
//

#import "Hero.h"
#import "imageUtils.h"
@implementation Hero
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.HP = 5;
        self.bullets = [NSMutableArray array];
        //获取英雄的图片
        self.image = [imageUtils heroImage];
        //获取子弹的图片
        self.bulletImage = [imageUtils bulletImage];
        
        [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(addBullet) userInfo:nil repeats:YES];
        
        self.hpIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 40, self.bounds.size.width, 1)];
        self.hpIV.backgroundColor = [UIColor redColor];
        UIImageView *bgHPIV = [[UIImageView alloc]initWithFrame:self.hpIV.frame];
        bgHPIV.backgroundColor = [UIColor blackColor];
        [self addSubview:bgHPIV];
        [self addSubview:self.hpIV];
    }
    return self;
}
-(void)setHP:(int)HP
{
    _HP = HP;
    self.hpIV.frame = CGRectMake(0, 40, self.bounds.size.width*(HP/5.0), 1);
}
-(void)addBullet
{
    UIImageView *bulletIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    bulletIV.image = self.bulletImage;
    bulletIV.center = CGPointMake(self.center.x, self.center.y-15);
    [self.superview addSubview:bulletIV];
    [self.bullets addObject:bulletIV];
}
@end
