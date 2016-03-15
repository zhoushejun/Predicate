//
//  main.m
//  Predicate
//
//  Created by shejun.zhou on 15/11/28.
//  Copyright © 2015年 shejun.zhou. All rights reserved.
//

/**
 谓词运算
 参考博客：http://blog.csdn.net/likendsl/article/details/7570181
 */
#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //基本的查询
        NSPredicate *predicate;
        predicate = [NSPredicate predicateWithFormat: @"name == 'Herbie'"];
        
        //在整个cars里面循环比较
        predicate = [NSPredicate predicateWithFormat: @"engine.horsepower > 150"];
        
        //输出完整的信息
        predicate = [NSPredicate predicateWithFormat: @"engine.horsepower > 150"];
        
        //含有变量的谓词
        NSPredicate *predicateTemplate = [NSPredicate predicateWithFormat:@"name == $NAME"];
        NSDictionary *varDict;
        varDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Herbie", @"NAME", nil];
        predicate = [predicateTemplate predicateWithSubstitutionVariables: varDict];
       
        //谓词字符窜还支持c语言中一些常用的运算符
        predicate = [NSPredicate predicateWithFormat:@"(engine.horsepower > 50) AND (engine.horsepower < 200)"];
        
        predicate = [NSPredicate predicateWithFormat: @"name < 'Newton'"];
        
        //强大的数组运算符
        predicate = [NSPredicate predicateWithFormat:@"engine.horsepower BETWEEN { 50, 200 }"];
       
        NSArray *betweens = [NSArray arrayWithObjects:[NSNumber numberWithInt: 50], [NSNumber numberWithInt: 200], nil];
        predicate = [NSPredicate predicateWithFormat: @"engine.horsepower BETWEEN %@", betweens];
        
        predicateTemplate = [NSPredicate predicateWithFormat: @"engine.horsepower BETWEEN $POWERS"];
        
        varDict = [NSDictionary dictionaryWithObjectsAndKeys: betweens, @"POWERS", nil];
        predicate = [predicateTemplate predicateWithSubstitutionVariables: varDict];
        
        //IN运算符
        predicate = [NSPredicate predicateWithFormat: @"name IN { 'Herbie', 'Snugs', 'Badger', 'Flap' }"];
        
        predicate = [NSPredicate predicateWithFormat: @"SELF.name IN { 'Herbie', 'Snugs', 'Badger', 'Flap' }"];
        
        predicate = [NSPredicate predicateWithFormat: @"SELF IN { 'Herbie', 'Snugs', 'Badger', 'Flap' }"];
        
        //BEGINSWITH,ENDSWITH,CONTAINS
        
        //附加符号，[c],[d],[cd],c表示不区分大小写，d表示不区分发音字符，cd表示什么都不区分
        predicate = [NSPredicate predicateWithFormat: @"name BEGINSWITH 'Bad'"];
        
        predicate = [NSPredicate predicateWithFormat: @"name BEGINSWITH 'HERB'"];
        
        predicate = [NSPredicate predicateWithFormat: @"name BEGINSWITH[cd] 'HERB'"];
        
        //LIKE运算符（通配符）  
        predicate = [NSPredicate predicateWithFormat: @"name LIKE[cd] '*er*'"];  
        
        predicate = [NSPredicate predicateWithFormat: @"name LIKE[cd] '???er*'"];
    }
    return 0;
}
