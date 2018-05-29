//
//  utilityDrawViewHelper.m
//
//  Created by shipanpan on 16/2/26.
//
//  功用:添加常用view

#import "utilityDrawViewHelper.h"
#import <CoreText/CoreText.h> //label两端对齐  kCTKernAttributeName
//#import "Utilities.h"

@implementation utilityDrawViewHelper

+ (CGSize)getTheSizeWithString:(NSString *)str
                          font:(UIFont *)font
                       maxSize:(CGSize)maxSize{
    if (str && str.length > 0) {
        NSDictionary *dict = @{NSFontAttributeName : font};
        
        CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
        return size;
    } else {
        return CGSizeZero;
    }
    
}

+ (CGSize)getTheParagraphSizeWithString:(NSString *)string
                                andFont:(UIFont *)font
                            lineSpacing:(CGFloat)lineSpacing
                             andMaxSize:(CGSize)maxSize
{
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentLeft;
    [paragraph setLineSpacing:lineSpacing]; // 调整行间距
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, paragraph, NSParagraphStyleAttributeName, nil];
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:Nil].size;
    
}

+ (NSString *)phoneNumberFormat:(NSString*)phoneNumStr
{
    //4008-0000-0000去除空格
    NSUInteger numberOfOccurrences = [[phoneNumStr componentsSeparatedByString:@"-"] count] - 1;
    
    if (numberOfOccurrences >= 2) {
        phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    //转(或等价)处理
    phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@"-" withString:@","];
    phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@"转" withString:@","];
    phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@"，" withString:@","];
    
    //消除400 转 8(之间的空格)
    phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString * formatPhoneStr = [NSString stringWithFormat:@"telprompt://%@",phoneNumStr];
    return formatPhoneStr;
}
@end



#pragma mark -----------------------------
#pragma mark UIlabel辅助添加方法
@implementation utilityDrawViewHelper (UILabelHelper)

//自定义全部参数
+ (UILabel *)labelWithFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment numberOfLine:(NSInteger)numbers superView:(UIView *)superView
{
    UILabel * label = nil;
    
    if (CGRectIsNull(rect)) {
        label = [[UILabel alloc] init];
    }else{
        label = [[UILabel alloc] initWithFrame:rect];
    }
    
    [label setText:text];
    [label setFont:font];
    
    if (!(tag==0 || tag<0 ||!tag))
    {
        [label setTag:tag];
    }
    
    [label setTextColor:color];
    
    //统一iOS不同版本下的背景色
    if (backColor)
    {
        [label setBackgroundColor:backColor];
    }else
    {
        [label setBackgroundColor:[UIColor clearColor]];
    }
    
    [label setTextAlignment:alignment];
    [label setNumberOfLines:numbers];
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    [superView addSubview:label];
    
    return label;
}
//label:定义中间的间距lineSpace
+ (UILabel *)labelWithFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment numberOfLine:(NSInteger)numbers lineSpace:(CGFloat)lineSpace superView:(UIView *)superView {
    UILabel * label = nil;
    
    if (CGRectIsNull(rect)) {
        label = [[UILabel alloc] init];
    }else{
        label = [[UILabel alloc] initWithFrame:rect];
    }
    
    [label setText:text];
    [label setFont:font];
    
    if (!(tag==0 || tag<0 ||!tag))
    {
        [label setTag:tag];
    }
    
    [label setTextColor:color];
    
    //统一iOS不同版本下的背景色
    if (backColor)
    {
        [label setBackgroundColor:backColor];
    }else
    {
        [label setBackgroundColor:[UIColor clearColor]];
    }
    
    [label setTextAlignment:alignment];
    [label setNumberOfLines:numbers];
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    paragraphStyle.lineSpacing = lineSpace;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    //设置字体所在区域背景颜色
//    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(50, 20)];
    label.attributedText = attributedString;
    
    [superView addSubview:label];
    
    return label;
}

//单行label，两端对齐
+ (UILabel *)labelWithFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag superView:(UIView *)superView {
    
    
    UILabel * label = nil;
    
    if (CGRectIsNull(rect)) {
        label = [[UILabel alloc] init];
    }else{
        label = [[UILabel alloc] initWithFrame:rect];
    }
    
    [label setText:text];
    [label setFont:font];
    
    if (!(tag==0 || tag<0 ||!tag))
    {
        [label setTag:tag];
    }
    
    [label setTextColor:color];
    
    //统一iOS不同版本下的背景色
    if (backColor)
    {
        [label setBackgroundColor:backColor];
    }else
    {
        [label setBackgroundColor:[UIColor clearColor]];
    }
    
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    
    if (text.length > 0) {
        CGSize textSize = [self getTheSizeWithString:text font:font maxSize:CGSizeMake(rect.size.width, rect.size.height)];
        
        CGFloat margin = (rect.size.width - textSize.width) / (text.length - 1);
        NSNumber *number = [NSNumber numberWithFloat:margin];
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
        [attributeString addAttribute:(id)kCTKernAttributeName value:number range:NSMakeRange(0, text.length - 1)];
        
        label.attributedText = attributeString;
    }
    
    [superView addSubview:label];
    
    return label;
}
////添加富文本label，attributed：NSDictionary [subText:[textColor:textFont]]
+ (UILabel *)attributedlabelWithFrame:(CGRect)frame
                                 Text:(NSString *)text
                            Alignment:(NSTextAlignment *)alignment
                                 Font:(UIFont *)font
                                Color:(UIColor *)color
                              LineNum:(NSInteger)lineNum
                            superView:(UIView *)superView
                    subTextAttributed:(NSDictionary *)attributed {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = *(alignment);
    label.font = font;
    label.numberOfLines = lineNum;
    label.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString * attString = [[NSMutableAttributedString alloc]initWithString:text];
    for (NSString *subText in attributed.allKeys) {
        NSDictionary *dic = [attributed objectForKey:subText];
        NSRange range = [text rangeOfString:subText];
        UIColor *textColor = [dic.allKeys objectAtIndex:0];
        [attString addAttribute:NSForegroundColorAttributeName value:textColor range:range];
        UIFont *font = [dic.allValues objectAtIndex:0];
        [attString addAttribute:NSFontAttributeName value:font range:range];
    }
    label.attributedText = attString;
    return label;
}

@end


#pragma mark -----------------------------
#pragma mark UIlabel辅助添加方法,自适应布局
@implementation utilityDrawViewHelper (AdaptLabelHelper)

//1
+ (UILabel *)addAdaptLabelInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward labelRect:(CGRect *)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [utilityDrawViewHelper addAdaptLabelInView:view fromPoint:point fromeLeftToRight:forward labelRect:rect text:text font:font textColor:color backgroundColor:backColor tag:0];
}

//2
+ (UILabel *)addAdaptLabelInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward labelRect:(CGRect *)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag
{
    CGSize size = [utilityDrawViewHelper getTheSizeWithString:text font:font maxSize:CGSizeZero];
    
    CGRect rectCount;
    if (forward) {
        rectCount = CGRectMake(point.x, point.y, size.width, size.height);
    }else
    {
        rectCount = CGRectMake(point.x-size.width, point.y, size.width, size.height);
    }
    
    if (rect) {
        *rect = rectCount;
    }
    
    UILabel * label = [[UILabel alloc] initWithFrame:rectCount];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:text];
    [label setFont:font];
    [label setTextColor:color];
    [label setTag:tag];
    [view addSubview:label];
    
    return label;
}
@end


@implementation utilityDrawViewHelper (UIButtonHelper)

//添加事件
+ (UIButton *)buttonWithframe:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents superView:(UIView *)superView
{
    
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundColor:backColor];
    
    if (!(tag==0 || tag<0 ||!tag)) {
        [button setTag:tag];
    }
    [superView addSubview:button];
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}
//加边框参数
+ (UIButton *)buttonWithFrame:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius superView:(UIView *)superView {
    UIButton *button = [utilityDrawViewHelper buttonWithFrame:rect title:title font:font titleColor:color backgroundColor:backColor tag:tag addTarget:target action:action forControlEvents:controlEvents superView:superView];
    
    if (borderWidth > 0) {
        button.layer.borderWidth = borderWidth;
        button.layer.borderColor = borderColor.CGColor;
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
    }
    button.layer.masksToBounds = YES;
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}
@end


#pragma mark ------------
#pragma mark 自动button
@implementation utilityDrawViewHelper (AdaptButtonHelper)

//1增加背景色,nil为透明
+ (UIButton *)addAdaptButtonInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward buttonRect:(CGRect *)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [utilityDrawViewHelper addAdaptButtonInView:view fromPoint:point fromeLeftToRight:forward buttonRect:rect title:title font:font titleColor:color backgroundColor:backColor tag:0];
}

//2增加tag值,为空时传0或-1
+ (UIButton *)addAdaptButtonInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward buttonRect:(CGRect *)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag
{
    CGSize size = [utilityDrawViewHelper getTheSizeWithString:title font:font maxSize:CGSizeZero];
    CGRect rectCount;
    if (forward) {
        rectCount = CGRectMake(point.x, point.y, size.width, size.height);
    }else
    {
        rectCount = CGRectMake(point.x-size.width, point.y, size.width, size.height);
    }
    
    if (rect) {
        *rect = rectCount;
    }
    
    UIButton *button = [[UIButton alloc]initWithFrame:rectCount];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundColor:backColor];
    
    if (!(tag==0 || tag<0 ||!tag)) {
        [button setTag:tag];
    }
    [view addSubview:button];
    
    return button;
}

//3添加事件
+ (UIButton *)addAdaptButtonInView:(UIView *)view fromPoint:(CGPoint)point fromeLeftToRight:(BOOL)forward buttonRect:(CGRect *)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *button = [utilityDrawViewHelper addAdaptButtonInView:view fromPoint:point fromeLeftToRight:forward buttonRect:rect title:title font:font titleColor:color backgroundColor:backColor tag:tag];
    [button addTarget:self action:action forControlEvents:controlEvents];
    return button;
}

@end

