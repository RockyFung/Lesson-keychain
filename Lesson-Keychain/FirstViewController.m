//
//  FirstViewController.m
//  Lesson-Keychain
//
//  Created by rocky on 16/7/28.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "FirstViewController.h"
#import "DescriptionView.h"
#import "KeychainItemWrapper.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"KeychainItemWrapper";
    self.view.backgroundColor = [UIColor whiteColor];
    DescriptionView *deView = [[DescriptionView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:deView];
    __block  NSString *msg = nil;
    /**
     其中方法“- (void)setObject:(id)inObject forKey:(id)key;”里参数“forKey”的值应该是Security.framework 里头文件“SecItem.h”里定义好的key，用其他字符串做key程序会崩溃！
     */
    
    // 1. 初始化
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc]initWithIdentifier:@"rocky" accessGroup:@"Lesson-Keychain"];
    
    // 2. 取数据
    NSString *name = [wrapper objectForKey:(id)kSecAttrAccount];
    NSString *password = [wrapper objectForKey:(id)kSecValueData];
    deView.accountName.text = name;
    deView.password.text = password;
    
    
    [deView  clickClearBtnWithBlock:^{
        NSLog(@"clear");
        // 3. 清除保存的数据
        [wrapper resetKeychainItem];
        deView.accountName.text = [wrapper objectForKey:(id)kSecAttrAccount];;
        deView.password.text = [wrapper objectForKey:(id)kSecValueData];
    }];
    
    [deView  refreshBtnWithBlock:^{
        NSLog(@"refresh");
        // 4. 保存账号密码
        [wrapper setObject:deView.writeName.text forKey:(id)kSecAttrAccount];
        [wrapper setObject:deView.writePassword.text forKey:(id)kSecValueData];
        
        
        deView.accountName.text = [wrapper objectForKey:(id)kSecAttrAccount];;
        deView.password.text = [wrapper objectForKey:(id)kSecValueData];
    }];
}


- (void)alertWithTitle:(NSString *)title{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:title preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
