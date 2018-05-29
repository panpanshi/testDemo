//
//  utilityDrawViewHelper.h
//
//  Created by shipanpan on 16/2/26.
//
// 功用:添加常用view

#import <UIKit/UIKit.h>


//视图辅助类
#define SYSFONT(fontsize) [UIFont systemFontOfSize:fontsize]
#define UTICOLOR(color) [UtilityHelper colorWithHexString:color]
//自动布局相关
#define PREPCONSTRAINTS(VIEW) [VIEW setTranslatesAutoresizingMaskIntoConstraints:NO]
#define CONSTRAINTS(FORMAT, VIEWBINDINGS) [NSLayoutConstraint constraintsWithVisualFormat:(FORMAT) options:0 metrics:nil views:VIEWBINDINGS]

#define iphoneBottomSpace ((iPhoneX) ? 34.0 : 0.0)

@interface utilityDrawViewHelper : NSObject

/*
 *返回实际范围,maxSize传CGSizeZero
 */
+ (CGSize)getTheSizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;
/**
 *设置行间距
 */
+ (CGSize)getTheParagraphSizeWithString:(NSString *)string
                                andFont:(UIFont *)font
                            lineSpacing:(CGFloat)lineSpacing
                             andMaxSize:(CGSize)maxSize;


//电话格式化
+ (NSString *)phoneNumberFormat:(NSString*)phoneNumStr;
@end

#pragma mark -----------------------------
#pragma mark UIlabel辅助添加方法
@interface utilityDrawViewHelper (UILabelHelper)
/**
 *基础参数+tag+alignment+numberofline;
 *frame为空时传CGRectNul;
 *背景色nil时,为透明;
 *tag值,默认需传0;
 *alignment,默认需传NSTextAlignmentLeft(即0);
 *numberOfLine,默认需传1(即单行);
 */
+ (UILabel *)labelWithFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment numberOfLine:(NSInteger)numbers superView:(UIView *)superView;

/**
 *基础参数+tag+alignment+numberofline+lineSpace;
 *frame为空时传CGRectNul;
 *背景色nil时,为透明;
 *tag值,默认需传0;
 *alignment,默认需传NSTextAlignmentLeft(即0);
 *numberOfLine,默认需传1(即单行);
 *lineSpace,行间距
 */
+ (UILabel *)labelWithFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment numberOfLine:(NSInteger)numbers lineSpace:(CGFloat)lineSpace superView:(UIView *)superView;
/**
 * attributeLabel:
 *
 */

/**
 *基础参数+tag+numberofline 单行label两端对齐;
 *frame为空时传CGRectNul;
 *背景色nil时,为透明;
 *tag值,默认需传0;
 *
 */
+ (UILabel *)labelWithFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag superView:(UIView *)superView;

/**
 基础参数，subtext的参数 添加富文本label，attributed：NSDictionary [subText:[textColor:textFont]]
 */
+ (UILabel *)attributedlabelWithFrame:(CGRect)frame Text:(NSString *)text Alignment:(NSTextAlignment *)alignment Font:(UIFont *)font Color:(UIColor *)color LineNum:(NSInteger)lineNum superView:(UIView *)superView subTextAttributed:(NSDictionary *)attributed;


@end

#pragma mark -----------------------------
#pragma mark UIlabel辅助添加方法,自适应布局
@interface utilityDrawViewHelper (AdaptLabelHelper)
/**
 *1/2;
 *基础参数;
 *fromeLeftToRight YES:居左添加;NO:居右添加;
 *rect,返回label的Rect;
 *背景色nil时,为透明;
 */
+ (UILabel *)addAdaptLabelInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward labelRect:(CGRect *)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor;

/**
 *2/2;
 *基础参数+tag;
 *fromeLeftToRight YES:居左添加;NO:居右添加;
 *rect,返回label的Rect;
 *背景色nil时,为透明;
 *增加tag值,默认需传0;
 */
+ (UILabel *)addAdaptLabelInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward labelRect:(CGRect *)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag;

@end

#pragma mark ------------
#pragma mark UIButton 辅助添加方法

@interface utilityDrawViewHelper (UIButtonHelper)

/**
 *基础参数+tag+事件;
 *frame为空时传CGRectNul;
 *背景色nil时,为透明;
 *tag值,默认需传0;
 */
+ (UIButton *)buttonWithFrame:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents superView:(UIView *)superView;

/**
 *基础参数+tag+事件+borderColor+borderWidth+cornerRadius;
 *frame为空时传CGRectNul;
 *背景色nil时,为透明;
 *tag值,默认需传0;
 *borderColor，边框颜色
 *borderWidth，边框宽度
 *cornerRadius，圆角
 */
+ (UIButton *)buttonWithFrame:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius superView:(UIView *)superView;

@end

#pragma mark ------------
#pragma mark 自动button
@interface utilityDrawViewHelper (AdaptUIButtonHelper)

/**
 *1/3;
 *基础参数;
 *fromeLeftToRight YES:居左添加;NO:居右添加;
 *rect,返回button的Rect;
 *背景色nil时,为透明;
 */
+ (UIButton *)addAdaptButtonInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward buttonRect:(CGRect *)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor;

/**
 *2/3;
 *基础参数+tag;
 *fromeLeftToRight YES:居左添加;NO:居右添加;
 *rect,返回button的Rect;
 *背景色nil时,为透明;
 *tag值,默认需传0;
 */
+ (UIButton *)addAdaptButtonInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward buttonRect:(CGRect *)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag;

/**
 *3/3;
 *基础参数+tag+SEL;
 *fromeLeftToRight YES:居左添加;NO:居右添加;
 *rect,返回button的Rect;
 *背景色nil时,为透明;
 *tag值,默认需传0;
 */
+ (UIButton *)addAdaptButtonInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward buttonRect:(CGRect *)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
