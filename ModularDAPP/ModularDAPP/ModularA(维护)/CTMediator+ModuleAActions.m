//
//  CTMediator+ModuleAActions.m
//  ModularAPP
//
//  Created by 崔曦 on 2018/10/26.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "CTMediator+ModuleAActions.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActionNativFetchDetailViewController = @"nativeFetchDetailViewController";
NSString * const kCTMediatorActionNativePresentImage = @"nativePresentImage";
NSString * const kCTMediatorActionNativeNoImage = @"nativeNoImage";
NSString * const kCTMediatorActionShowAlert = @"showAlert";
NSString * const kCTMediatorActionCell = @"cell";
NSString * const kCTMediatorActionConfigCell = @"configCell";

@implementation CTMediator (ModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail
{
    UIViewController *viewController = [self performTarget:kCTMediatorTargetA
                                                    action:kCTMediatorActionNativFetchDetailViewController
                                                    params:@{@"key":@"value"}
                                         shouldCacheTarget:NO
                                        ];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (void)CTMediator_presentImage:(UIImage *)image
{
    if (image) {
        [self performTarget:kCTMediatorTargetA
                     action:kCTMediatorActionNativePresentImage
                     params:@{@"image":image}
          shouldCacheTarget:NO];
    } else {
        // 这里处理image为nil的场景，如何处理取决于产品
        [self performTarget:kCTMediatorTargetA
                     action:kCTMediatorActionNativeNoImage
                     params:@{@"image":[UIImage imageNamed:@"noImage"]}
          shouldCacheTarget:NO];
    }
}

- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kCTMediatorTargetA
                 action:kCTMediatorActionShowAlert
                 params:paramsToSend
      shouldCacheTarget:NO];
}

- (UITableViewCell *)CTMediator_tableViewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    return [self performTarget:kCTMediatorTargetA
                        action:kCTMediatorActionCell
                        params:@{
                                 @"identifier":identifier,
                                 @"tableView":tableView
                                 }
             shouldCacheTarget:YES];
}

- (void)CTMediator_configTableViewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath
{
    [self performTarget:kCTMediatorTargetA
                 action:kCTMediatorActionConfigCell
                 params:@{
                          @"cell":cell,
                          @"title":title,
                          @"indexPath":indexPath
                          }
      shouldCacheTarget:YES];
}

- (void)CTMediator_cleanTableViewCellTarget
{
    [self releaseCachedTargetWithTargetName:kCTMediatorTargetA];
}

@end
