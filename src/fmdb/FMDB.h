#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double FMDBVersionNumber;
FOUNDATION_EXPORT const unsigned char FMDBVersionString[];

@class FMDatabaseQueue;

@interface FMDB : NSObject

@property(nonatomic, strong)FMDatabaseQueue *queue;

+ (instancetype)shareInstance;
+ (instancetype)databaseQueueSingletonWithPath:(NSString*)aPath;

@end