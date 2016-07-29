
//
//  DescriptionView.m
//  Lesson-Keychain
//
//  Created by rocky on 16/7/28.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "DescriptionView.h"

@interface DescriptionView()
@property (strong, nonatomic) UIButton *clearBtn;
@property (strong, nonatomic) UIButton *refreshBtn;
@property (nonatomic, copy) void(^clearBlock)();
@property (nonatomic, copy) void(^refreshBlock)();
@property (nonatomic, copy) void(^findBlock)();
@end

@implementation DescriptionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
        
    }
    return self;
}

- (void)creatUI{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 100, 40)];
    label.text = @"保存的账号:";
    [self addSubview:label];

    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 100, 40)];
    label.text = @"保存的密码:";
    [self addSubview:label];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 80, 40)];
    label.text = @"账号:";
    [self addSubview:label];
    
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 250, 80, 40)];
    label.text = @"密码:";
    [self addSubview:label];
    
    
    self.accountName = [[UITextField alloc]initWithFrame:CGRectMake(120, 100, 150, 40)];
    self.accountName.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.accountName];
    
    self.password = [[UITextField alloc]initWithFrame:CGRectMake(120, 150, 150, 40)];
    self.password.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.password];
    
    
    self.writeName = [[UITextField alloc]initWithFrame:CGRectMake(120, 200, 200, 40)];
    self.writeName.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.writeName];
    
    self.writePassword = [[UITextField alloc]initWithFrame:CGRectMake(120, 250, 200, 40)];
    self.writePassword.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.writePassword];
    
    self.clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, 80, 40)];
    [self.clearBtn setTitle:@"清除" forState:UIControlStateNormal];
    self.clearBtn.backgroundColor = [UIColor grayColor];
    [self.clearBtn addTarget:self action:@selector(clearAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.clearBtn];
    
    self.refreshBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 80, 40)];
    [self.refreshBtn setTitle:@"保存" forState:UIControlStateNormal];
    self.refreshBtn.backgroundColor = [UIColor grayColor];
    [self.refreshBtn addTarget:self action:@selector(refreshAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.refreshBtn];
    
    
}
- (void)setIsSecond:(BOOL)isSecond{
    _isSecond = isSecond;
    if (self.isSecond) {
        self.clearName = [[UITextField alloc]initWithFrame:CGRectMake(50, 350, 200, 40)];
        self.clearName.placeholder = @"需要清除密码的账号";
        self.clearName.borderStyle = UITextBorderStyleRoundedRect;
        self.clearName.textColor = [UIColor redColor];
        [self addSubview:self.clearName];
        
        self.clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(280, 150, 80, 40)];
        [self.clearBtn setTitle:@"查询密码" forState:UIControlStateNormal];
        self.clearBtn.backgroundColor = [UIColor grayColor];
        [self.clearBtn addTarget:self action:@selector(find) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.clearBtn];
    }

}

- (void)find{
    if (self.findBlock) {
        self.findBlock();
    }
}

- (void)findPasswordWithName:(void (^)())block{
    self.findBlock = block;
}

- (void)clearAction:(UIButton *)btn{
    if (self.clearBlock) {
        self.clearBlock();
    }
}

- (void)clickClearBtnWithBlock:(void (^)())block{
    self.clearBlock = block;
   
}


- (void)refreshAction:(UIButton *)btn{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}
- (void)refreshBtnWithBlock:(void (^)())block{
    self.refreshBlock = block;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}








@end
