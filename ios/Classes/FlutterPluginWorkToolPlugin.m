#import "FlutterPluginWorkToolPlugin.h"
#import <flutter_plugin_work_tool/flutter_plugin_work_tool-Swift.h>

@implementation FlutterPluginWorkToolPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_plugin_work_tool"
                                     binaryMessenger:[registrar messenger]];
    FlutterPluginWorkToolPlugin* instance = [[FlutterPluginWorkToolPlugin alloc] init];
    instance.channel = channel;
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        [self _callbackResult:result withObject:@"9.9.9"];
    } else if ([@"hybridNavBack" isEqualToString:call.method]) {
        [[UIApplication sharedApplication].keyWindow.rootViewController popViewControllerAnimated:YES];
        [self _callbackResult:result];
    } else {
        [self _callbackResult:result withObject:FlutterMethodNotImplemented];
    }
}

#pragma mark - private methods

- (void)_callbackResult:(FlutterResult)result
{
    [self _callbackResult:result withObject:@""];
}

- (void)_callbackResult:(FlutterResult)result withObject:(id)obj
{
    result(obj ? obj : @"");
}

@end
