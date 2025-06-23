#import "Minimizer.h"
#import "UIKit/UIKit.h"
#import <objc/runtime.h>

@interface UISystemNavigationAction : NSObject

@property(nonatomic, readonly, nonnull) NSArray<NSNumber*>* destinations;
-(BOOL)sendResponseForDestination:(NSUInteger)destination;
@end

@implementation Minimizer
RCT_EXPORT_MODULE()

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeMinimizerSpecJSI>(params);
}

- (void)exit:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject {
  exit(0);
}

- (void)goBack:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject {
  Ivar sysNavIvar = class_getInstanceVariable(UIApplication.class, "_systemNavigationAction");
  UIApplication* app = UIApplication.sharedApplication;
  UISystemNavigationAction* action = object_getIvar(app, sysNavIvar);
  if (!action) {
      return;
  }
  NSUInteger destination = action.destinations.firstObject.unsignedIntegerValue;
  [action sendResponseForDestination:destination];
  return;
}

- (void)minimize:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject {
    UIApplication *app = [UIApplication sharedApplication];
    dispatch_async(dispatch_get_main_queue(), ^{
      [app performSelector:@selector(suspend)];
    });
}

@end
