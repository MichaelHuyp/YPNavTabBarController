#import "YPNavTabBarControllerConst.h"

float YPDeviceSystemVersion() {
    static float version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.floatValue;
    });
    return version;
}