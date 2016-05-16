//
//  Enemy.m
//  Game_plane_1
//
//  Created by tarena001 on 16/4/15.
//  Copyright © 2016年 Tree. All rights reserved.
//

#import "Enemy.h"
#import "imageUtils.h"
@implementation Enemy

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        int type = arc4random()%4 + 1;
        self.image = [imageUtils enemyImageWithLevel:type];
        self.HP = type*2;
        int size = self.bounds.size.width + 5*type;
        self.frame =CGRectMake(arc4random()%414,-size, size,size);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
