//
//  InsertViewController.h
//  Support2
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "crmLoginDelegate.h"

@interface InsertViewController : UIViewController<UITextViewDelegate,UITextViewDelegate, UITextFieldDelegate, crmLoginDelegate> {
    UITextField *_nameTextField;
    UITextView *_descriptionTextView;
    
    UIButton *_resetButton;
    UIButton *_addButton;
}

- (void)addButtonTapped;
- (void)resetButtonTapped;
- (void)dismissKeyboard;

@end
