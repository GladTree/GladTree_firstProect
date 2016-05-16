//
//  ViewController.m
//  Game_plane_1
//
//  Created by tarena001 on 16/4/15.
//  Copyright © 2016年 Tree. All rights reserved.
//

#import "ViewController.h"
#import "imageUtils.h"
#import "Hero.h"
#import "Enemy.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *allbgIVS;
@property(nonatomic,strong)NSMutableArray *enemys;
@property(nonatomic,strong)Hero *hero;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)int score;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.allbgIVS = [NSMutableArray array];
    self.enemys = [NSMutableArray array];
    [self initbgIVS];
    //移动背景
    [NSTimer scheduledTimerWithTimeInterval:1.0 / 30 target:self selector:@selector(moveAction) userInfo:nil repeats:YES];
    self.hero = [[Hero alloc]initWithFrame:CGRectMake(150, 600, 60, 40)];
    [self.view addSubview:self.hero];
   self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 / 2 target:self selector:@selector(addEnemy) userInfo:nil repeats:YES];
}

-(void)moveAction
{//移动背景
    for (UIImageView *bgVC in self.allbgIVS) {
        bgVC.frame = CGRectMake(0, bgVC.frame.origin.y+1, self.view.bounds.size.width, self.view.bounds.size.height);
        if (bgVC.frame.origin.y >= self.view.bounds.size.height) {
            bgVC.frame = CGRectMake(0, -self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
        }
    }
    //遍历子弹并移动子弹
    for (UIImageView *bulletIV in self.hero.bullets) {
        bulletIV.center =  CGPointMake(bulletIV.center.x, bulletIV.center.y - 3);
        //判断子弹移除界面
        if (bulletIV.center.y <= 0) {
            [bulletIV removeFromSuperview];
            [self.hero.bullets removeObject:bulletIV];
            break;
        }
    }
    
    for (Enemy *e in self.enemys) {
        e.center = CGPointMake(e.center.x, e.center.y+2);
        if (e.center.y >= self.view.bounds.size.height) {
            [e removeFromSuperview];
            [self.enemys removeObject:e];
            break;
        }
    }
    for (Enemy *e in self.enemys) {
        for (UIImageView *bulletIV in self.hero.bullets) {
            if (CGRectIntersectsRect(bulletIV.frame, e.frame)) {
                e.HP--;
                if (e.HP <=0) {
                    [e removeFromSuperview];
                    [self.enemys removeObject:e];
                }
                [bulletIV  removeFromSuperview];
                [self.hero.bullets removeObject:bulletIV];
                return;
            }
        }
    }
    for (Enemy *e in self.enemys) {
        if (CGRectContainsPoint(e.frame, self.hero.center)) {
            self.hero.HP--;
            if (self.hero.HP <=0) {
                [self gameOver];
            }
            
            [e removeFromSuperview];
            [self.enemys removeObject:e];
            break;
        }
    }
}
-(void)gameOver
{
    [self.hero removeFromSuperview];
    [self.timer invalidate];
    UIImageView *gameOverIV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    gameOverIV.image = [UIImage imageNamed:@"gameover.png"];
    [self.view addSubview:gameOverIV];
}
-(void)addEnemy
{
    Enemy *e = [[Enemy alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    [self.view addSubview:e];
    [self.enemys addObject:e];
}
//初始化
-(void)initbgIVS
{
    for (int i = 0;  i < 2; i++) {
        UIImageView *bgiv = [[UIImageView alloc]initWithFrame:CGRectMake(0,i * -self.view.bounds.size.height, self.view.bounds.size.width,self.view.bounds.size.height)];
        bgiv.image = [UIImage imageNamed:@"img_bg_level_4"];
        [self.allbgIVS addObject:bgiv];
        [self.view addSubview:bgiv];
    }
}
//获取用户触摸屏幕的坐标
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.hero.center = point;
}
@end
