//
//  CTMediator+ModuleAActions.h
//  ModularAPP
//
//  Created by 崔曦 on 2018/10/26.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (ModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail;

- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;

- (void)CTMediator_presentImage:(UIImage *)image;

- (UITableViewCell *)CTMediator_tableViewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView;

- (void)CTMediator_configTableViewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath;

- (void)CTMediator_cleanTableViewCellTarget;

@end

NS_ASSUME_NONNULL_END
