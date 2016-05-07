//
//  FMDB.m
//  fmdb
//
//  Created by zxiou on 16/4/28.
//
//

#import "FMDB.h"
#import "FMDatabaseQueue.h"

@interface FMDB ()

@property(nonatomic, strong)FMDB *database;

@end

@implementation FMDB

#pragma mark - Define a single instance of the class

// 通用单例模式接口
+ (instancetype)shareInstance
{
    return [[self alloc] init];
}

+ (instancetype)databaseQueueSingletonWithPath:(NSString*)aPath
{
    return [[self alloc] initWithPath:aPath];
}

// 初始化方法
- (instancetype)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{            // 确保只进行一次达到单例的目的
        _instance = [super init];
    });

    return _dbHandle;
}

- (instancetype)initWithPath:WithPath:(NSString*)aPath
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{            // 确保只进行一次达到单例的目的
        _dbHandle = [super init];
        _queue = [FMDatabaseQueue databaseQueueWithPath:dataBasePath];
    });

    return _dbHandle;
}

// alloc会调用allocWithZone:
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static FMDB *_dbHandle = nil; // 首先声明一个单例static对象

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{            // 确保只进行一次达到单例的目的
        _dbHandle = [super allocWithZone:zone];
    });

    return _dbHandle;
}

// copy在底层会调用copyWithZone:
- (id)copyWithZone:(NSZone *)zone
{
    return  _dbHandle;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return _dbHandle;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _dbHandle;
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return _dbHandle;
}

@end