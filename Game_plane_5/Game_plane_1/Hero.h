//
//  Hero.h
//  Game_plane_1
//
//  Created by tarena001 on 16/4/15.
//  Copyright © 2016年 Tree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Hero : UIImageView
/**子弹视图*/
@property(nonatomic,strong)UIImage *bulletImage;
@property(nonatomic,strong)NSMutableArray *bullets;
@property(nonatomic,strong)UIImageView *hpIV;
@property(nonatomic)int HP;

@end
