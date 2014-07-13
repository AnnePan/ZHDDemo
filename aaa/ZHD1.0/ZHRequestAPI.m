//
//  ZHRequestAPI.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-9.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHRequestAPI.h"
#import "PJUserModel.h"
#import "PJQuestionModel.h"
#import "PJNewsModle.h"
#import "ZHClanModel.h"
@implementation ZHRequestAPI


+ (NSArray *)requestContacts
{
    NSMutableArray *userArr = [[NSMutableArray alloc] init];
    [userArr addObject:[self setUserName:@"余力" photoPagh:@"picn1" company:@"杭州天航会议服务有限公司董事长" firstWord:@"Y" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"周亮" photoPagh:@"picv1" company:@"来电科技（上海）有限公司创始人" firstWord:@"Z" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"张向东" photoPagh:@"picn2" company:@"正骨（北京）农业发展有限公司董事长" firstWord:@"Z" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段但偶尔我在别人的脸上,会看到你的微笑,我来到回忆里的长廊,看着我们的青春" fires:@[@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"张绳结" photoPagh:@"picv2" company:@"大连新芽打软件科技有限公司董事长" firstWord:@"Z" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"曾名" photoPagh:@"picn3" company:@"卓尔商业控股集团公司董事长" firstWord:@"Z" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想" fires:@[@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"郑摇落" photoPagh:@"picn4" company:@"上海洪瑞投资管理有限公司董事长" firstWord:@"Z" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段但偶尔我在别人的脸上,会看到你的微笑,我来到回忆里的长廊,看着我们的青春" fires:@[@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"袁吃撑" photoPagh:@"picn5" company:@"上海力安软件技术有限公司董事长" firstWord:@"Y" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"许晴" photoPagh:@"picn9" company:@"安徽中心机缘信息技术有限公司总经理" firstWord:@"X" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"吴强" photoPagh:@"picv3" company:@"正和岛副总裁" firstWord:@"W" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"陶如" photoPagh:@"picn9" company:@"西和资本董事长" firstWord:@"T" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"宋几朝" photoPagh:@"picn7" company:@"阿超灯饰有限公司董事长" firstWord:@"S" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"任红军" photoPagh:@"picv4" company:@"河南捍卫电子科技有限公司董事长" firstWord:@"R" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"潘淘" photoPagh:@"picn8" company:@"北京摩卡软件有限公司总经理" firstWord:@"P" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"南聪慧" photoPagh:@"picn2" company:@"正泰集团股份有限公司董事长" firstWord:@"N" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"毛东来" photoPagh:@"picn5" company:@"常州神仙草生物科技有限公司董事长" firstWord:@"M" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段但偶尔我在别人的脸上,会看到你的微笑,我来到回忆里的长廊,看着我们的青春" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"凌明峰" photoPagh:@"picn1" company:@"州命科技董事长" firstWord:@"L" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    
    [userArr addObject:[self setUserName:@"高小郑" photoPagh:@"picv5" company:@"丝买拖企业发展有限公司总经理" firstWord:@"G" directions:@"偶尔看到秋千在荡漾,记忆会随之轻泛,偶尔看到风筝在飞翔,想起未圆的梦想年年月月,我们慢慢成长,却遗忘 多少的片段" fires:@[@"张三",@"李四",@"王五"]]];
    return userArr;
}

+ (PJUserModel *)setUserName:(NSString *)name photoPagh:(NSString *)path company:(NSString *)company firstWord:(NSString *)fWord directions:(NSString *)dir fires:(NSArray *)fires
{
    PJUserModel *user = [[PJUserModel alloc] init];
    user.uName = name;
    user.uPicPath = path;
    user.uCompany = company;
    user.uFirstWord = fWord;
    user.uFireDirections = dir;
    user.uFires = fires;
    return user;
}

+ (NSArray *)requestEveryDayq
{
    NSMutableArray *quesArr = [[NSMutableArray alloc] init];
    NSArray *arr = [self requestContacts];
    for (PJUserModel *user in arr) {
        [quesArr addObject:[self setQestUserName:user.uName photoPagh:user.uPicPath qTitle:@"转型期引入空降兵需要注意什么？" transfers:nil addtions:nil time:@"2014-04-07 07:30"]];
    }
    return quesArr;
}

+ (PJQuestionModel *)setQestUserName:(NSString *)name photoPagh:(NSString *)path qTitle:(NSString *)title transfers:(NSArray *)transArr addtions:(NSArray *)addArr time:(NSString *)timeStr
{
    PJQuestionModel *question = [[PJQuestionModel alloc] init];
    question.uName = name;
    question.uPicPath = path;
    question.qTitle = title;
    question.qTransfers = @[@{},@{},@{}];
    question.qAddtions = @[@{},@{}];
    question.qTimeStr = timeStr;
    return question;
}

+ (NSArray *)requestNews
{
    NSMutableArray *newsArr = [[NSMutableArray alloc] init];
    for (int i = 9; i > 0; i--) {
        PJNewsModle *news = [[PJNewsModle alloc] init];
        news.nTitle = [NSString stringWithFormat:@"张瑞鸣：本地手机报数据%d",i];
        news.nTime = [NSString stringWithFormat:@"2014-07-0%d",i];
        news.nUrlStr = @"http://www.qq.com";
        [newsArr addObject:news];
    }
    return newsArr;
}

+ (NSArray *)requestClans
{
    NSMutableArray *clanArr = [[NSMutableArray alloc] init];
    [clanArr addObject:[self setClanName:@"广场" isSysClan:YES  cPhotoPath:@"" memCount:0 introduce:@"正和岛大圈子" lastPer:nil lastWord:nil lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"电商部落（活力部落）" isSysClan:NO  cPhotoPath:@"" memCount:87 introduce:@"正和岛大圈子" lastPer:@"连惠斌" lastWord:@"太好了" lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"中国创意产业联盟" isSysClan:NO  cPhotoPath:@"" memCount:1 introduce:@"正和岛大圈子" lastPer:@"王玉贤" lastWord:@"吝啬的周鸿伟为何肯投资他" lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"正和岛&优兰汇" isSysClan:NO  cPhotoPath:@"" memCount:543 introduce:@"正和岛大圈子" lastPer:@"王玉贤" lastWord:@"我到处发消息阿" lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"岛亲大家庭" isSysClan:NO  cPhotoPath:@"" memCount:33 introduce:@"正和岛大圈子" lastPer:@"王玉贤" lastWord:@"我对信奉宗教的真正理解" lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"正和岛投资并购俱乐部" isSysClan:NO cPhotoPath:@"" memCount:2 introduce:@"正和岛大圈子" lastPer:@"李霄云" lastWord:@"谢谢袁总" lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"[正和岛直播间]" isSysClan:NO  cPhotoPath:@"" memCount:45 introduce:@"正和岛大圈子" lastPer:@"周国锋" lastWord:@"大家早上好，欢迎大家的到来" lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"消息提醒" isSysClan:YES  cPhotoPath:@"" memCount:0 introduce:@"管理是我们使用最为频繁的一个词" lastPer:nil lastWord:nil lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"林鸣风" isSysClan:NO  cPhotoPath:@"" memCount:23 introduce:@"您好！" lastPer:nil lastWord:nil lastTime:@"14-7-5"]];
    
    [clanArr addObject:[self setClanName:@"正和岛商业互助部落" isSysClan:NO  cPhotoPath:@"" memCount:6 introduce:@"正和岛大圈子" lastPer:@"晓驿" lastWord:@"7月21日第二次大会开始" lastTime:@"14-7-5"]];
    return clanArr;
}

+ (ZHClanModel *)setClanName:(NSString *)name isSysClan:(BOOL)isSys cPhotoPath:(NSString *)path memCount:(int)count introduce:(NSString *)introduce lastPer:(NSString *)lastPer lastWord:(NSString *)word lastTime:(NSString *)time
{
    ZHClanModel *clan = [[ZHClanModel alloc] init];
    clan.cName = name;
    clan.cPhotoPaht = path;
    clan.cMemberCount = count;
    clan.cIntroduce = introduce;
    clan.cLastWord = word;
    clan.cLastWorder = lastPer;
    clan.cLastWordTime = time;
    return clan;
}
@end
