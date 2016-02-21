//
//  ViewController.m
//  nflhackathon
//
//  Created by Kevin Fang on 2/20/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import "gamecastViewController.h"
#import <Firebase/Firebase.h>
//#import <AFNetworking/AFURLRequestSerialization.h>
#import <AFNetworking/AFNetworking.h>
#import <Foundation/Foundation.h>


@interface gamecastViewController (){
    
    __weak IBOutlet UIView *otherView;
    __weak IBOutlet UIBarButtonItem *last;
    __weak IBOutlet UIBarButtonItem *next;
    __weak IBOutlet UILabel *time;
}


@end

@implementation gamecastViewController

#define _width self.view.frame.size.width
#define _height self.view.frame.size.height
#define gridwidth otherView.frame.size.width/120
#define gridheight otherView.frame.size.height/120

#define startingline self.view.frame.size.height/1.1

int file=0;

- (IBAction)next:(id)sender {
    if(_indexcheck == 0){
        if(file == 840){
            NSLog(@"same is %d",file);

            next.enabled = NO;
        }
        else{
            file = file + 5;
            NSLog(@"same is %d",file);


            last.enabled = YES;
        }
    }
    else if(_indexcheck == 1){
        if (file == 915){
            next.enabled = NO;
        }
        else{
            file = file +5;
            last.enabled = YES;
        }
    }
    else{
        if(file == 965){
            next.enabled = NO;
        }
        else{
            file = file+5;
            last.enabled = YES;

        }
    }
}


- (IBAction)last:(id)sender {
    if(file <= 0){
        last.enabled = NO;
    }
    else{
        file = file-5;
    }
    NSLog(@"derp is %d",file);

}





- (void)viewDidLoad {
    [super viewDidLoad];
    
//    miniUniform.alpha = 0;
    Firebase *ref = [[Firebase alloc] initWithUrl: @"https://nflhackathonthingy.firebaseio.com"];

    [ref observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
//        NSLog(@"%@ -> %@", snapshot.key, snapshot.value);
        float xlocation = [snapshot.value[@"x"] floatValue];
        float ylocation = [snapshot.value[@"y"] floatValue];
//        [self drawPath:xlocation,ylocation];
    }];

    
    if(_indexcheck == 0){
        [[ref queryOrderedByChild:@"game1"]
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
            NSLog(@"They're doing %@ meters", snapshot.value);
            NSLog(@"%@", snapshot.value);
            float x = [snapshot.value[@"x"] floatValue];
            float y = [snapshot.value[@"y"] floatValue];
             //         time.text = (@"%@", snapshot.value[@"time"]);
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(50, startingline)];
            [path addLineToPoint:CGPointMake(x, y)];
                 
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path = [path CGPath];
            shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
            shapeLayer.lineWidth = 2.0;
            shapeLayer.fillColor = [[UIColor clearColor] CGColor];
                 
            [self.view.layer addSublayer:shapeLayer];
                 
            UIImage* image = [UIImage imageNamed:@"miniUniform"];
            UIImageView* miniJersey = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100.0, 50, 30)];
            miniJersey.image = image;
            [self.view addSubview:miniJersey];
         }];

    }
    else if (_indexcheck == 1){
        [[ref queryOrderedByChild:@"game2"]
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             NSLog(@"They're doing %@ meters", snapshot.value);
             NSLog(@"%@", snapshot.value);
             float x = [snapshot.value[@"x"] floatValue];
             float y = [snapshot.value[@"y"] floatValue];
             //         time.text = (@"%@", snapshot.value[@"time"]);
             UIBezierPath *path = [UIBezierPath bezierPath];
             [path moveToPoint:CGPointMake(50, startingline)];
             [path addLineToPoint:CGPointMake(x, y)];
             
             CAShapeLayer *shapeLayer = [CAShapeLayer layer];
             shapeLayer.path = [path CGPath];
             shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
             shapeLayer.lineWidth = 2.0;
             shapeLayer.fillColor = [[UIColor clearColor] CGColor];
             
             [self.view.layer addSublayer:shapeLayer];
             
             UIImage* image = [UIImage imageNamed:@"miniUniform"];
             UIImageView* miniJersey = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100.0, 50, 30)];
             miniJersey.image = image;
             [self.view addSubview:miniJersey];
         }];
    }
    else{
        [[ref queryOrderedByChild:@"game3"]
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             NSLog(@"They're doing %@ meters", snapshot.value);
             NSLog(@"%@", snapshot.value);
             float x = [snapshot.value[@"x"] floatValue];
             float y = [snapshot.value[@"y"] floatValue];
             //         time.text = (@"%@", snapshot.value[@"time"]);
             UIBezierPath *path = [UIBezierPath bezierPath];
             [path moveToPoint:CGPointMake(50, startingline)];
             [path addLineToPoint:CGPointMake(x, y)];
             
             CAShapeLayer *shapeLayer = [CAShapeLayer layer];
             shapeLayer.path = [path CGPath];
             shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
             shapeLayer.lineWidth = 2.0;
             shapeLayer.fillColor = [[UIColor clearColor] CGColor];
             
             [self.view.layer addSublayer:shapeLayer];
             
             UIImage* image = [UIImage imageNamed:@"miniUniform"];
             UIImageView* miniJersey = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100.0, 50, 30)];
             miniJersey.image = image;
             [self.view addSubview:miniJersey];
         }];

    }
    // Do any additional setup after loading the view.
}

- (BOOL)isModal {
    return self.presentingViewController.presentedViewController == self
    || (self.navigationController != nil && self.navigationController.presentingViewController.presentedViewController == self.navigationController)
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

-(void)animateStrokeEnd:(CGFloat)_strokeEnd {

}
int count;

-(void) tick:(NSTimer*)timer
{
    count = count - 1;
//    label.text = [NSString stringWithFormat:@"%d",count];
    if(count == 0)
    {
        count = 1;
//        [self capture];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//put after drawPath when ir works
- (void)drawPath:(CGFloat)xlocation,ylocation
{
    Firebase *ref = [[Firebase alloc] initWithUrl: @"https://nflhackathonthingy.firebaseio.com"];
    int numberofplayer=11;

    [[ref queryOrderedByChild:@"derp/gsisPlayId"]
     observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
         NSLog(@"They're doing %@ meters", snapshot.value);
         NSLog(@"%@", snapshot.value);

//         time.text = (@"%@", snapshot.value[@"time"]);
         for(int index = 0; index<=numberofplayer; index++){
             UIBezierPath *path = [UIBezierPath bezierPath];
             [path moveToPoint:CGPointMake(50, startingline)];
             [path addLineToPoint:CGPointMake(xlocation, ylocation)];
             
             CAShapeLayer *shapeLayer = [CAShapeLayer layer];
             shapeLayer.path = [path CGPath];
             shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
             shapeLayer.lineWidth = 2.0;
             shapeLayer.fillColor = [[UIColor clearColor] CGColor];
             
             [self.view.layer addSublayer:shapeLayer];
             
             UIImage* image = [UIImage imageNamed:@"miniUniform"];
             UIImageView* miniJersey = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100.0, 50, 30)];
             miniJersey.image = image;
             [self.view addSubview:miniJersey];
         }
     }];
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
