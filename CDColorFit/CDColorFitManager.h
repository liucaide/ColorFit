//Created  on 2020/3/20 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 * 这里对老项目中已有的颜色进行管理
 * 不管原来的是什么颜色，需要修改的进行修改
 * 在 ColorFitManager
 * 比如 原来 的 black
 * 适配后：
 * 现在需要 light: #333333 dark：白色
 */




#ifndef CDColorFitManager_h
#define CDColorFitManager_h
#import <UIKit/UIKit.h>
#pragma mark ----- 颜色变更，在这里设置需要变更的颜色
static inline UIColor * fit_color(UIColor *color){
    if ([color.description containsString:@"UIDynamicSystemColor"]) {
        // 如果当前已经是系统动态颜色，不做更改
        return color;
    }
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    CGFloat a = 0;
    BOOL isGet = [color getRed:&r green:&g blue:&b alpha:&a];
    if (!isGet) { return color; }
    if (r == 0 && g == 0 && b == 0) {
        //black
        return [[UIColor colorWithLight:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:a] dark:UIColor.whiteColor] colorWithAlphaComponent:a];
    }
    if (r == 0 && g == 128.0/255.0 && b == 0) {
        //green
        return [[UIColor colorWithLight:[UIColor greenColor] dark:UIColor.greenColor] colorWithAlphaComponent:a];
    }
    if (r == 1 && g == 1 && b == 0) {
        //yellow
        return [[UIColor colorWithLight:[UIColor yellowColor] dark:UIColor.orangeColor] colorWithAlphaComponent:a];
    }
    if (r == 0 && g == 0 && b == 1) {
        //blue
        return [[UIColor colorWithLight:[UIColor blueColor] dark:UIColor.purpleColor] colorWithAlphaComponent:a];
    }
    if (r == 1 && g == 0 && b == 0) {
        //red
        return [[UIColor colorWithLight:[UIColor redColor] dark:UIColor.brownColor] colorWithAlphaComponent:a];
    }
    if (r == 0.2 && g == 0.2 && b == 0.2) {
        return [[UIColor colorWithLight:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:a] dark:UIColor.whiteColor] colorWithAlphaComponent:a];
    }
    if (r == 1 && g == 1 && b == 1) {
        return [[UIColor colorWithLight:UIColor.whiteColor dark:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:a]] colorWithAlphaComponent:a];
    }
    return color;
}

#pragma mark ----- 颜色变更，在这里设置需要变更的颜色
static inline UIColor * fit_backgroundColor(UIColor *color){
    if ([color.description containsString:@"UIDynamicSystemColor"]) {
        // 如果当前已经是系统动态颜色，不做更改
        return color;
    }
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    CGFloat a = 0;
    BOOL isGet = [color getRed:&r green:&g blue:&b alpha:&a];
    if (!isGet) { return color; }
    if (r == 0 && g == 0 && b == 0) {
        return [[UIColor colorWithLight:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:a] dark:UIColor.whiteColor] colorWithAlphaComponent:a];
    }
    if (r == 0.2 && g == 0.2 && b == 0.2) {
        return [[UIColor colorWithLight:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:a] dark:UIColor.whiteColor] colorWithAlphaComponent:a];
    }
    if (r == 240.0/255.0 && g == 240.0/255.0 && b == 240.0/255.0) {
        return [[UIColor colorWithLight:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:a] dark:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:a]] colorWithAlphaComponent:a];
    }
    if (r == 211.0/255.0 && g == 211.0/255.0 && b == 211.0/255.0) {
        return [[UIColor colorWithLight:[UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:a] dark:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:a]] colorWithAlphaComponent:a];
    }
    if (r == 1 && g == 0 && b == 0) {
        //red
        return [[UIColor colorWithLight:[UIColor redColor] dark:UIColor.brownColor] colorWithAlphaComponent:a];
    }
    if (r == 1 && g == 1 && b == 1) {
        return [[UIColor colorWithLight:UIColor.whiteColor dark:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:a]] colorWithAlphaComponent:a];
    }
    return color;
}

#endif /* CDColorFitManager_h */
