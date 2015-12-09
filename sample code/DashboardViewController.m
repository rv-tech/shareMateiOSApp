//
//  DashboardViewController.m
//  ShareMate
//
//  Created by user on 07/12/15.
//  Copyright © 2015 RVTECHNOLOGIES. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardCell.h"
#import <QuartzCore/QuartzCore.h>

@interface DashboardViewController ()

@end

@implementation DashboardViewController
DashboardCell *cell4;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _plus_button.layer.cornerRadius = 15;
    _plus_button.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 326;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"DashboardCell";
    
    cell4 = (DashboardCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell4 == nil)
    {
        DashboardCell *aCell = [[DashboardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DashboardCell"];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DashboardCell" owner:aCell options:nil];
        cell4 = [topLevelObjects objectAtIndex:0];
    }
    
    cell4.belowLayout.layer.cornerRadius = 10;
    cell4.belowLayout.layer.masksToBounds = YES;
    cell4.bottomLayout.layer.cornerRadius = 15;
    cell4.bottomLayout.layer.masksToBounds = YES;

   // [cell4.layer setCornerRadius:10.0f];
   // [cell4.layer setMasksToBounds:YES];
   // [cell4.layer setBorderWidth:2.0f];
    
    return cell4;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
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
