//
//  Constants.m
//  LastManStanding
//
//  Created by admin on 14/06/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+ (BOOL) validateEmail: (NSString *) candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

+ (NSString*)myUserID
{
    NSString *myUserID = @"";
    if(MYUSERINFO)
        if ([[MYUSERINFO objectForKey:KEYUSER] objectForKey:KEYUSERID]) {
            myUserID = [[MYUSERINFO objectForKey:KEYUSER] objectForKey:KEYUSERID];
        }
    return myUserID;
}

+ (NSString*) timeStringFromUnixDate: (NSString *) candidate
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[candidate floatValue]];
    
    int interval = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    date = [date dateByAddingTimeInterval:interval];
    
    NSString*str = [Constants tillNowTimeStringFromDate:date];
    
    return str;
}

+ (NSString*) tillNowTimeStringFromDate: (NSDate *) candidate
{
    int interval = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    
    NSDate*now = [NSDate date];
    now = [now dateByAddingTimeInterval:interval];
    NSTimeInterval seconds = fabs([now timeIntervalSinceDate:candidate]);
    NSString* result = @"";
    if (seconds==0) {
        result = @"0s";
    }
    else
    {
        int hours = 0;
        int minutes = 0;
        minutes = seconds/60;
        seconds -= minutes*60;
        hours = minutes / 60;
        minutes -= hours*60;
        if (hours<24)
        {
            NSString*strSeconds = [seconds<10?@"":@"" stringByAppendingFormat:@"%.0f",seconds];
            NSString*strMinutes = [minutes<10?@"":@"" stringByAppendingFormat:@"%d",minutes];
            NSString*strHours = [hours<10?@"":@"" stringByAppendingFormat:@"%d",hours];
            strHours = [strHours intValue]>0?[NSString stringWithFormat:@"%@ hr ",strHours]:@"";
            strMinutes = [strMinutes intValue]>0?[NSString stringWithFormat:@"%@ min ",strMinutes]:@"";
            strSeconds = [strSeconds intValue]>0?[NSString stringWithFormat:@"%@ sec ",strSeconds]:@"";
            if (![strHours isEqualToString:@""])
            {
                result = strHours;
            }
            else if (![strMinutes isEqualToString:@""])
            {
                result = strMinutes;
            }
            else //if (![strSeconds isEqualToString:@""])
            {
                result = strSeconds;
            }
            //            result = [NSString stringWithFormat:@"%@%@%@",strHours,strMinutes,strSeconds];
            
        }
        else
        {
            int days = hours/24;
            if (days>365)
            {
                result = [NSString stringWithFormat:@"%d yr ",days/365];
            }
            else
            {
                result = [NSString stringWithFormat:@"%d day ",days];
            }
        }
    }
    return result;
}

+ (NSString*) tillNowTimeStringFromStringDate: (NSString *) candidate
{
    NSDateFormatter*dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//2012-09-14 14:16:41
    
    NSDate* date = [dateformatter dateFromString:candidate];
    NSInteger interval = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    date = [date dateByAddingTimeInterval:interval];
    NSDate*now = [NSDate date];
    now = [now dateByAddingTimeInterval:interval];
    NSTimeInterval seconds = fabs([now timeIntervalSinceDate:date]);
    NSString* result = @"";
    if (seconds==0) {
        result = @"0s";
    }
    else
    {
        int hours = 0;
        int minutes = 0;
        minutes = seconds/60;
        seconds -= minutes*60;
        hours = minutes / 60;
        minutes -= hours*60;
        if (hours<24)
        {
            NSString*strSeconds = [seconds<10?@"":@"" stringByAppendingFormat:@"%.0f",seconds];
            NSString*strMinutes = [minutes<10?@"":@"" stringByAppendingFormat:@"%d",minutes];
            NSString*strHours = [hours<10?@"":@"" stringByAppendingFormat:@"%d",hours];
            strHours = [strHours intValue]>0?[NSString stringWithFormat:@"%@h ",strHours]:@"";
            strMinutes = [strMinutes intValue]>0?[NSString stringWithFormat:@"%@m ",strMinutes]:@"";
            strSeconds = [strSeconds intValue]>0?[NSString stringWithFormat:@"%@s ",strSeconds]:@"";
            if (![strHours isEqualToString:@""])
            {
                result = strHours;
            }
            else if (![strMinutes isEqualToString:@""])
            {
                result = strMinutes;
            }
            else //if (![strSeconds isEqualToString:@""])
            {
                result = strSeconds;
            }
            //            result = [NSString stringWithFormat:@"%@%@%@",strHours,strMinutes,strSeconds];
            
        }
        else
        {
            int days = hours/24;
            if (days>365)
            {
                result = [NSString stringWithFormat:@"%dy ",days/365];
            }
            else
            {
                result = [NSString stringWithFormat:@"%dd ",days];
            }
        }
    }
    
    return result;
}

+ (NSString*)myXMPPId
{
    NSString *myXMPPId = @"";
    NSLog(@"%@",MYUSERINFO);
    NSLog(@"%@",[[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER]);
    if([[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER])
        if ([[[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER] objectForKey:KEYXMPPUSERID])
        {
            myXMPPId = [[[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER] objectForKey:KEYXMPPUSERID];
            myXMPPId = [myXMPPId stringByAppendingFormat:@"@%@",[USERDEFAULTS objectForKey:XMPPHOSTNAME]];
        }

    return myXMPPId;
}

+ (NSString*)myXMPPIdNoHost
{
    NSString *myXMPPId = @"";
    if([[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER])
        if ([[[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER] objectForKey:KEYXMPPUSERID])
        {
            myXMPPId = [[[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER] objectForKey:KEYXMPPUSERID];
        }
    if ([myXMPPId isEqualToString:@""])
    {
        myXMPPId = @"himanshu";
    }
    return myXMPPId;
}
+ (NSString*)myXMPPHost
{
    NSString *myXMPPId = @"";
    if([USERDEFAULTS objectForKey:XMPPHOSTNAME])
        myXMPPId = [NSString stringWithFormat:@"%@",[USERDEFAULTS objectForKey:XMPPHOSTNAME]];
    if ([myXMPPId isEqualToString:@""])
    {
        myXMPPId = @"210.211.251.20";//http://inheritx.dnsdynamic.com:8590
    }
    return myXMPPId;
}
+ (NSString*)myXMPPPassword
{
    NSString *myXMPPPassword = @"";
    if([[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER])
        if ([[[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER] objectForKey:KEYXMPPUSERPASSWORD]) {
            myXMPPPassword = [[[MYUSERINFO objectForKey:KEYDATA] objectForKey:KEYUSER] objectForKey:KEYXMPPUSERPASSWORD];
        }
    if ([myXMPPPassword isEqualToString:@""])
    {
        myXMPPPassword = @"Yahoo@123";
    }
    return myXMPPPassword;
}

@end
