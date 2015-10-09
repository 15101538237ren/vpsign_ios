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
#define LOGIN_SUCCESS 1
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
    _password.secureTextEntry = YES;
    
    [_loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
    [_loginButton setTitle:LOGIN forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius=5.0;
}
- (IBAction)account__DidEndOnExit:(UITextField *)sender {
    [self.password becomeFirstResponder];
}
- (IBAction)password__DidEndOnExit:(UITextField *)sender {
    [sender resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginPressed:(UIButton *)sender {
    NSURL *loginUrl = [NSURL URLWithString:@"http://192.168.1.105:8000/account/loginjson/"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:loginUrl];//默认为get请求
    request.timeoutInterval=5.0;//设置请求超时为5秒
    request.HTTPMethod=@"POST";//设置请求方法
    NSString *param=[NSString stringWithFormat:@"username=%@&password=%@",self.account.text,self.password.text];
    //把拼接后的字符串转换为data，设置请求体
    request.HTTPBody=[param dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]; //将请求的url数据放到NSData对象中
    NSError * error ;
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:jsonData  options:NSJSONReadingMutableLeaves error:&error];
    NSNumber * success = (NSNumber *)[responseDict objectForKey:@"success"];
    
    if ([success integerValue] == LOGIN_SUCCESS ) {
        [self performSegueWithIdentifier:@"login segue" sender:self];
    }
    else
    {
        NSLog(@"Login failed!%@",success);
    }
    //[[[UIAlertView alloc] initWithTitle:@"这里是标题" message:[jsonObj objectForKey:@"success"] delegate:self cancelButtonTitle:@"Cancel按钮" otherButtonTitles:@"OK", nil] show];
}

@end
