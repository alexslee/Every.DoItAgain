//
//  LoginViewController.m
//  Every.DoItAgain
//
//  Created by Alex Lee on 2017-06-21.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "LoginViewController.h"
#import <SAMKeychain/SAMKeychainQuery.h>
#import <SAMKeychain/SAMkeychain.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)login:(UIButton *)sender {
    if (self.usernameField.text.length > 0 && self.passwordField.text.length > 0) {
        NSString *password = [SAMKeychain passwordForService:@"EveryDo" account:self.usernameField.text];
        if (password.length > 0) {
            if ([password isEqualToString:self.passwordField.text]) {
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Login error!" message:@"Invalid username/password combination." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:nil];
                [alertView addAction:okAction];
                [self showViewController:alertView sender:self];
            } 
        } else {
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"New account" message:@"Would you like to create an account?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                BOOL result = [SAMKeychain setPassword:self.passwordField.text forService:@"EveryDo" account:self.usernameField.text];
                
                if (result) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }];
            
            [alertView addAction:okAction];
            [self showViewController:alertView sender:self];
        }
    }
}


@end
