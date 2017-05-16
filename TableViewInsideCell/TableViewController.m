//
//  TableViewController.m
//  TableViewInsideCell
//
//  Created by Jaffer Sheriff U on 07/12/16.
//  Copyright © 2016 Jaffer Sheriff U. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCellTableViewCell.h"

@interface TableViewController ()
{
    NSMutableArray *array;
    NSString *cellID;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    array = [[NSMutableArray alloc]initWithObjects:@"Hi",@"13.861970 dsdlkdksjdksksdjkljkdlsjkldsjk dsdlkdksjdksksdjkljkdlsjkldsjkdsdlkdksjdksksdjkljkdlsjkldsjkdsdlkdksjdksksdjkljkdlsjkldsjk", @"Latitude",@"100.504250", @"Longitude",@"50 kph", @"Speed",@"1000 meters", @"Altitude",@"12/04/2010", @"Date",@"05:45 PM", @"Time",@"North west", @"Course", nil];
    
    array = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    cellID = @"cellID";
    
    //    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.tableView setEstimatedRowHeight:50];
    
    
    [self.tableView registerClass:[CustomCellTableViewCell class] forCellReuseIdentifier:cellID];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [array count];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [headerView setBackgroundColor:[UIColor greenColor]];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [label setText:[NSString stringWithFormat:@"Section =  %li",(long)section+1]];
    [headerView addSubview:label];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 1)
    {
        [cell addTableWithText:[array objectAtIndex:indexPath.row]];
    }
    else
    {
        [cell setCellText:[array objectAtIndex:indexPath.row]];
    }
    // Configure the cell...
    
    return cell;
}


@end
