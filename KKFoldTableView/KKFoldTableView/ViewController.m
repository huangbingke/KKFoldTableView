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
    KKTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KKTableCell" forIndexPath:indexPath];
    cell.model = model;
    return cell;
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
        for (int i = 1; i < model.childrenMenus.count+1; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row+i inSection:0];
            [indexPaths addObject:index];
        }
        NSRange range = NSMakeRange(indexPath.row+1, [model.childrenMenus count]);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.dataArray insertObjects:model.childrenMenus atIndexes: indexSet];
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationNone)];
    } else {
        NSMutableArray <KKTableModel *> *tempArr = self.dataArray.mutableCopy;
        for (int i = (int)indexPath.row+1; i < tempArr.count; i++) {
            KKTableModel *nextModel = tempArr[i];
            if (nextModel.level > model.level) {
                nextModel.isOpen = NO;
                NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
                [indexPaths addObject:index];
                [self.dataArray removeObjectAtIndex:indexPath.row+1];
            }
        }
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationNone)];
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
        [_tableView registerClass:[KKTableCell class] forCellReuseIdentifier:@"KKTableCell"];
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
                            NSMutableArray *model5Array = [NSMutableArray new];
                            for (int i = 0; i < 4; i++) {
                                KKTableModel *model5 = [[KKTableModel alloc] initWithLevel:5];
                                [model5Array addObject:model5];
                            }                            
                            model4.childrenMenus = model5Array;
                            [model4Array addObject:model4];
                        }
                        model3.childrenMenus = model4Array;
                        [model3Array addObject:model3];
                    }
                    model2.childrenMenus = model3Array;
                    [model2Array addObject:model2];
                }
                model1.childrenMenus = model2Array;
                [model1Array addObject:model1];
            }
            model0.childrenMenus = model1Array;
            [_dataArray addObject:model0];
        }
    }
    return _dataArray;
}


@end
