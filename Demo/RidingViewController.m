//
//  RidingViewController.m
//  Demo
//
//  Created by feng yu on 16/11/22.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "RidingViewController.h"
#import "UIColor+ColorChange.h"
#import "MBProgressHUD+NJ.h"
#import "UIImageView+OnlineImage.h"
#import "LevelUtil.h"

#define BLUR_SIZE 49
#define STATUS_HEIGHT 10
#define TOP_BTN_WIDTH 53
#define TOP_BTN_HEIGHT 45
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define LIGHT_BLACK_HEIGHT 50
#define LOGO_HEIGHT 220
#define HEAD_PORTRAIT_MARGIN 10
#define HEAD_PORTRAIT_SIZE 70
#define HONOR_SIZE_WIDTH  29
#define HONOR_SIZE_HEIGHT 34

@interface RidingViewController ()

@end

@implementation RidingViewController

-(instancetype)initWithAccountId:(NSString *)accountId{
    if (self==[super init]) {
        self.accountId = accountId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, LOGO_HEIGHT)];
    logo.contentMode = UIViewContentModeScaleToFill;
    logo.image = [UIImage imageNamed:@"main_logo"];
    logo.tag = 20;
    [self.view addSubview:logo];
    
#pragma mark add left btn
    UIImageView *leftBtnBg = [[UIImageView alloc]initWithFrame:CGRectMake(0,STATUS_HEIGHT, BLUR_SIZE, BLUR_SIZE)];
    leftBtnBg.image = [UIImage imageNamed:@"main_blur"];
    [self.view addSubview:leftBtnBg];
    
    UIImageView *leftBtn = [[UIImageView alloc]initWithFrame:CGRectMake(0, STATUS_HEIGHT, TOP_BTN_WIDTH, TOP_BTN_HEIGHT)];
    leftBtn.image = [UIImage imageNamed:@"message_noti1"];
    [self.view addSubview:leftBtn];

#pragma mark add right btn
    UIImageView *rightBtnBg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-BLUR_SIZE, STATUS_HEIGHT, BLUR_SIZE, BLUR_SIZE)];
    rightBtnBg.image = [UIImage imageNamed:@"main_blur"];
    [self.view addSubview:rightBtnBg];
    UIImageView *rightBtn = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-TOP_BTN_WIDTH, STATUS_HEIGHT, TOP_BTN_WIDTH, TOP_BTN_HEIGHT)];
    rightBtn.image = [UIImage imageNamed:@"share"];
    [self.view addSubview:rightBtn];
    
#pragma mark add lightblackbg
    UIImageView *lightBg = [[UIImageView alloc]initWithFrame:CGRectMake(0,LOGO_HEIGHT-LIGHT_BLACK_HEIGHT, SCREEN_WIDTH, LIGHT_BLACK_HEIGHT)];
    lightBg.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.32];
    [self.view addSubview:lightBg];
    
#pragma mark add head portrait
    UIImageView *headPortrait = [[UIImageView alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT-HEAD_PORTRAIT_MARGIN, HEAD_PORTRAIT_SIZE, HEAD_PORTRAIT_SIZE)];
    headPortrait.image = [UIImage imageNamed:@"head_portrait"];
    headPortrait.layer.cornerRadius = headPortrait.frame.size.width/2;
    headPortrait.clipsToBounds = YES;
    headPortrait.tag = 21;
    [self.view addSubview:headPortrait];
    
#pragma mark add data
    NSInteger dataColumnWidth = (SCREEN_WIDTH - 2*HEAD_PORTRAIT_MARGIN - HEAD_PORTRAIT_SIZE)/3;
    UILabel *totalRankTitle = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN, dataColumnWidth, HEAD_PORTRAIT_MARGIN)];
    totalRankTitle.text = @"年度总排名";
    totalRankTitle.font = [UIFont systemFontOfSize:11];
    totalRankTitle.textColor = [UIColor grayColor];
    totalRankTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:totalRankTitle];
    
    UILabel *totalRankValue = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN*3, dataColumnWidth, HEAD_PORTRAIT_MARGIN)];
    totalRankValue.tag = 10;
    totalRankValue.text = @"--";
    totalRankValue.font = [UIFont systemFontOfSize:13];
    totalRankValue.textColor = [UIColor whiteColor];
    totalRankValue.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:totalRankValue];
    
    UILabel *dividerView = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE+dataColumnWidth, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN*3/2, 0.35,LIGHT_BLACK_HEIGHT- HEAD_PORTRAIT_MARGIN*3)];
    dividerView.backgroundColor = [UIColor whiteColor];
    dividerView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:dividerView];
    
    UILabel *totalScoreTitle = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE+dataColumnWidth, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN, dataColumnWidth, HEAD_PORTRAIT_MARGIN)];
    
    totalScoreTitle.text = @"年度总积分";
    totalScoreTitle.font = [UIFont systemFontOfSize:11];
    totalScoreTitle.textColor = [UIColor grayColor];
    totalScoreTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:totalScoreTitle];
    
    UILabel *totalScoreValue = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE+dataColumnWidth,LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN*3 , dataColumnWidth, HEAD_PORTRAIT_MARGIN)];
    totalScoreValue.tag = 11;
    totalScoreValue.text = @"--";
    totalScoreValue.textColor = [UIColor whiteColor];
    totalScoreValue.font = [UIFont systemFontOfSize:13];
    totalScoreValue.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:totalScoreValue];
    
    UILabel *dividerView1 = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE+dataColumnWidth*2, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN*3/2, 0.35,LIGHT_BLACK_HEIGHT- HEAD_PORTRAIT_MARGIN*3)];
    dividerView1.backgroundColor = [UIColor whiteColor];
    dividerView1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:dividerView1];

    
    UILabel *totalDistanceTitle = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE+dataColumnWidth*2, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN, dataColumnWidth, HEAD_PORTRAIT_MARGIN)];
    totalDistanceTitle.text = @"总里程km";
    totalDistanceTitle.font = [UIFont systemFontOfSize:11];
    totalDistanceTitle.textColor = [UIColor grayColor];
    totalDistanceTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:totalDistanceTitle];
    
    UILabel *totalDistanceValue = [[UILabel alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+HEAD_PORTRAIT_SIZE+dataColumnWidth*2, LOGO_HEIGHT-LIGHT_BLACK_HEIGHT+HEAD_PORTRAIT_MARGIN*3, dataColumnWidth, HEAD_PORTRAIT_MARGIN)];
    totalDistanceValue.text = @"--";
    totalDistanceValue.tag = 12;
    totalDistanceValue.textColor = [UIColor whiteColor];
    totalDistanceValue.font = [UIFont systemFontOfSize:13];
    totalDistanceValue.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:totalDistanceValue];
    
#pragma mark add person info
    //昵称
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*2, HEAD_PORTRAIT_SIZE, HEAD_PORTRAIT_MARGIN)];
    name.text = @"";
    name.tag = 13;
    name.textColor = [UIColor darkGrayColor];
    name.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:name];
    
    //官方
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:name.text attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:13]}];

    CGRect textSize = [attributedText boundingRectWithSize:(CGSize){name.frame.size.width,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    UIImageView *offical = [[UIImageView alloc]initWithFrame:CGRectMake(2*HEAD_PORTRAIT_MARGIN+textSize.size.width, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*1.9, 23, 13)];
    offical.tag = 23;
    offical.image = [UIImage imageNamed:@"icon_offical"];
    [self.view addSubview:offical];
    
    //性别
    UIImageView *genderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(3*HEAD_PORTRAIT_MARGIN+textSize.size.width+offical.frame.size.width, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*1.9,30, 13)];
    genderImageView.image = [UIImage imageNamed:@"gender_male"];
    genderImageView.tag = 22;
    [self.view addSubview:genderImageView];
    UILabel *ageLabel = [[UILabel alloc]initWithFrame:CGRectMake(3*HEAD_PORTRAIT_MARGIN+textSize.size.width+offical.frame.size.width+HEAD_PORTRAIT_MARGIN*1.5,LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*1.6 , HEAD_PORTRAIT_MARGIN*2 , HEAD_PORTRAIT_MARGIN*2)];
    ageLabel.text = @"";
    ageLabel.tag = 14;
    ageLabel.font = [UIFont systemFontOfSize:8];
    ageLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:ageLabel];
    
    //个性签名
    UILabel *signLabel = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN,  LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*2+name.frame.size.height+HEAD_PORTRAIT_MARGIN,SCREEN_WIDTH-HONOR_SIZE_WIDTH-HONOR_SIZE_HEIGHT ,HEAD_PORTRAIT_MARGIN*2 )];
    signLabel.text = @"";
    signLabel.tag = 15;
    signLabel.textColor = [UIColor lightGrayColor];
    signLabel.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:signLabel];

    
#pragma mark add right honor and level image
    UIImageView *honorImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-HONOR_SIZE_WIDTH*3,LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*2 , HONOR_SIZE_WIDTH, HONOR_SIZE_HEIGHT)];
    honorImageView.image = [UIImage imageNamed:@"icon_honor"];
    [self.view addSubview:honorImageView];
    
    UILabel *honorText = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-HONOR_SIZE_WIDTH*3, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*2.5+HONOR_SIZE_HEIGHT, HONOR_SIZE_WIDTH, HEAD_PORTRAIT_MARGIN)];
    honorText.text = @"勋章";
    honorText.textColor = [UIColor lightGrayColor];
    honorText.font = [UIFont systemFontOfSize:11];
    honorText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:honorText];
    
    UIImageView *levelImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-HONOR_SIZE_WIDTH*1.5,LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*2 , HONOR_SIZE_HEIGHT, HONOR_SIZE_HEIGHT)];
    levelImageView.image = [UIImage imageNamed:@"level_cainiao"];
    levelImageView.tag = 24;
    [self.view addSubview:levelImageView];
    
    UILabel *levelText = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-HONOR_SIZE_WIDTH*1.5, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*2.5+HONOR_SIZE_HEIGHT, HONOR_SIZE_HEIGHT, HEAD_PORTRAIT_MARGIN)];
    levelText.text = @"";
    levelText.tag = 18;
    levelText.textColor = [UIColor lightGrayColor];
    levelText.font = [UIFont systemFontOfSize:11];
    levelText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:levelText];

#pragma mark add bottom line
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*4.5+HONOR_SIZE_HEIGHT, SCREEN_WIDTH, 0.1)];
    line.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line];
    
#pragma mark add grey block
    UILabel *block = [[UILabel alloc]initWithFrame:CGRectMake(0, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*4.5+HONOR_SIZE_HEIGHT+0.2, SCREEN_WIDTH, HEAD_PORTRAIT_MARGIN)];
    block.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#EFEFF4"];
    [self.view addSubview:block];
    
#pragma mark add middle content1---record
    NSInteger topHeight =LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*4.5+HONOR_SIZE_HEIGHT+0.2+HEAD_PORTRAIT_MARGIN;
    NSInteger contentHeight = LIGHT_BLACK_HEIGHT;
    
    UIImageView *contentImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*2, topHeight+(contentHeight-22)/2, 27, 22)];
    contentImageView1.image = [UIImage imageNamed:@"icon_record"];
    [self.view addSubview:contentImageView1];
    
    UILabel *contentText1 = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*1.5+contentImageView1.frame.size.width,topHeight , HEAD_PORTRAIT_SIZE, contentHeight)];
    contentText1.textColor = [UIColor blackColor];
    contentText1.text = @"骑行记录";
    contentText1.font = [UIFont systemFontOfSize:13];
    contentText1.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:contentText1];
    
    NSUInteger rightWidth = 75;
    UILabel *countLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-rightWidth, topHeight, rightWidth/2, contentHeight)];
    countLabel.text = @"--";
    countLabel.tag = 16;
    countLabel.textColor = [UIColor lightGrayColor];
    countLabel.font = [UIFont systemFontOfSize:13];
    countLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:countLabel];
    
    UIImageView *countImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-rightWidth/3, topHeight+(contentHeight-11)/2, 7, 11)];
    countImageView.image = [UIImage imageNamed:@"icon_rightarrow"];
    [self.view addSubview:countImageView];
    
    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*2, topHeight+contentHeight, SCREEN_WIDTH, 0.2)];
    line1.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line1];
    
#pragma mark add middle content2---friend circle
    
    UIImageView *contentImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*2, topHeight+contentHeight+(contentHeight-22)/2, 27, 22)];
    contentImageView2.image = [UIImage imageNamed:@"icon_fridend_cicle"];
    [self.view addSubview:contentImageView2];
    
    UILabel *contentText2 = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*1.5+contentImageView2.frame.size.width,topHeight+contentHeight , HEAD_PORTRAIT_SIZE, contentHeight)];
    contentText2.textColor = [UIColor blackColor];
    contentText2.text = @"骑友圈";
    contentText2.font = [UIFont systemFontOfSize:13];
    contentText2.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:contentText2];
    
    
    UIImageView *friendImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-rightWidth/3, topHeight+contentHeight+(contentHeight-11)/2, 7, 11)];
    friendImageView.image = [UIImage imageNamed:@"icon_rightarrow"];
    [self.view addSubview:friendImageView];
    
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*2, topHeight+contentHeight*2, SCREEN_WIDTH, 0.2)];
    line2.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line2];

#pragma mark add middle content3---recommend route
    
    UIImageView *contentImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*2, topHeight+contentHeight*2+(contentHeight-22)/2, 27, 22)];
    contentImageView3.image = [UIImage imageNamed:@"icon_recommend_route"];
    [self.view addSubview:contentImageView3];
    
    UILabel *contentText3 = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*1.5+contentImageView3.frame.size.width,topHeight+contentHeight*2 , HEAD_PORTRAIT_SIZE, contentHeight)];
    contentText3.textColor = [UIColor blackColor];
    contentText3.text = @"推荐线路";
    contentText3.font = [UIFont systemFontOfSize:13];
    contentText3.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:contentText3];
    
    
    UIImageView *recRouteImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-rightWidth/3, topHeight+contentHeight*2+(contentHeight-11)/2, 7, 11)];
    recRouteImageView.image = [UIImage imageNamed:@"icon_rightarrow"];
    [self.view addSubview:recRouteImageView];
    
    UILabel *line3 = [[UILabel alloc]initWithFrame:CGRectMake(0, topHeight+contentHeight*3, SCREEN_WIDTH, 0.2)];
    line3.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line3];
    
#pragma mark add grey block1
    UILabel *block1 = [[UILabel alloc]initWithFrame:CGRectMake(0, topHeight+contentHeight*3, SCREEN_WIDTH, HEAD_PORTRAIT_MARGIN)];
    block1.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#EFEFF4"];
    [self.view addSubview:block1];
    
#pragma mark add credit mall
    NSInteger creditContentHeight = topHeight+contentHeight*3+HEAD_PORTRAIT_MARGIN;
    
    UIImageView *creditImageView = [[UIImageView alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*2, creditContentHeight+(contentHeight-22)/2, 27, 22)];
    creditImageView.image = [UIImage imageNamed:@"icon_credit"];
    [self.view addSubview:creditImageView];
    
    UILabel *creditText = [[UILabel alloc]initWithFrame:CGRectMake(HEAD_PORTRAIT_MARGIN*1.5+creditImageView.frame.size.width,creditContentHeight , HEAD_PORTRAIT_SIZE, contentHeight)];
    creditText.textColor = [UIColor blackColor];
    creditText.text = @"积分商城";
    creditText.font = [UIFont systemFontOfSize:13];
    creditText.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:creditText];
    
    UILabel *creditLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-rightWidth*1.25, creditContentHeight, rightWidth, contentHeight)];
    creditLabel.text = @"";
    creditLabel.tag = 17;
    creditLabel.textColor = [UIColor lightGrayColor];
    creditLabel.font = [UIFont systemFontOfSize:13];
    creditLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:creditLabel];
    
    UIImageView *creditArrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-rightWidth/3, creditContentHeight+(contentHeight-11)/2, 7, 11)];
    creditArrow.image = [UIImage imageNamed:@"icon_rightarrow"];
    [self.view addSubview:creditArrow];
    
    UILabel *line4 = [[UILabel alloc]initWithFrame:CGRectMake(0, creditContentHeight+contentHeight, SCREEN_WIDTH, 0.2)];
    line4.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line4];
    
    UILabel *line5 = [[UILabel alloc]initWithFrame:CGRectMake(0, creditContentHeight, SCREEN_WIDTH, 0.2)];
    line5.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line5];
    
#pragma mark add bottom
    UILabel *block3 = [[UILabel alloc]initWithFrame:CGRectMake(0, creditContentHeight+contentHeight, SCREEN_WIDTH, [[UIScreen mainScreen]bounds].size.height-creditContentHeight-contentHeight)];
    block3.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#EFEFF4"];
    [self.view addSubview:block3];

#pragma mark add start btn
    UIImageView *startImageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-82)/2,creditContentHeight+contentHeight/2 , 82, 82)];
    startImageView.image = [UIImage imageNamed:@"icon_bike_start"];
    [self.view addSubview:startImageView];
    
    
    [self loadUserInfo];
}

#pragma mark 从网络拉取数据
-(void)loadUserInfo{
    NSString *ton = @"UxmfvA4NdsvLDqsP";
    NSString *accountId = self.accountId;
    NSLog(@"accountId=%@",accountId);
    NSString *urlStr = [NSString stringWithFormat:@"http://client.blackbirdsport.com/bk_getUserInfo?ton=%@&friendId=%@",ton,accountId];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"个人信息是：%@",result);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateUserInfo:data];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:accountId forKey:@"accountId"];
            [userDefaults synchronize];
        });
    }];
    [task resume];
    
}
#pragma mark 更新界面
-(void)updateUserInfo:(NSData *)data{
    
    
    UILabel *totalRankValue = [self.view viewWithTag:10];
    UILabel *totalScoreValue = [self.view viewWithTag:11];
    UILabel *totalDistanceValue = [self.view viewWithTag:12];
    UILabel *nickName = [self.view viewWithTag:13];
    UILabel *age = [self.view viewWithTag:14];
    UILabel *sign = [self.view viewWithTag:15];
    UILabel *count = [self.view viewWithTag:16];
    UILabel *credit = [self.view viewWithTag:17];
    UILabel *levelTitle = [self.view viewWithTag:18];
    
    UIImageView *logo = [self.view viewWithTag:20];
    UIImageView *headportrait = [self.view viewWithTag:21];
    UIImageView *genderImageView = [self.view viewWithTag:22];
    UIImageView *officalImageView = [self.view viewWithTag:23];
    UIImageView *levelImageView = [self.view viewWithTag:24];
    
    NSDictionary *jsonDirc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSString *status = [jsonDirc objectForKey:@"status"];
    if (![status isEqualToString:@"ok"]) {
        [MBProgressHUD showError:@"出现错误！"];
        return;
    }
    NSDictionary *userInfoDict = [jsonDirc objectForKey:@"userInfo"];
    NSString *totalRankStr = [userInfoDict objectForKey:@"rank"];
    totalRankValue.text = totalRankStr;
    
    NSString *totalScoreStr = [userInfoDict objectForKey:@"score"];
    totalScoreValue.text = totalScoreStr;
    
    NSString *totalDistanceStr = [userInfoDict objectForKey:@"distance"];
    NSInteger distance = [totalDistanceStr intValue];
    totalDistanceValue.text = [NSString stringWithFormat:@"%.2f",distance/1000.0];
    
    nickName.text = [userInfoDict objectForKey:@"nickname"];
    age.text = [userInfoDict objectForKey:@"age"];
    sign.text = [userInfoDict objectForKey:@"signature"];
    [logo setOnlineImage:[userInfoDict objectForKey:@"headPicture"]];
    [headportrait setOnlineImage:[userInfoDict objectForKey:@"portrait"]];
    
    NSString *countValue = [userInfoDict objectForKey:@"sportTimes"];
    count.text = [countValue stringByAppendingString:@"次"];
    
    credit.text = [userInfoDict objectForKey:@"credit"];
    
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:nickName.text attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    
    CGRect textSize = [attributedText boundingRectWithSize:(CGSize){nickName.frame.size.width,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    NSString * isOffical = [userInfoDict objectForKey:@"tags"];
    
    if (![isOffical isEqualToString:@"黑鸟官方"]) {
        officalImageView.image = [UIImage imageNamed:@""];
        officalImageView.hidden = YES;
    }else{
        officalImageView.image = [UIImage imageNamed:@"icon_offical"];
        officalImageView.hidden = NO;
    }
    officalImageView.frame =CGRectMake(2*HEAD_PORTRAIT_MARGIN+textSize.size.width, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*1.9, 23, 13);
    genderImageView.frame =CGRectMake(3*HEAD_PORTRAIT_MARGIN+textSize.size.width+officalImageView.frame.size.width, LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*1.9,30, 13);
    age.frame = CGRectMake(3*HEAD_PORTRAIT_MARGIN+textSize.size.width+officalImageView.frame.size.width+HEAD_PORTRAIT_MARGIN*1.5,LOGO_HEIGHT+HEAD_PORTRAIT_MARGIN*1.6 , HEAD_PORTRAIT_MARGIN*2 , HEAD_PORTRAIT_MARGIN*2);
    
    NSString *levelStr =[userInfoDict objectForKey:@"level"];
    NSInteger level = [levelStr integerValue];
    levelTitle.text = [LevelUtil getLevelName:level];
    levelImageView.image = [LevelUtil getLevelImage:level];
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

@end
