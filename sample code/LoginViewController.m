//
//  LoginViewController.m
//  ShareMate
//
//  Created by user on 07/12/15.
//  Copyright © 2015 RVTECHNOLOGIES. All rights reserved.
//

#import "LoginViewController.h"
#import "Reachability.h"

@interface LoginViewController ()
#define DegreesToRadians(x) ((x) * M_PI / 180.0)

-(void)reachabilityChanged:(NSNotification*)note;

@property(strong) Reachability * googleReach;
@property(strong) Reachability * localWiFiReach;
@property(strong) Reachability * internetConnectionReach;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UIView beginAnimations:@"rotate" context:nil];
    [UIView setAnimationDuration:0.1];
    _down_arrow.transform = CGAffineTransformMakeRotation(DegreesToRadians(45));
    [UIView commitAnimations];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    
    __weak __block typeof(self) weakself = self;
    
    // create a Reachability object for www.google.com
    
    self.googleReach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    self.googleReach.reachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@"GOOGLE Block Says Reachable(%@)", reachability.currentReachabilityString];
        NSLog(@"%@", temp);
        
        // to update UI components from a block callback
        // you need to dipatch this to the main thread
        // this uses NSOperationQueue mainQueue
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        }];
    };
    
    self.googleReach.unreachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@"GOOGLE Block Says Unreachable(%@)", reachability.currentReachabilityString];
        NSLog(@"%@", temp);
        
        // to update UI components from a block callback
        // you need to dipatch this to the main thread
        // this one uses dispatch_async they do the same thing (as above)
        dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                                message:temp
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];

        });
    };
    
    [self.googleReach startNotifier];
    
    
    
    //////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////
    //
    // create a reachability for the local WiFi
    
    self.localWiFiReach = [Reachability reachabilityForLocalWiFi];
    
    // we ONLY want to be reachable on WIFI - cellular is NOT an acceptable connectivity
    self.localWiFiReach.reachableOnWWAN = NO;
    
    self.localWiFiReach.reachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@"LocalWIFI Block Says Reachable(%@)", reachability.currentReachabilityString];
        NSLog(@"%@", temp);
        
        dispatch_async(dispatch_get_main_queue(), ^{
         
        });
    };
    
    self.localWiFiReach.unreachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@"LocalWIFI Block Says Unreachable(%@)", reachability.currentReachabilityString];
        
        NSLog(@"%@", temp);
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:temp
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        });
    };
    
    [self.localWiFiReach startNotifier];
    
    
    
    //////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////
    //
    // create a Reachability object for the internet
    
    self.internetConnectionReach = [Reachability reachabilityForInternetConnection];
    
    self.internetConnectionReach.reachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@" InternetConnection Says Reachable(%@)", reachability.currentReachabilityString];
        NSLog(@"%@", temp);
        
       dispatch_async(dispatch_get_main_queue(), ^{
        
        });
    };
    
    self.internetConnectionReach.unreachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@"InternetConnection Block Says Unreachable(%@)", reachability.currentReachabilityString];
        
        NSLog(@"%@", temp);
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:temp
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        });
    };
    
    [self.internetConnectionReach startNotifier];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if(reach == self.googleReach)
    {
        if([reach isReachable])
        {
            NSString * temp = [NSString stringWithFormat:@"GOOGLE Notification Says Reachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
                }
        else
        {
            NSString * temp = [NSString stringWithFormat:@"GOOGLE Notification Says Unreachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:temp
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else if (reach == self.localWiFiReach)
    {
        if([reach isReachable])
        {
            NSString * temp = [NSString stringWithFormat:@"LocalWIFI Notification Says Reachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
          
        }
        else
        {
            NSString * temp = [NSString stringWithFormat:@"LocalWIFI Notification Says Unreachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:temp
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else if (reach == self.internetConnectionReach)
    {
        if([reach isReachable])
        {
            NSString * temp = [NSString stringWithFormat:@"InternetConnection Notification Says Reachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
        
        }
        else
        {
            NSString * temp = [NSString stringWithFormat:@"InternetConnection Notification Says Unreachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:temp
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    
}


- (IBAction)facebook_login:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
            NSLog(@"Response:: %@", @"Hello");
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if ([result.grantedPermissions containsObject:@"email"]) {
                // Do work
                NSLog(@"Response:: %@", @"Hello");
                NSLog(@"Granted all permission");
                if ([FBSDKAccessToken currentAccessToken])
                {
                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result2, NSError *error)
                     {
                         if (!error)
                         {
                             
                             NSLog(@"%@",result2);
                             NSString *userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [result2 objectForKey:@"id"]];
                             NSLog(@"%@",userImageURL);
                             [[NSUserDefaults standardUserDefaults] setObject:userImageURL forKey:@"userImageURL"];
                             [[NSUserDefaults standardUserDefaults] setObject:[result2 objectForKey:@"name"] forKey:@"nameUserLogin"];
                             [[NSUserDefaults standardUserDefaults] synchronize];
                             
                         }
                         
                     }];
                } else
                {
                    NSLog(@"Not granted");
                }
                
                NSLog(@"Response:: %@", result.grantedPermissions);
                [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
            }
        }
    }];
    
    
}

@end
