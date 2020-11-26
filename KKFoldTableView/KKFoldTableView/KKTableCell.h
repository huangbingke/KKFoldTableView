//
//  KKTableCell.h
//  KKFoldTableView
//
//  Created by q.zhang on 24/11/2020.
//

#import <UIKit/UIKit.h>
#import "KKTableModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKTableCell : UITableViewCell

@property (nonatomic, strong) UILabel *menuTitleLabel;

@property (nonatomic, strong) KKTableModel *model;

@end





NS_ASSUME_NONNULL_END
