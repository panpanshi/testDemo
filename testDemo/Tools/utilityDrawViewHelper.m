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
                      fontSize:(CGFloat)fontSize
                       maxSize:(CGSize)maxSize{
    return [utilityDrawViewHelper getTheSizeWithString:str font:[UIFont systemFontOfSize:fontSize] maxSize:maxSize];
}

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
//1增加背景色,nil为透明
+ (UILabel *)addLabelInView:(UIView *)view frame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [utilityDrawViewHelper addLabelInView:view Frame:rect text:text font:font textColor:color backgroundColor:backColor tag:0 alignment:NSTextAlignmentLeft numberOfLine:1];
}

//2增加tag值,为空时传0
+ (UILabel *)addLabelInView:(UIView *)view frame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag
{
    return [utilityDrawViewHelper addLabelInView:view Frame:rect text:text font:font textColor:color backgroundColor:backColor tag:tag alignment:NSTextAlignmentLeft numberOfLine:1];
}

//3增加aligenment
+ (UILabel *)addLabelInView:(UIView *)view Frame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment
{
    return [utilityDrawViewHelper addLabelInView:view Frame:rect text:text font:font textColor:color backgroundColor:backColor tag:tag alignment:alignment numberOfLine:1];
}


//4自定义全部参数
+ (UILabel *)addLabelInView:(UIView *)view Frame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment numberOfLine:(NSInteger)numbers
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
    [view addSubview:label];
    
    return label;
}

+ (UILabel *)addLabelInView:(UIView *)view Frame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment numberOfLine:(NSInteger)numbers subText:(NSString *)subText subTextColor:(UIColor *)subColor subTextFont:(UIFont *)subFont {
    
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
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    if (subText && ![subText isEqualToString:@""]) {
        NSRange range = [text rangeOfString:subText];
        if (range.location != NSNotFound) {
            NSDictionary *attributedDic = @{NSForegroundColorAttributeName:subColor, NSFontAttributeName:subFont};
            [attributedString addAttributes:attributedDic range:range];
        }
    }
    label.attributedText = attributedString;
    
    [view addSubview:label];
    
    return label;
    
}

+ (UILabel *)addLabelInView:(UIView *)view Frame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag alignment:(NSTextAlignment)alignment numberOfLine:(NSInteger)numbers lineSpace:(CGFloat)lineSpace {
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
    
    [view addSubview:label];
    
    return label;
}

+ (UILabel *)addLabelInView:(UIView *)view Frame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag {
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
    
    CGSize textSize = [self getTheSizeWithString:text font:font maxSize:CGSizeMake(rect.size.width, rect.size.height)];
    
    CGFloat margin = (rect.size.width - textSize.width) / (text.length - 1);
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeString addAttribute:(id)kCTKernAttributeName value:number range:NSMakeRange(0, text.length - 1)];
    
    label.attributedText = attributeString;
    
    [view addSubview:label];
    
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
//1增加背景色,nil为透明
+ (UIButton *)addButtonInView:(UIView *)view frame:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [utilityDrawViewHelper addButtonInView:view frame:rect title:title font:font titleColor:color backgroundColor:backColor tag:0];
}


//2自定义全部参数
+ (UIButton *)addButtonInView:(UIView *)view frame:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
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
+ (UIButton *)addButtonInView:(UIView *)view frame:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *button = [utilityDrawViewHelper addButtonInView:view frame:rect title:title font:font titleColor:color backgroundColor:backColor tag:tag];
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}
//4加边框参数
+ (UIButton *)addButtonInView:(UIView *)view frame:(CGRect)rect title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor tag:(NSInteger)tag addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius {
    UIButton *button = [utilityDrawViewHelper addButtonInView:view frame:rect title:title font:font titleColor:color backgroundColor:backColor tag:tag];
    
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




//可以设定label内容位置的自定义label
@implementation SouFunESFEdgeLabel //下面三个方法用来初始化edgeInsets

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame])
    {
        self.edgeInsets = UIEdgeInsetsMake(4, 10, 4, 10);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.edgeInsets = UIEdgeInsetsMake(4, 10, 4, 10);
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.edgeInsets = UIEdgeInsetsMake(4, 10, 4, 10);
}

// 修改绘制文字的区域，edgeInsets增加bounds
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    /* 调用父类该方法 注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域 */
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}

//绘制文字
- (void)drawTextInRect:(CGRect)rect {
    //令绘制区域为原始区域，增加的内边距区域不绘制
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}
@end
