//Created  on 2020/3/18 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "CDColorFit.h"
#import "CDColorFitManager.h"

@implementation UILabel (CDColorFit)

+(void)load{
    Class class = [self class];
    fit_swizzling(class, @selector(init), @selector(swizzling_init));
    fit_swizzling(class, @selector(awakeFromNib), @selector(swizzling_awakeFromNib));
    fit_swizzling(class, @selector(setTextColor:), @selector(swizzling_setTextColor:));
}

- (instancetype)swizzling_init
{
    UILabel* __self = [self swizzling_init];
    [__self setTextColor:self.textColor];
    return __self;
}


-(void)swizzling_awakeFromNib{
    [self swizzling_awakeFromNib];
    [self setTextColor:self.textColor];
}

- (void)swizzling_setTextColor:(UIColor *)textColor {
    textColor = fit_color(textColor);
    [self swizzling_setTextColor:textColor];
}
@end


@implementation UIButton (CDColorFit)
+(void)load{
    Class class = [self class];
    fit_swizzling(class, @selector(init), @selector(swizzling_init));
    fit_swizzling(class, @selector(awakeFromNib), @selector(swizzling_awakeFromNib));
    fit_swizzling(class, @selector(setTitleColor:forState:), @selector(swizzling_setTitleColor:forState:));
}
- (instancetype)swizzling_init
{
    UIButton* __self = [self swizzling_init];
    [__self setTitleColor:self.titleLabel.textColor forState:self.state];
    return __self;
}
-(void)swizzling_awakeFromNib{
    [self swizzling_awakeFromNib];
    [self setTitleColor:self.titleLabel.textColor forState:self.state];
}

- (void)swizzling_setTitleColor:(UIColor *)color forState:(UIControlState)state{
    color = fit_color(color);
    [self swizzling_setTitleColor:color forState:state];
}
@end

@implementation UITextField (CDColorFit)
+(void)load{
    Class class = [self class];
    fit_swizzling(class, @selector(init), @selector(swizzling_init));
    fit_swizzling(class, @selector(awakeFromNib), @selector(swizzling_awakeFromNib));
    fit_swizzling(class, @selector(setTextColor:), @selector(swizzling_setTextColor:));
}

- (instancetype)swizzling_init
{
    UITextField* __self = [self swizzling_init];
    [__self setTextColor:self.textColor];
    return __self;
}

-(void)swizzling_awakeFromNib{
    [self swizzling_awakeFromNib];
    [self setTextColor:self.textColor];
}

- (void)swizzling_setTextColor:(UIColor *)textColor {
    textColor = fit_color(textColor);
    [self swizzling_setTextColor:textColor];
}
@end

@implementation UITextView (CDColorFit)
+(void)load{
    Class class = [self class];
    fit_swizzling(class, @selector(init), @selector(swizzling_init));
    fit_swizzling(class, @selector(awakeFromNib), @selector(swizzling_awakeFromNib));
    fit_swizzling(class, @selector(setTextColor:), @selector(swizzling_setTextColor:));
}

- (instancetype)swizzling_init
{
    UITextView* __self = [self swizzling_init];
    [__self setTextColor:self.textColor];
    return __self;
}

-(void)swizzling_awakeFromNib{
    [self swizzling_awakeFromNib];
    [self setTextColor:self.textColor];
}

- (void)swizzling_setTextColor:(UIColor *)textColor {
    textColor = fit_color(textColor);
    [self swizzling_setTextColor:textColor];
}
@end

@implementation UITableViewCell (CDColorFit)
+(void)load{
    Class class = [self class];
    fit_swizzling(class, @selector(initWithStyle:reuseIdentifier:), @selector(swizzling_initWithStyle:reuseIdentifier:));
    fit_swizzling(class, @selector(awakeFromNib), @selector(swizzling_awakeFromNib));
    fit_swizzling(class, @selector(setBackgroundColor:), @selector(swizzling_setBackgroundColor:));
    
}
- (instancetype)swizzling_initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    id __self = [self swizzling_initWithStyle:style reuseIdentifier:reuseIdentifier];
    [__self setBackgroundColor:[UIColor whiteColor]];
    return __self;
}

-(void)swizzling_awakeFromNib{
    [self swizzling_awakeFromNib];
    [self setBackgroundColor:[UIColor whiteColor]];
}


- (void)swizzling_setBackgroundColor:(UIColor *)backgroundColor {
    backgroundColor = fit_backgroundColor(backgroundColor);
    [self swizzling_setBackgroundColor:backgroundColor];
    [self.contentView setBackgroundColor:backgroundColor];
}
@end

/* UIView 覆盖太多，不建议，而应该特定进行*/
@implementation UIView (CDColorFit)
+(void)load{
    Class class = [self class];
    fit_swizzling(class, @selector(init), @selector(swizzling_initView));
    fit_swizzling(class, @selector(awakeFromNib), @selector(swizzling_awakeViewFromNib));
    fit_swizzling(class, @selector(setBackgroundColor:), @selector(swizzling_setBackgroundColor:));
}

- (instancetype)swizzling_initView
{
    UIView* __self = [self swizzling_initView];
    [__self setBackgroundColor:self.backgroundColor];
    return __self;
}

-(void)swizzling_awakeViewFromNib{
    [self swizzling_awakeViewFromNib];
    [self setBackgroundColor:self.backgroundColor];
    
}

- (void)swizzling_setBackgroundColor:(UIColor *)backgroundColor {
    backgroundColor = fit_backgroundColor(backgroundColor);
    [self swizzling_setBackgroundColor:backgroundColor];
}
@end


@implementation CALayer (CDColorFit)
+(void)load{
    Class class = [self class];
    fit_swizzling(class, @selector(init), @selector(swizzling_init));
    
    fit_swizzling(class, @selector(setBorderColor:), @selector(swizzling_setBorderColor:));
}

- (instancetype)swizzling_init
{
    CALayer* __self = [self swizzling_init];
    
    return __self;
}

-(instancetype)swizzling_initWithLayer:(id)layer{
    CALayer* __self = [self swizzling_initWithLayer:layer];
    
    return __self;
}

- (void)swizzling_setBorderColor:(CGColorRef)borderColor {
    UIColor *color = fit_backgroundColor([UIColor colorWithCGColor:borderColor]);
    [self swizzling_setBorderColor:color.CGColor];
}
@end

@implementation UIColor (Fit)


+ (instancetype)colorWithLight:(UIColor*)light {
    return [self colorWithLight:light dark:light];
}

+ (instancetype)colorWithLight:(UIColor*)light dark:(UIColor*)dark {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return dark;
            }
            return light;
        }];
    } else {
        return light;
    }
}


@end
