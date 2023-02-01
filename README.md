利用Objc Runtime实现的JSON和Model互相转换的demo，仅供学习参考。

实际工程项目中，你应该选择YYModel、MJExtension这种功能和稳定性更高的框架。

```objective-c
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

// {"hobby":[[1,3],{"name":"旺财","age":2},[{"name":"旺财","age":2},666]],"age":24,"QA":{"你真帅!":"谢谢~","这个项目是什么？":"一个简单的JSON和Model互转的工程"},"pet":{"name":"旺财","age":2}}
```