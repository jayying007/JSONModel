//
//  main.m
//  JSONModel
//
//  Created by janezhuang on 2023/2/1.
//

#import <Foundation/Foundation.h>
#import "NSObject+JSONModel.h"

@interface Dog : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) int age;
@end

@implementation Dog
- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@,age:%d", _name, _age];
}
@end

@interface Person : NSObject
@property (nonatomic) Dog *pet;
@property (nonatomic) NSArray *hobby;
@property (nonatomic) int age;
@property (nonatomic) NSDictionary *QA;
@end

@implementation Person
- (NSString *)description {
    return [NSString stringWithFormat:@"pet:%@,hobby:%@,age:%d,QA:%@", _pet, _hobby, _age, _QA];
}
@end


void test1() {
    Person *person = [Person mm_modelWithJSONString:@"{\"hobby\":[\"Sing\",\"Dance\",\"Programing\",6],"
                                                        "\"age\":24,"
                                                        "\"pet\":{\"name\":\"旺财\",\"age\":2},"
                                                        "\"QA\":{"
                                                            "\"What is this project？\":\"A demo show conversion between json and model.\","
                                                            "\"You are handsome!\":\"Thanks~\"}"
                                                    "}"];
    NSLog(@"%@", person);
}

void test2() {
    Dog *dog = [Dog new];
    dog.name = @"旺财";
    dog.age = 2;
    Person *person = [Person new];
    person.pet = dog;
    person.hobby = @[ @[@(1), @(3)], dog, @[ dog, @(666) ] ]; // 实际项目中应该是相同类型的元素
    person.age = 24;
    person.QA = @{ @"这个项目是什么？" : @"一个简单的JSON和Model互转的工程", @"你真帅!" : @"谢谢~" };
    
    NSString *jsonString = [person mm_modelToJSONString];
    NSLog(@"%@", jsonString);
}

int main(int argc, const char * argv[]) {
    test1();
    test2();

    return 0;
}
