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
    
    __weak IBOutlet UIView *otherView;
    __weak IBOutlet UIBarButtonItem *last;
    __weak IBOutlet UIBarButtonItem *next;
}


@end

@implementation gamecastViewController

#define _width self.view.frame.size.width
#define _height self.view.frame.size.height
#define gridwidth otherView.frame.size.width/100
#define gridheight otherView.frame.size.height/100

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

    [[[[Firebase alloc] initWithUrl:@"https://nflhackathonthingy.firebaseio.com"] childByAppendingPath:@"file"] setValue:[NSNumber numberWithInt:file]];
    int numberofplayer=11;
    
    [self drawPath];

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

-(void)animateStrokeEnd:(CGFloat)_strokeEnd {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//:(CGFloat)_xlocation,ylocation
//put after drawPath when ir works
- (void)drawPath{

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(_width/4, startingline)];
    [path addLineToPoint:CGPointMake(100.0, 100.0)];
    [path addLineToPoint:CGPointMake(150.0, 200)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];

    UIImage *image = [[]
    UIImageView* miniJersey = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    miniJersey.image = image;
    [self.view addSubview:capturedView];
    

    [self.view.layer addSublayer:shapeLayer];
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
