//
//  NSObject+JSONModel.h
//  JSONModel
//
//  Created by jane on 2023/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JSONModel)

+ (instancetype)mm_modelWithJSONString:(NSString *)jsonString;
+ (instancetype)mm_modelWithJSONObject:(NSDictionary *)json;

- (NSString *)mm_modelToJSONString;
- (NSDictionary *)mm_modelToJSONObject;

@end

NS_ASSUME_NONNULL_END
