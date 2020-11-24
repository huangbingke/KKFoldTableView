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
}

@end

@implementation  KKFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.menuTitleLabel.frame = CGRectMake(10, 0, 200, 50);
        self.lineLayer.frame = CGRectMake(10, 49, kScreenWidht-10, 0.5);
    }
    return self;
}

@end

@implementation  KKSecondCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.menuTitleLabel.frame = CGRectMake(50, 0, 200, 50);
        self.lineLayer.frame = CGRectMake(50, 49, kScreenWidht-50, 0.5);
    }
    return self;
}

@end

@implementation  KKThirdCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.menuTitleLabel.frame = CGRectMake(90, 0, 200, 50);
        self.lineLayer.frame = CGRectMake(90, 49, kScreenWidht-90, 0.5);
    }
    return self;
}


@end

@implementation  KKFourthCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.menuTitleLabel.frame = CGRectMake(130, 0, 200, 50);
        self.lineLayer.frame = CGRectMake(130, 49, kScreenWidht-130, 0.5);
    }
    return self;
}


@end

@implementation  KKFifthCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.menuTitleLabel.frame = CGRectMake(170, 0, 200, 50);
        self.lineLayer.frame = CGRectMake(170, 49, kScreenWidht-170, 0.5);
    }
    return self;
}


@end
