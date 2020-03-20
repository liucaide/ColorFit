//Created  on 2020/3/18 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */






#import <UIKit/UIKit.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CDColorFit)
+ (instancetype)colorWithLight:(UIColor*)light;
+ (instancetype)colorWithLight:(UIColor*)light dark:(UIColor*)dark;
@end

static inline void fit_swizzling(Class cla, SEL original, SEL swizzled) {
    Method originalMethod = class_getInstanceMethod(cla, original);
    Method swizzledMethod = class_getInstanceMethod(cla, swizzled);
    BOOL didAddMethod = class_addMethod(cla, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cla, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

NS_ASSUME_NONNULL_END
