//
//  ViewController.m
//  nflhackathon
//
//  Created by Kevin Fang on 2/20/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import "gamecastViewController.h"
#import <Firebase/Firebase.h>

@interface gamecastViewController (){
    
    __weak IBOutlet UIBarButtonItem *last;
    __weak IBOutlet UIBarButtonItem *next;
}

@end

@implementation gamecastViewController

@synthesize file;

- (IBAction)next:(id)sender {
    if(_indexcheck == 0){
        if(file == 840){
            next.enabled = NO;
        }
        else{
            file = file +5;
        }
    }
    else if(_indexcheck == 1){
        if (file == 915){
            next.enabled = NO;
        }
        else{
            file = file +5;
        }
    }
    else{
        if(file == 965){
            next.enabled = NO;
        }
        else{
            file = file+5;
        }
    }
}


- (IBAction)last:(id)sender {
    if(file == 0){
        last.enabled = NO;
    }
    else{
        file = file-5;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[[Firebase alloc] initWithUrl:@"https:/ /nflhackathonthing.firebaseio.com"] childByAppendingPath:@"file"] setValue:[NSNumber numberWithInt:file]];

    if(_indexcheck == 0){
        // use game 1 data
    }
    else if (_indexcheck == 1){
        // use game 2 data
    }
    else{
        //use game 3 data
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
