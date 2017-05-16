//
//  CustomCellTableViewCell.h
//  TableViewInsideCell
//
//  Created by Jaffer Sheriff U on 07/12/16.
//  Copyright © 2016 Jaffer Sheriff U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellTableViewCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>
{
    UILabel *cellLabel;
    UITableView *table;
    
    NSMutableArray *tableData;
}
-(void) setCellText:(NSString *) text;
-(void) addTableWithText:(NSString *) text;
@end

