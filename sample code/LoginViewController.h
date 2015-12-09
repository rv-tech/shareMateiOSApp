//
//  LoginViewController.h
//  ShareMate
//
//  Created by user on 07/12/15.
//  Copyright © 2015 RVTECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBAudienceNetwork/FBAudienceNetwork.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *down_arrow;
- (IBAction)facebook_login:(id)sender;

@end
