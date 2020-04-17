//Created  on 2020/4/17 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */





#import "Color-Swift.h"

@implementation UIViewController (CDColorFit)
    
+ (void)load {
    [UIViewController cd_methodSwizzling];
}

@end


@implementation UILabel (CDColorFit)
    
+ (void)load {
    [UILabel cd_methodSwizzlingLabel];
}

@end

@implementation UIView (CDColorFit)
    
+ (void)load {
    [UIView cd_methodSwizzling];
}

@end
