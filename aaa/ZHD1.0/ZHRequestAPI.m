//
//  ZHRequestAPI.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-9.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHRequestAPI.h"
#import "PJUserModel.h"

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
@end
