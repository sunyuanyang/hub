//
//  NaviGation.m
//  Unity-iPhone
//
//  Created by cty on 14-9-22.
//
//

#import "NaviGation.h"
NSString * const kinUrl = @"hello";
@implementation NaviGation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame title:(NSString *)title leftButtonType:(ButtonType)lType lDescription:(NSString *)leftDescription completionLeft:(CLICKLEF)clickL rightButtonType:(ButtonType)rType RDescription:(NSString *)RightDescription completionRight:(CLICKRIGHT) clickR
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftClicks = clickL;
        self.rightClicks = clickR;
        
        /*********************************
         背景图片
         *********************************/
        UIImageView * backGround = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        backGround.userInteractionEnabled = YES;
        [self addSubview:backGround];
        NSString * path = [[NSBundle mainBundle] pathForResource:@"daohanglan@2x.png" ofType:nil];
        backGround.image = [UIImage imageWithContentsOfFile:path];
        
        /*********************************
         左边按键布局
         *********************************/
        self.left = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:self.left];
        [self.left addTarget:self action:@selector(clickLeftAction) forControlEvents:UIControlEventTouchUpInside];
        //左边按键样式，箭头或者图片
        if (lType == TextType) {
            self.left.frame = CGRectMake(0, 20, 64, 44);
            self.left.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.left setTitle:@"取消" forState:UIControlStateNormal];
            [self.left setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            self.left.frame = CGRectMake(0, 20, 44, 44);
            NSString * arrow = [[NSBundle mainBundle] pathForResource:leftDescription ofType:nil];
                        [self.left setImage:[UIImage imageWithContentsOfFile:arrow] forState:UIControlStateNormal];
        }
        
        /*********************************
         右边按键布局
         *********************************/
        self.right = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.right];
        [self.right addTarget:self action:@selector(clickRightAction) forControlEvents:UIControlEventTouchUpInside];
        //左边按键样式，箭头或者图片
        if (rType == TextType) {
            self.right.frame = CGRectMake(self.frame.size.width - 64, 20, 64, 44);
            self.right.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.right setTitle:@"下一步" forState:UIControlStateNormal];
            [self.right setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            self.right.frame = CGRectMake(self.frame.size.width - 44, 20, 44, 44);
            NSString * arrow = [[NSBundle mainBundle] pathForResource:RightDescription ofType:nil];
            [self.right setImage:[UIImage imageWithContentsOfFile:arrow] forState:UIControlStateNormal];
        }
        UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, self.frame.size.width - 160, 44)];
        titleL.font = [UIFont boldSystemFontOfSize:18];
        titleL.userInteractionEnabled = YES;
        titleL.text = title;
        [self addSubview:titleL];
        titleL.textAlignment = NSTextAlignmentCenter;
        titleL.textColor = [UIColor whiteColor];
        
    }
    return self;
}
-(void)clickRightAction
{
    self.rightClicks();
}
-(void)clickLeftAction
{
    self.leftClicks();
}

-(void)setRightColor:(ButtonColor)bColor
{
    if (bColor == SelectType) {
        self.right.alpha = 1;
        [self.right addTarget:self action:@selector(clickRightAction) forControlEvents:UIControlEventTouchUpInside];
    }else{
        self.right.alpha = 0.5;
        [self.right removeTarget:self action:@selector(clickRightAction) forControlEvents:UIControlEventTouchUpInside];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
