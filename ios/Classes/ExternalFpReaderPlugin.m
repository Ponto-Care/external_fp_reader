#import "ExternalFpReaderPlugin.h"
#if __has_include(<external_fp_reader/external_fp_reader-Swift.h>)
#import <external_fp_reader/external_fp_reader-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "external_fp_reader-Swift.h"
#endif

@implementation ExternalFpReaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftExternalFpReaderPlugin registerWithRegistrar:registrar];
}
@end
