//
//  ViewController.m
//  mrc）通用宏
//
//  Created by hong chen on 2016/12/26.
//  Copyright © 2016年 hong chen. All rights reserved.
//

#import "ViewController.h"
#import "CSYTool.h"
#import "CSYFile.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}

//  单例不能使用继承（可以用通用宏来弥补）
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
#if __has_feature(objc_arc)
NSLog(@"Arc");
#else
NSLog(@"mrc");
#endif
    CSYTool * tool = [[CSYTool alloc]init];
    
    CSYTool * tool1 = [CSYTool shareTool];
    CSYTool * tool2 = [CSYTool new];
    CSYTool * tool3 = [tool1 copy];
    CSYTool * tool4 = [tool1 mutableCopy];
    
    NSLog(@"%p\t%p\t%p\t%p\t%p\t",tool,tool1,tool2,tool3,tool4);

    CSYFile * file = [CSYFile new];
    CSYFile * file2 = [CSYFile shareFile];
    NSLog(@"tool = %@\ttool2 = %@\tfile=%@\tfile2=%@",tool,tool1,file,file2);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
