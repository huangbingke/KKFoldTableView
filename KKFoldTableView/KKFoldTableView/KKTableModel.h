//
//  KKTableModel.h
//  KKFoldTableView
//
//  Created by q.zhang on 24/11/2020.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface KKTableModel : NSObject

/*
0, 1, 2, 3, 4...级菜单
*/
@property (nonatomic, assign) NSInteger level;

@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, copy) NSArray<KKTableModel *> *childrenMenus;

- (instancetype)initWithLevel:(NSInteger)level;

@end

NS_ASSUME_NONNULL_END
