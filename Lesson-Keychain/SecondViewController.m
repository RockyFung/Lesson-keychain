//
//  SecondViewController.m
//  Lesson-Keychain
//
//  Created by rocky on 16/7/28.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "SecondViewController.h"
#import "DescriptionView.h"
#import "SFHFKeychainUtils.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"SFHFKeychainUtils";
    self.view.backgroundColor = [UIColor whiteColor];
    DescriptionView *deView = [[DescriptionView alloc]initWithFrame:self.view.bounds];
    deView.isSecond = YES;
    [self.view addSubview:deView];
    
  __block  NSString *msg = nil;
    
    // 通过账号取数据
    [deView findPasswordWithName:^{
        NSString *passWord =  [SFHFKeychainUtils getPasswordForUsername:deView.accountName.text andServiceName:@"SERVICE_NAME" error:nil];
        deView.password.text = passWord;
        if (passWord.length == 0) {
            msg = @"查询失败";
            [self alertWithTitle:msg];
        }
    }];
   
    
    [deView refreshBtnWithBlock:^{
        // 保存账号密码
       BOOL save = [SFHFKeychainUtils storeUsername:deView.writeName.text andPassword:deView.writePassword.text forServiceName:@"SERVICE_NAME" updateExisting:1 error:nil];
        if (save) {
            msg = @"账号保存成功";
        }else{
            msg = @"保存失败";
        }
        [self alertWithTitle:msg];
    }];
    
    
    [deView clickClearBtnWithBlock:^{
        // 根据账号删除密码
       BOOL delete = [SFHFKeychainUtils deleteItemForUsername:deView.clearName.text andServiceName:@"SERVICE_NAME" error:nil];
        
        if (delete) {
            deView.password.text = @"";
            deView.accountName.text = @"";
            msg = [NSString stringWithFormat:@"账号:%@ 删除成功",deView.clearName.text];
        }else{
            msg = @"删除失败";
        }
        [self alertWithTitle:msg];
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
