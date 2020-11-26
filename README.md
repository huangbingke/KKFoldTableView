# KKFoldTableView
## 折叠菜单
![效果图](https://github.com/huangbingke/KKFoldTableView/blob/main/Image/WX20201125-083538.png)

思路: 展开菜单就插入下一级菜单的cell, 折叠菜单就删除响应的cell.
> 核心代码:

```
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
```
