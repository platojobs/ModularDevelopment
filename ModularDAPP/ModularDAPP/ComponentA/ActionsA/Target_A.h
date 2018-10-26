//
//  Target_A.h
//  ModularAPP
//
//  Created by 崔曦 on 2018/10/26.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Target_A : NSObject

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params;
- (id)Action_nativePresentImage:(NSDictionary *)params;
- (id)Action_showAlert:(NSDictionary *)params;

// 容错
- (id)Action_nativeNoImage:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
