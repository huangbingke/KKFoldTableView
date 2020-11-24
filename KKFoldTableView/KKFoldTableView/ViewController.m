//
//  ViewController.m
//  KKFoldTableView
//
//  Created by q.zhang on 24/11/2020.
//

#import "ViewController.h"
#import "KKTableCell.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<KKTableModel *> *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKTableModel *model = self.dataArray[indexPath.row];
    if (model.level == 0) {
        KKFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KKFirstCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    } else if (model.level == 1) {
        KKSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KKSecondCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    } else if (model.level == 2) {
        KKThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KKThirdCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    } else if (model.level == 3) {
        KKFourthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KKFourthCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    } else if (model.level == 4) {
        KKFifthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KKFifthCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    
    return UITableViewCell.new;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    KKTableModel *model = self.dataArray[indexPath.row];
    model.isOpen = !model.isOpen;
    NSMutableArray *indexPaths = [NSMutableArray new];
    if (model.isOpen) {
        for (int i = 1; i < model.menuModelArray.count+1; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row+i inSection:0];
            [indexPaths addObject:index];
        }
        NSRange range = NSMakeRange(indexPath.row+1, [model.menuModelArray count]);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.dataArray insertObjects:model.menuModelArray atIndexes: indexSet];
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationNone)];
    } else {
        NSMutableArray <KKTableModel *> *tempArr = self.dataArray.mutableCopy;
        for (int i = (int)indexPath.row+1; i <= tempArr.count+1; i++) {
            if ((i == tempArr.count) || tempArr[i].level <= model.level) {
                NSRange range = NSMakeRange(indexPath.row+1, i - (int)indexPath.row-1);
                for (int j = (int)indexPath.row+1; j < (int)indexPath.row + range.length+1; j++) {
                    NSIndexPath *index = [NSIndexPath indexPathForRow:j inSection:0];
                    [indexPaths addObject:index];
                    KKTableModel *model = self.dataArray[j];
                    model.isOpen = NO;
                }
                [self.dataArray removeObjectsInRange:range];
                [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationNone)];
                break;
            }
        }
    }
}

#pragma mark - Getter -
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidht, kScreenHeight) style:(UITableViewStylePlain)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[KKFirstCell class] forCellReuseIdentifier:@"KKFirstCell"];
        [_tableView registerClass:[KKSecondCell class] forCellReuseIdentifier:@"KKSecondCell"];
        [_tableView registerClass:[KKThirdCell class] forCellReuseIdentifier:@"KKThirdCell"];
        [_tableView registerClass:[KKFourthCell class] forCellReuseIdentifier:@"KKFourthCell"];
        [_tableView registerClass:[KKFifthCell class] forCellReuseIdentifier:@"KKFifthCell"];
        _tableView.tableFooterView = UIView.new;
    }
    return _tableView;
}

- (NSMutableArray<KKTableModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        for (int i = 0; i < 4; i++) {
            KKTableModel *model0 = [[KKTableModel alloc] initWithLevel:0];
            NSMutableArray *model1Array = [NSMutableArray new];
            for (int i = 0; i < 4; i++) {
                KKTableModel *model1 = [[KKTableModel alloc] initWithLevel:1];
                NSMutableArray *model2Array = [NSMutableArray new];
                for (int i = 0; i < 4; i++) {
                    KKTableModel *model2 = [[KKTableModel alloc] initWithLevel:2];
                    NSMutableArray *model3Array = [NSMutableArray new];
                    for (int i = 0; i < 4; i++) {
                        KKTableModel *model3 = [[KKTableModel alloc] initWithLevel:3];
                        NSMutableArray *model4Array = [NSMutableArray new];
                        for (int i = 0; i < 4; i++) {
                            KKTableModel *model4 = [[KKTableModel alloc] initWithLevel:4];
                            [model4Array addObject:model4];
                        }
                        model3.menuModelArray = model4Array;
                        [model3Array addObject:model3];
                    }
                    model2.menuModelArray = model3Array;
                    [model2Array addObject:model2];
                }
                model1.menuModelArray = model2Array;
                [model1Array addObject:model1];
            }
            model0.menuModelArray = model1Array;
            [_dataArray addObject:model0];
        }
    }
    return _dataArray;
}


@end
