//
//  ListViewController.h
//  Support2
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListViewController : UIViewController<UITextViewDelegate, UITextFieldDelegate, UITableViewDataSource> {
    NSMutableArray * _itemList;
    UITableView * _tableView;
}

@end
