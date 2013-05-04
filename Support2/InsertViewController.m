//
//  InsertViewController.m
//  Support2
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import "InsertViewController.h"

#import "RestKit/RestKit.h"

#import "crmLogin.h"
#import "crmCaseActions.h"

@implementation InsertViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
		self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        
        //Lables
		UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(10,10,310,40)];
		name.text = @"Oggetto";
		name.backgroundColor = [UIColor clearColor];
		name.textColor = [UIColor whiteColor];
		name.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view addSubview:name];
        
        UILabel * description = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, 310, 40)];
		description.text = @"Descrizione";
		description.backgroundColor = [UIColor clearColor];
		description.textColor = [UIColor whiteColor];
		description.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view addSubview:description];
        
        
        //Text field
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 45, 300, 30)];
		_nameTextField.placeholder = @"Problema in breve";
		_nameTextField.borderStyle = UITextBorderStyleRoundedRect;
		_nameTextField.backgroundColor = [UIColor whiteColor];
		_nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
		_nameTextField.delegate = self;
		[self.view addSubview:_nameTextField];
        
        ///Toolbar tastiera su campo description
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        toolbar.barStyle = UIBarStyleBlackTranslucent;
        //Pulsante
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Fatto" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard)];
        toolbar.items = [NSArray arrayWithObject:doneButton];
		
		_descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 195, 300, 70)];
		_descriptionTextView.backgroundColor = [UIColor whiteColor];
		_descriptionTextView.delegate = self;
		
		_descriptionTextView.inputAccessoryView = toolbar;
        
        
        
        //Pulsanti
		_resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		_resetButton.frame = CGRectMake(10, 370, 140, 30);
		[_resetButton setTitle:@"Annulla" forState:UIControlStateNormal];
		[_resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_resetButton addTarget:self action:@selector(resetButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:_resetButton];
		
		_addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		_addButton.frame = CGRectMake(160, 370, 140, 30);
		[_addButton setTitle:@"Invia!" forState:UIControlStateNormal];
		[_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_addButton addTarget:self action:@selector(addButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:_addButton];
        
		
		[self.view addSubview:_descriptionTextView];
    }
    
    return self;
}

- (void)addButtonTapped {
	
     //NSString *X = _nameTextField.text;
    /*
    NSString *X = @"debug";
     UIAlertView * msg = [[UIAlertView alloc] initWithTitle:@"ATT" message:X delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok",nil];
     [msg show];
     */
    
	
    //Login
    crmLogin *connection = [[crmLogin alloc] init];
    connection  .delegate = self;
    [connection login:@"admin" password:@"37cdf91cb63badb018c3de5698104f56"];
    
	
	//_nameTextField.text = @"";
	//_originTextField.text = @"";
	//_descriptionTextView.text = @"";
	
}
- (void)resetButtonTapped {
	_nameTextField.text = @"";
	//_originTextField.text = @"";
	_descriptionTextView.text = @"";
}

- (void) dismissKeyboard {
	if([_descriptionTextView isFirstResponder]) {
		[_descriptionTextView resignFirstResponder];
	}
}

-(void)loginResponse:(LoginResp *)response {
    NSLog(@"hello DELEGATE");
    NSLog(@"ID DEL %@",response.id);
    
    
    //Add a new Case on CRM
    crmCaseActions *caseAction = [[crmCaseActions alloc] init];
    [caseAction newCase:response.id name:_nameTextField.text description:_descriptionTextView.text];
    
    //[self sessionId] = response.id;
    
    
    _nameTextField.text = @"";
	//_originTextField.text = @"";
	_descriptionTextView.text = @"";
    
}

@end
