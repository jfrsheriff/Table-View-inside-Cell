//
//  CustomCellTableViewCell.m
//  TableViewInsideCell
//
//  Created by Jaffer Sheriff U on 07/12/16.
//  Copyright © 2016 Jaffer Sheriff U. All rights reserved.
//

#import "CustomCellTableViewCell.h"
#import "Masonry.h"

@implementation CustomCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void) setCellText:(NSString *) text
{
    if (cellLabel == nil)
    {
        cellLabel = [[UILabel alloc]init];
        [cellLabel setNumberOfLines:0];
        [cellLabel setBackgroundColor:[UIColor redColor]];
        [self addSubview:cellLabel];
        
        [cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
            
        }];
    }
    [cellLabel setText:text];
}
-(void) addTableWithText:(NSString *) text
{
    tableData = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15", nil];
    //    tableData = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    
    if (table == nil)
    {
        table = [[UITableView alloc]init];
        [table setDelegate:self];
        [table setDataSource:self];
        [table setScrollEnabled:YES];
        [table setEstimatedRowHeight:40];
        [table setRowHeight:UITableViewAutomaticDimension];
        [self addSubview:table];
        
        [table registerClass:[CustomCellTableViewCell class] forCellReuseIdentifier:@"cell"];
        
        [table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo(self);
            make.left.equalTo(self).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
            make.bottom.equalTo(self).with.offset(-10);
        }];
    }
    if (cellLabel == nil)
    {
        cellLabel = [[UILabel alloc]init];
        [cellLabel setNumberOfLines:0];
        [cellLabel setBackgroundColor:[UIColor redColor]];
        [self addSubview:cellLabel];
        
        [cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).with.offset(10);
            make.left.equalTo(self).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
            make.bottom.equalTo(table.mas_top).with.offset(-10);
        }];
    }
    else
    {
        [cellLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(10);
            make.left.equalTo(self).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
            make.bottom.equalTo(table.mas_top).with.offset(-10);
        }];
    }
    
    [cellLabel setText:text];
    [table layoutIfNeeded];
    //    CGFloat height = table.contentSize.height;
    CGFloat height  = 300;
    
    [table mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(self);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self).with.offset(-10);
        make.height.equalTo([NSNumber numberWithFloat:height]);
    }];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    [headerView setBackgroundColor:[UIColor greenColor]];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    [label setText:[NSString stringWithFormat:@"Section Inside Cell =  %li",(long)section+1]];
    [headerView addSubview:label];
    
    return headerView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCellText:[tableData objectAtIndex:indexPath.row]];
    return cell;
    
}
@end
