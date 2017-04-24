//
//  ViewController.h
//  Assignment
//
//  Created by sai on 4/23/17.
//  Copyright © 2017 sai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home_Screen.h"
@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIFloatLabelTextField *username_tf;
- (IBAction)login_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIFloatLabelTextField *password_tf;

@end

