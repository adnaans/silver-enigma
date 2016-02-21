//
//  tableViewController.m
//  nflhackathon
//
//  Created by Kevin Fang on 2/20/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import "tableViewController.h"
#import "TableViewCell.h"
#import "gameCastViewController.h"
#import <Firebase/Firebase.h>

@interface tableViewController(){
    
}
@end
#define _width self.view.frame.size.width
#define _height self.view.frame.size.height

@implementation tableViewController{
    NSArray *tableData;
}
@synthesize indexcheck;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    tableData= [[NSArray alloc] initWithObjects:@"",@"", nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//        [[[[Firebase alloc] initWithUrl:@"https:/ /nflhackathonthing.firebaseio.com"] childByAppendingPath:@"concussion"] setValue:[NSNumber numberWithInt:concussion]];
    
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
////    cell.yourbutton.tag = indexPath.row;
//    
//    return cell;
//    
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



#pragma mark - UITableViewDataSource Protocol Functions

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //NSLog(@"%i", indexPath.row);
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // configure your cell here...
    if ([tableData count] >0)
    {
        cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
}

/********************************************************************************
 ******************** UITableViewDelegate Protocol Methods **********************
 ********************************************************************************/

#pragma mark - UITableViewDelegate Protocol Functions
//- (NSUInteger)currentSelectedRowIndex
//{
//    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
//    if (selectedIndexPath) {
//        return selectedIndexPath.row;
//        NSLog(@"same");
//    }
//    else {
//        return NSNotFound;
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier: @"gamecastSegue" sender: self];
    NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
    indexcheck = selectedIndexPath.row + 1;
    NSLog(@"%d",indexcheck);
    [[[[Firebase alloc] initWithUrl:@"https://nflhackathonthingy.firebaseio.com/"] childByAppendingPath:@"gamenumber"] setValue:[NSNumber numberWithInt:indexcheck]];

    
}






@end
