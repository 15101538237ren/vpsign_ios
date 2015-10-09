//
//  ViewController.m
//  VPSign
//
//  Created by ren on 15/10/8.
//  Copyright © 2015年 Beihang University. All rights reserved.
//

#import "ViewController.h"
#import "textFieldBackground.h"
#define USER_NAME NSLocalizedStringFromTable(@"USER_NAME",@"ViewController",@"Input User Name on Login Interface")
#define PASS_WORD NSLocalizedStringFromTable(@"PASS_WORD",@"ViewController",@"password for Login")
#define LOGIN NSLocalizedStringFromTable(@"LOGIN",@"ViewController",@"Login button name")
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *account;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIView *background;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_background setBackgroundColor:[UIColor whiteColor]];
    [[_background layer] setCornerRadius:5];
    [[_background layer] setMasksToBounds:YES];
    
    _account.placeholder=[NSString stringWithFormat:USER_NAME];
    _password.placeholder=[NSString stringWithFormat:PASS_WORD];
    
    [_loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
    [_loginButton setTitle:LOGIN forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius=5.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
