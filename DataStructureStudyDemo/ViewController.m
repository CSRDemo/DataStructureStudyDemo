//
//  ViewController.m
//  DataStructureStudyDemo
//
//  Created by User on 2017/3/7.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "ViewController.h"
#import "TimeStudy.h"
#import <stdio.h>
#import <time.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)GoToStudyController:(UIButton *)sender {
    
   // clock() 捕捉程序从开始到运行到click（）被调用时所耗的时间，这个时间单位是click tick，即 时钟打点
    //CLK_TCK 机器时钟每秒所走的时钟打点数
    clock_t start,stop;
    double duration_time; //
    
    start = clock(); //开始计时
    
    TimeStudy *studyVC = [[TimeStudy alloc] init];
    [self.navigationController pushViewController:studyVC animated:YES];
    
    stop = clock(); //结束计时
    duration_time = (double)(stop - start)/CLK_TCK;
    NSLog(@"----%f",duration_time);
    
}

- (IBAction)CompareProcedureEfficiency:(UIButton *)sender {
    
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    
    [self method1:10000];
    
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"for循环程序1 in %f ms", linkTime *1000.0);//打印出来为代码执行时间 单位ms
}

- (IBAction)CompareProcedureEfficiency2:(UIButton *)sender {
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();

    [self method2:10000];
    
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"递归程序2 in %f ms", linkTime *1000.0);//打印出来为代码执行时间 单位ms

}


//依次输出1-n之间的正整数 for循环
- (void)method1:(NSInteger)n
{
    for (NSInteger i = 1; i<= n; i++) {
        NSLog(@"%ld",i);
    }
}
//依次输出1-n之间的正整数  递归
- (void)method2:(NSInteger)n
{
    if (n) {
        [self method2:n-1];
        NSLog(@"%ld",n);
    }
    return;
}


@end
