//
//  ChildInfoEditViewController.m
//  RedBourne
//
//  Created by Jerry on 3/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoEditViewController.h"

@interface ChildInfoEditViewController ()

@property (nonatomic, strong) UISwitch *switchCtl;
@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *surNameField;
@property (strong, nonatomic) UITextField *DOBField;


@end

@implementation ChildInfoEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Edit Child Information";
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveUserWhenClosing)
                                                     name:@"UIApplicationDidEnterBackgroundNotification"
                                                   object:nil];
    }
    return self;
}

//load child name to the edit field.
- (void)viewWillAppear:(BOOL)animated {
    self.firstNameField.text = self.child.firstName;
    self.surNameField.text = self.child.surName;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = CGRectMake(50,40,130,30);
    
    UILabel *generalTitle_1 = [[UILabel alloc] initWithFrame:frame];
    generalTitle_1.text = @"Personal Info";
    [self.view addSubview:generalTitle_1];
    
    frame = CGRectMake(50,190,130,30);
    UILabel *generalTitle_2 = [[UILabel alloc] initWithFrame:frame];
    generalTitle_2.text = @"Additional Info";
    [self.view addSubview:generalTitle_2];
    
    frame = CGRectMake(235,60,100,30);
    UILabel *firstNameLabel = [[UILabel alloc] initWithFrame:frame];
    firstNameLabel.text = @"First Name:";
    [self.view addSubview:firstNameLabel];
    
    frame = CGRectMake(235,100,100,30);
    UILabel *surnameNameLabel = [[UILabel alloc] initWithFrame:frame];
    surnameNameLabel.text = @"Sur Name:";
    [self.view addSubview:surnameNameLabel];
    
    frame = CGRectMake(195,140,120,30);
    UILabel *DOB = [[UILabel alloc] initWithFrame:frame];
    DOB.text = @"Date of Birth:";
    [self.view addSubview:DOB];
    
    
        
    frame = CGRectMake(320,56,200,30);
    self.firstNameField = [[UITextField alloc] initWithFrame:frame];
    self.firstNameField.borderStyle = UITextBorderStyleBezel;
    self.firstNameField.keyboardType = UIKeyboardTypeDefault;
    self.firstNameField.delegate = self;
    [self.view addSubview:self.firstNameField];
    
    frame = CGRectMake(320,100,200,30);
    self.surNameField = [[UITextField alloc] initWithFrame:frame];
    self.surNameField.borderStyle = UITextBorderStyleBezel;
    self.surNameField.keyboardType = UIKeyboardTypeDefault;
    self.surNameField.delegate = self;
    [self.view addSubview:self.surNameField];
    
    frame = CGRectMake(320,140,200,30);
    self.DOBField = [[UITextField alloc] initWithFrame:frame];
    self.DOBField.borderStyle = UITextBorderStyleBezel;
    self.DOBField.keyboardType = UIKeyboardTypeDefault;
    self.DOBField.delegate = self;
    [self.view addSubview:self.DOBField];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame = CGRectMake(160,650,160,30);
    [saveButton setTitle:@"Save Name" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveName) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(360,650,160,30);
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    

//    frame = CGRectMake(0.0, 12.0, 94.0, 27.0);
//    _switchCtl = [[UISwitch alloc] initWithFrame:frame];
//    [_switchCtl addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    _switchCtl.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_switchCtl];

}

- (void)saveName{

    self.child.firstName = self.firstNameField.text;
    self.child.surName = self.surNameField.text;
    
    NSLog(@"%@ %@", self.child.firstName, self.child.surName);
    
    
    [ChildModel saveChild:self.child];
    
    [self dismissViewControllerAnimated:YES completion:nil];    
    
}

- (void)cancelButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveChildWhenClosing{
    [ChildModel saveChild:self.child];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchAction:(id)sender
{
    NSLog(@"switchAction: value = %d", [sender isOn]);
}

#pragma mark - Lazy creation of controls

- (UISwitch *)switchCtl
{
    if (_switchCtl == nil)
    {
        CGRect frame = CGRectMake(0.0, 12.0, 94.0, 27.0);
        _switchCtl = [[UISwitch alloc] initWithFrame:frame];
        [_switchCtl addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        
        // in case the parent view draws with a custom color or gradient, use a transparent color
        _switchCtl.backgroundColor = [UIColor clearColor];
		
        [self.view addSubview:_switchCtl];
		
    }
    return _switchCtl;
}

@end
