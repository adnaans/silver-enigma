//
//  ViewController.m
//  nflhackathon
//
//  Created by Kevin Fang on 2/20/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import "gamecastViewController.h"

@interface gamecastViewController ()

@end

@implementation gamecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(_indexcheck == 0){
        NSLog(@"derpherpderp");
    }
    else if (_indexcheck == 1){
        NSLog(@"derpherp");
    }
    else{
        NSLog(@"same");
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
