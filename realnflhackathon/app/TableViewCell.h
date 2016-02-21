//
//  TableViewCell.h
//  nflhackathon
//
//  Created by Kevin Fang on 2/20/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *awayTeam;
@property (weak, nonatomic) IBOutlet UILabel *homeTeam;

@end
