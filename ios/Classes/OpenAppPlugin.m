#import "OpenAppPlugin.h"
#if __has_include(<open_app/open_app-Swift.h>)
#import <open_app/open_app-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "open_app-Swift.h"
#endif

@implementation OpenAppPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOpenAppPlugin registerWithRegistrar:registrar];
}
@end
