//
//  Constants.h
//  LastManStanding
//
//  Created by admin on 14/06/13.
//  Copyright (c) 2013 admin. All rights reserved.
//
#pragma mark - Device Detection -
#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ]  || [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone Simulator" ])
#define IS_IPOD   ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )
#define IS_IPAD   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_IPHONE_5 ( IS_IPHONE && IS_WIDESCREEN )

#pragma mark - Application Usage -

#define XMPPHOSTNAME @"HostName"
#define KEYXMPPUSERID @"username"
#define KEYXMPPUSERPASSWORD @"password"

#define SCREEENWIDTH (self.view.frame.size.width>self.view.frame.size.height)?self.view.frame.size.width:self.view.frame.size.height

#define APPNAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

#define USERDEFAULTS [NSUserDefaults standardUserDefaults]
//#define FBACINFO [NSUserDefaults standardUserDefaults]

#define FILEMANAGER [NSFileManager defaultManager]

#define APPDELEGATE (AppDelegate*)[UIApplication sharedApplication].delegate

#define DEFAULTFONT [UIFont fontWithName:@"ColonnaMT" size:(IS_IPAD)?28:22]
#define DEFAULTTIMEOUT 15.0

#pragma mark - Alert Messages -

#define ALERTEMPTYFIRSTNAME @"Please enter your first name."
#define ALERTEMPTYLASTNAME @"Please enter your last name."
#define ALERTEMPTYUNIVERSITY @"Please enter your university."
#define ALERTEMPTYDORM @"Please enter your dorm."
#define ALERTEMPTYEMAIL @"Please enter email address."
#define ALERTEMPTYPASSWORD @"Please enter your password."
#define ALERTEMAILincorrect @"Please enter valid email address."
#define ALERTEMAILLENGTH @"Please enter email address."
#define ALERTPASSWORDLENGTH @"Please enter password more than five characters long."
#define ALERTINVALIDEMAIL @"Please enter .edu type email address."
#define ALERTWSFAILURE @"Please try again later."

#pragma mark - Web Service URL -

#define APILOCATION @"/getlocation.php"
#define APICATEGORYLIST @"/category_listing.php"
#define APICITYLIST @"/city_listing.php"
#define APIUPDATEPUSHNOTIFICATION @"/update_push_notification_settings.php"
#define APIGETPUSHNOTIFICATION @"/push_notification_settings.php"
#define APIWEATHER @"/weather?"
#define APICATEGORY @"/searchcategories.php"
#define APINAVCATEGORY @"/categories.php"
#define APIDETAILLOCATION @"/location1.php"
#define APIMANAULSEARCH @"/manualsearch.php"
#define APIOFFERLIST @"/offer_listing.php"
#define APIOFFERDETAIL @"/offer_details.php"
#define APIREGISTERDEVICE @"/register_device.php"


#define STATELOCATION @"/getlocation.php"
#define STATEGETPUSHNOTIFICATION @"Getpushnotification"
#define STATEUPDATEPUSHNOTIFICATION @"UpdatePushNotification"
#define STATECATEGORYLIST @"CATEGORYLIST"
#define STATECITYLIST @"CITYLIST"
#define STATEWEATHER @"Weather"
#define STATECATEGORY @"CATEGORY"
#define STATECATEGORYMAP @"CATEGORYMAP"
#define STATENAVCATEGORY @"NAVCATEGORY"
#define STATEDETAILLOCATION @"DETAILLOCATION"
#define STATEMANAULSEARCH @"MANUALSEARCH"
#define STATEWEATHERDETAILS @"WEATHERDETAIL"
#define STATECITYDETAILS @"CITYDETAILS"
#define STATEOFFERLIST @"offerList"
#define STATEOFFERDETAIL @"offerDetail"
#define STATEREGISTERDEVICE @"registerDevice"

#pragma mark - Request Keys -

#define KEYMARKER @"Marker"
#define RESPONSESUCCESS @"status"
#define RESPONSEMESSAGE @"message"
#define KEYEMAIL @"email"
#define KEYUSERID @"user_id"
#define KEYUSERNAME @"username"
#define KEYJABBERPASSWORD @"jabber_password"
#define KEYFIRSTNAME @"first_name"
#define KEYLASTNAME @"last_name"
#define KEYUNIVERSITY @"university"
#define KEYDORMADDRESS @"dorm_address"
#define KEYDORMLATITUDE @"dorm_lat"
#define KEYDORMLONGITUTE @"dorm_lng"
#define KEYPHOTOURL @"photo_url"
#define KEYSELLINGITEMS @"selling_items"
#define KEYBUYINGITEMS @"buying_items"
#define KEYPASSWORD @"password"
#define KEYFACEBOOKID @"fID"
#define KEYLATITUDE @"latitude"
#define KEYLONGITUDE @"longitude"
#define KEYUSERINFO @"userinfo"
#define KEYFBIMG @"fbimage"
#define KEYUSER @"user"
#define KEYBUYCOUNT @"buy_count"
#define KEYSALECOUNT @"sale_count"
#define KEYSELLINGITEMS @"selling_items"
#define KEYBUYINGITEMS @"buying_items"
#define KEYFOLLOWCOUNT @"follow_count"
#define KEYFOLLOWINGCOUNT @"following_count"
#define KEYFOLLOWFRIEND @"Follow Friend"
#define KEYUNFOLLOWFRINEND @"Unfollow Friend"
#define KEYISFOLLOWING @"isfollowing"
#define KEYFOLLOWERSNOTIFICATION @"followers_notification"
#define KEYITEMPOSTNOTIFICATION @"item_post_notification"
#define KEYMAPDETAIL @"Map Detail"
#define KEYDEVICETOKEN @"deviceToken"

#define KEYDATA @"data"
//#define KEYEMAIL @""
//#define KEYEMAIL @""
#define KEYFB_FNAME @"first_name"
#define KEYFB_LNAME @"last_name"
#define KEYFB_ID @"id"
#define KEYFBINFO @"FB_AC_info"


#define MYUSERINFO [USERDEFAULTS objectForKey:KEYUSERINFO]
#define MYIMAFE [USERDEFAULTS objectForKey:KEYFBIMG]
#define FBACINFO [USERDEFAULTS objectForKey:KEYFBINFO]
#define MAPDetail [USERDEFAULTS objectForKey:KEYMAPDETAIL]

#define DEFAULT_ROW_HEIGHT 104
#define HEADER_HEIGHT 48
#define INNERVIEWTAG 504
#define INNERVIEWRADIUS 5
#define INTERNETNOTAVAILABLE @"nessuna rete disponibile"
#define DELETETAG 302

#define PHONE_H_DIFF ([[UIScreen mainScreen] bounds].size.height - 480.0)


#import <Foundation/Foundation.h>

@interface Constants : NSObject
+ (BOOL) validateEmail: (NSString *) candidate;
+ (NSString*)myUserID;
+ (NSString*) tillNowTimeStringFromDate: (NSDate *) candidate;
+ (NSString*) timeStringFromUnixDate: (NSString *) candidate;


+ (NSString*)myXMPPId;
+ (NSString*)myXMPPPassword;
+ (NSString*)myXMPPIdNoHost;
+ (NSString*)myXMPPHost;
@end