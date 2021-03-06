//
//  T8Defines.h
//  Telegraph
//
//  Created by 琦张 on 15/2/8.
//
//

#ifndef Telegraph_T8Defines_h
#define Telegraph_T8Defines_h

// 单例模式
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}

#define PCScaleWidth375(x)      (x / 375.0 * DEVICE_WIDTH)
#define PCScaleHeight667(y)     (y / 667.0 * DEVICE_HEIGHT)

//屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
//屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define DEVICE_HEIGHT  (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define DEVICE_WIDTH  (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
//iPhone 屏幕尺寸
#define PHONE_SCREEN_SIZE (CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - PHONE_STATUSBAR_HEIGHT))

#define UIColorRGB(rgb) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) / 255.0f) alpha:1.0f])
#define UIColorRGBA(rgb,a) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) / 255.0f) alpha:a])

#ifndef AppBgColor
#define AppBgColor                  UIColorRGB(0xF7F7F7)
#endif
#ifndef NavBarBgColor
#define NavBarBgColor               UIColorRGB(0xFFFFFF)
#endif
#ifndef MainContentColor
#define MainContentColor            UIColorRGB(0x333333)        //  主要内容颜色（导航栏文字／icon；文章标题；重要信息文字）
#endif
#ifndef AssistContentColor
#define AssistContentColor          UIColorRGB(0x999999)        //  辅助内容颜色（辅助信息文字；数字信息文字；tabbar未选中状态）
#endif
#ifndef TabBarColor
#define TabBarColor                 UIColorRGBA(0xFFFFFF, 0.6)
#endif
#ifndef SeparatorColor
#define SeparatorColor              UIColorRGB(0xE6E6E6)
#endif
#ifndef PlaceHolderColor
#define PlaceHolderColor      UIColorRGB(0xBBBBBB)
#endif
#ifndef HighlightedWhiteColor
#define HighlightedWhiteColor            UIColorRGB(0xD9D9D9)
#endif
#ifndef DisableColor
#define DisableColor                UIColorRGB(0xCCCCCC)
#endif
#ifndef ModuleTitleColor
#define ModuleTitleColor            UIColorRGB(0x666666)
#endif
#ifndef CellHighlightedBgColor
#define CellHighlightedBgColor      UIColorRGB(0xE6E6E6)
#endif

#endif
