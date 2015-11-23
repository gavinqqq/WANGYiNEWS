//
//  DataPerson.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DataPerson.h"
#import <sqlite3.h>
#import "Person.h"
@implementation DataPerson

static DataPerson * dataPerson =nil;

+ (DataPerson *)shareDataNase{
    @synchronized(self) {
        if (dataPerson ==nil) {
            dataPerson =[[DataPerson alloc]init];
            [dataPerson openDB ];
            [dataPerson openDBOfMovie];
        }
    }
    return dataPerson;
}
//创建一个数据库
static sqlite3 *db = nil;
static sqlite3 *dbOfMovie = nil;
static sqlite3 *dbOfActivity = nil;

- (void)openDB{
    if (db!=nil) {
        return;
    }
    NSString *documentPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask , YES)lastObject];
    NSString *stringPath =[documentPath stringByAppendingString:@"/Person.sqlite"];
    // 打开数据库
    int result = sqlite3_open([stringPath UTF8String], &db);
    if (result == 0) {
        NSLog(@"数据库打开");
        // 准备sql语句
        NSString *sql = @"CREATE TABLE Person (name TEXT PRIMARY KEY NOT NULL, passWord TEXT NOT NULL, mailbox TEXT, contactWay TEXT);";
        // 执行sql语句
        sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
    }else{
        NSLog(@"错误代码%d", result);
    }
}
- (void)closeDB{
    int result = sqlite3_close(db);
    if (result == 0) {
        NSLog(@"关闭成功");
    }else{
        NSLog(@"错误代码%d", result);
    }
}

- (void)addPerson:(Person *)person{
    // 打开数据库
    [self openDB];
    // 创建跟随指针
    sqlite3_stmt *stmt = nil;
    // 准备sql语句
    NSString *sql = @"INSERT INTO Person (name,passWord,mailbox,contactWay) VALUES (?,?,?,?)";
    
    // 验证sql
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"插入成功");
        // 绑定
        sqlite3_bind_text(stmt, 1, [person.name UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [person.passWord UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 3, [person.mailbox UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 4, [person.contactWay UTF8String], -1, NULL);
        // 执行
        sqlite3_step(stmt);
    }else{
        NSLog(@"82行%d", result);
    }
    // 释放
    sqlite3_finalize(stmt);
}
- (Person *)selectPersonWithName:(NSString *)name;{
    [self openDB];
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"SELECT * FROM Person WHERE name = ?";
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    Person *person = [Person new];
    if (result == 0) {
        NSLog(@"查询成功");
        sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);
        while (sqlite3_step(stmt) == 100) {
            // 取出person
            NSString *name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            NSString *passWord = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            NSString *mailbox = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            NSString *contactWay = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            person.name = name;
            person.passWord = passWord;
            person.mailbox = mailbox;
            person.contactWay = contactWay;
            
        }
        sqlite3_finalize(stmt);
        return person;
        
    }else{
        NSLog(@"169行%d", result);
    }
    sqlite3_finalize(stmt);
    return nil;
}

- (void)openDBOfMovie{
    // 判断是否是打开状态
    if (dbOfMovie != nil) {
        return;
    }
    // 创建一个数据库
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *stringPath = [documentPath stringByAppendingString:@"/Movie.sqlite"];
    // 打开数据库
    int result = sqlite3_open([stringPath UTF8String], &dbOfMovie);
    if (result == 0) {
        NSLog(@"数据库打开");
        // 准备sql语句
        NSString *sql = @"CREATE TABLE Movie (title TEXT NOT NULL, name TEXT NOT NULL);";
        // 执行sql语句
        sqlite3_exec(dbOfMovie, [sql UTF8String], NULL, NULL, NULL);
    }else{
        NSLog(@"错误代码%d", result);
    }
    
}

- (void)closeDBOfMovie{
    int result = sqlite3_close(dbOfMovie);
    if (result == 0) {
        NSLog(@"关闭成功");
    }else{
        NSLog(@"错误代码%d", result);
    }
}

- (void)addTitle:(NSString *)title name:(NSString *)name{
    // 打开数据库
    [self openDBOfMovie];
    // 创建跟随指针
    sqlite3_stmt *stmt = nil;
    // 准备sql语句
    NSString *sql = @"INSERT INTO Movie (title,name) VALUES (?,?)";
    
    // 验证sql
    int result = sqlite3_prepare(dbOfMovie, [sql UTF8String], -1, &stmt, NULL);
    if (result == 0) {
        NSLog(@"插入成功");
        // 绑定
        
        sqlite3_bind_text(stmt, 1, [title UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [name UTF8String], -1, NULL);
        // 执行
        sqlite3_step(stmt);
    }else{
        NSLog(@"插入错误%d", result);
    }
    // 释放
    sqlite3_finalize(stmt);
    
}

- (NSArray *)selectAllTitleWithName:(NSString *)name{
    [self openDBOfMovie];
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"SELECT * FROM Movie WHERE name = ?";
    int result = sqlite3_prepare(dbOfMovie, [sql UTF8String], -1, &stmt, NULL);
    if (result == 0) {
        NSLog(@"查询成功");
        sqlite3_bind_text(stmt, 1, [name UTF8String], -1, nil);
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
        while (sqlite3_step(stmt) == 100) {
            
            NSString *title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            //            NSString *name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            [array addObject:title];
            
        }
        sqlite3_finalize(stmt);
        return array;
    }else{
        NSLog(@"错误信息%d", result);
    }
    sqlite3_finalize(stmt);
    return nil;
}


- (void)openDBOfActivity{
    // 判断是否是打开状态
    if (dbOfActivity != nil) {
        return;
    }
    // 创建一个数据库
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *stringPath = [documentPath stringByAppendingString:@"/Movie.sqlite"];
    // 打开数据库
    int result = sqlite3_open([stringPath UTF8String], &dbOfActivity);
    if (result == 0) {
        NSLog(@"数据库打开");
        // 准备sql语句
        NSString *sql = @"CREATE TABLE Activity (title TEXT NOT NULL, name TEXT NOT NULL);";
        // 执行sql语句
        sqlite3_exec(dbOfActivity, [sql UTF8String], NULL, NULL, NULL);
    }else{
        NSLog(@"错误代码%d", result);
    }
    
}

- (void)closeDBOfActivity{
    int result = sqlite3_close(dbOfActivity);
    if (result == 0) {
        NSLog(@"关闭成功");
    }else{
        NSLog(@"错误代码%d", result);
    }
}

- (void)addTitle1:(NSString *)title name:(NSString *)name{
    // 打开数据库
    [self openDBOfActivity];
    // 创建跟随指针
    sqlite3_stmt *stmt = nil;
    // 准备sql语句
    NSString *sql = @"INSERT INTO Activity (title,name) VALUES (?,?)";
    
    // 验证sql
    int result = sqlite3_prepare(dbOfActivity, [sql UTF8String], -1, &stmt, NULL);
    if (result == 0) {
        NSLog(@"插入成功");
        // 绑定
        
        sqlite3_bind_text(stmt, 1, [title UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [name UTF8String], -1, NULL);
        // 执行
        sqlite3_step(stmt);
    }else{
        NSLog(@"插入错误%d", result);
    }
    // 释放
    sqlite3_finalize(stmt);
    
}

- (NSArray *)selectAllTitle1WithName:(NSString *)name{
    [self openDBOfActivity];
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"SELECT * FROM Activity WHERE name = ?";
    int result = sqlite3_prepare(dbOfActivity, [sql UTF8String], -1, &stmt, NULL);
    if (result == 0) {
        NSLog(@"查询成功");
        sqlite3_bind_text(stmt, 1, [name UTF8String], -1, nil);
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
        while (sqlite3_step(stmt) == 100) {
            
            NSString *title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            //            NSString *name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            [array addObject:title];
            
        }
        sqlite3_finalize(stmt);
        return array;
    }else{
        NSLog(@"错误信息%d", result);
    }
    sqlite3_finalize(stmt);
    return nil;
}

@end
