//
//  DescriptionView.h
//  Lesson-Keychain
//
//  Created by rocky on 16/7/28.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionView : UIView

@property (strong, nonatomic) UITextField *accountName;
@property (strong, nonatomic) UITextField *password;
@property (strong, nonatomic) UITextField *writeName;
@property (strong, nonatomic) UITextField *writePassword;
@property (strong, nonatomic) UITextField *clearName;
@property (strong, nonatomic) UITextField *findPassword;

@property (nonatomic, assign) BOOL isSecond;

- (void)findPasswordWithName:(void(^)())block;
- (void)clickClearBtnWithBlock:(void(^)())block;
- (void)refreshBtnWithBlock:(void(^)())block;
@end
