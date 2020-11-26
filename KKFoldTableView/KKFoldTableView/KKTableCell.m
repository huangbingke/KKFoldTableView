//
//  KKTableCell.m
//  KKFoldTableView
//
//  Created by q.zhang on 24/11/2020.
//

#import "KKTableCell.h"

@interface KKTableCell ()

@property (nonatomic, strong) CALayer *lineLayer;

@end
@implementation KKTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.menuTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.menuTitleLabel];
        
        self.lineLayer = [CALayer layer];
        self.lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:self.lineLayer];
        
    }
    return self;
}

- (void)setModel:(KKTableModel *)model {
    _model = model;
    self.menuTitleLabel.text = [NSString stringWithFormat:@"第%ld级菜单", model.level+1];

    CGFloat x = 10 + model.level * 40;
    self.menuTitleLabel.frame = CGRectMake(x, 0, 100, 50);
    self.lineLayer.frame = CGRectMake(x, 49, kScreenWidht-x, 0.5);
}

@end
