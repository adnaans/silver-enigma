//
//  ViewController.h
//  nflhackathon
//
//  Created by Kevin Fang on 2/20/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tableViewController.h"

@interface gamecastViewController : UIViewController
@property (strong, nonatomic) tableViewController *indexcheck;

@property (weak) IBOutlet NSInteger *file;

@end
