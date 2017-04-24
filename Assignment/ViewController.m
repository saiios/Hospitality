//
//  ViewController.m
//  Assignment
//
//  Created by sai on 4/23/17.
//  Copyright © 2017 sai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Float label ---placeholder
    _username_tf.floatLabelActiveColor = [UIColor lightGrayColor];
    _username_tf.floatLabelPassiveColor = [UIColor blackColor];
    
    _password_tf.floatLabelActiveColor = [UIColor lightGrayColor];
    _password_tf.floatLabelPassiveColor = [UIColor blackColor];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([_username_tf isFirstResponder])
    {
        [_password_tf becomeFirstResponder];
    }
    else if([_password_tf isFirstResponder])
    {
        [_password_tf resignFirstResponder];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login_click:(id)sender
{
    Home_Screen *menuController  =[[Home_Screen alloc]initWithNibName:@"Home_Screen" bundle:nil];
    [self.navigationController pushViewController:menuController animated:YES];
}

@end
