//
//  NaviGation.h
//  Unity-iPhone
//
//  Created by cty on 14-9-22.
//
//

#import <UIKit/UIKit.h>

extern NSString * const kinUrl;
typedef void(^CLICKLEF)();
typedef void(^CLICKRIGHT)();
typedef NS_ENUM(NSInteger, ButtonType)
{
    TextType = 2,
    ImageType = 3
};
typedef NS_ENUM(NSInteger, ButtonColor)
{
    SelectType = 2,
    DisSelectType = 3
};
@interface NaviGation : UIView
@property(nonatomic, strong) UIButton * left;
@property(nonatomic, strong) UIButton *right;
@property(nonatomic, strong) CLICKLEF leftClicks;
@property(nonatomic, strong) CLICKRIGHT rightClicks;
- (id)initWithFrame:(CGRect)frame title:(NSString *)title leftButtonType:(ButtonType)lType lDescription:(NSString *)leftDescription completionLeft:(CLICKLEF)clickL rightButtonType:(ButtonType)rType RDescription:(NSString *)RightDescription completionRight:(CLICKRIGHT) clickR;
-(void)setRightColor:(ButtonColor)bColor;
@end
