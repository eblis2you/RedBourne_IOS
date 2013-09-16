//
//  ChildInfoEditViewController.m
//  RedBourne
//
//  Created by Jerry on 3/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoGeneralViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"

@interface ChildInfoGeneralViewController ()

@property (nonatomic, strong) UISwitch *switchCtl;
@property (strong, nonatomic) UITextField *firstNameField, *surNameField, *MedicareNumberField;


@end

@implementation ChildInfoGeneralViewController

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

    //reuseable frame for elements
    CGRect frame = CGRectMake(50,40,130,30);
    
    /*
     Personal Info
     */
    
    UILabel *generalTitleGeneralInfo = [[UILabel alloc] initWithFrame:frame];
    generalTitleGeneralInfo.text = @"Personal Info";
    [self.view addSubview:generalTitleGeneralInfo];
    
    frame = CGRectMake(235,60,100,30);
    UILabel *firstNameLabel = [[UILabel alloc] initWithFrame:frame];
    firstNameLabel.text = @"First Name:";
    [self.view addSubview:firstNameLabel];
    
    frame = CGRectMake(235,100,100,30);
    UILabel *surnameNameLabel = [[UILabel alloc] initWithFrame:frame];
    surnameNameLabel.text = @"Sur Name:";
    [self.view addSubview:surnameNameLabel];
    
    frame = CGRectMake(235,138,100,30);
    UILabel *DOBLabel = [[UILabel alloc] initWithFrame:frame];
    DOBLabel.text = @"Date of Birth:";
    [self.view addSubview:DOBLabel];
        
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
    UITextField *DOBField = [[UITextField alloc] initWithFrame:frame];
    DOBField.borderStyle = UITextBorderStyleBezel;
    DOBField.keyboardType = UIKeyboardTypeDefault;
    DOBField.delegate = self;
    [self.view addSubview: DOBField];

    
    /*
     Additional Info
     */
    
    frame = CGRectMake(50,190,130,30);
    UILabel *generalTitleAdditionalInfo = [[UILabel alloc] initWithFrame:frame];
    generalTitleAdditionalInfo.text = @"Additional Info";
    [self.view addSubview:generalTitleAdditionalInfo];
    
    frame = CGRectMake(196,215,130,30);
    UILabel *medicalNumber = [[UILabel alloc] initWithFrame:frame];
    medicalNumber.text = @"Medicare Number";
    [self.view addSubview:medicalNumber];
    
    frame = CGRectMake(195,252,130,30);
    UILabel *registrationDate = [[UILabel alloc] initWithFrame:frame];
    registrationDate.text = @"Registration Date";
    [self.view addSubview:registrationDate];
   
    frame = CGRectMake(320,215,220,30);
    UITextField *MedicareNumberField = [[UITextField alloc] initWithFrame:frame];
    MedicareNumberField.borderStyle = UITextBorderStyleBezel;
    MedicareNumberField.keyboardType = UIKeyboardTypeDefault;
    MedicareNumberField.delegate = self;
    [self.view addSubview: MedicareNumberField];
    
    frame = CGRectMake(320,250,220,30);
    UITextField *RegistrationDate = [[UITextField alloc] initWithFrame:frame];
    RegistrationDate.borderStyle = UITextBorderStyleBezel;
    RegistrationDate.keyboardType = UIKeyboardTypeDefault;
    RegistrationDate.delegate = self;
    [self.view addSubview:RegistrationDate];

    /*
     Photo uploading
     */

    frame = CGRectMake(50,355,120,30);
    UILabel *generalTitlePhotoUpload = [[UILabel alloc] initWithFrame:frame];
    generalTitlePhotoUpload.text = @"Photo Upload";
    [self.view addSubview:generalTitlePhotoUpload];
    
    
    UIButton *photoUploadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    photoUploadButton.frame = CGRectMake(185,353,161,30);
    [photoUploadButton setTitle:@"Choose from Photo" forState:UIControlStateNormal];
    [photoUploadButton addTarget:self action:@selector(saveName) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoUploadButton];

    frame = CGRectMake(50,190,130,30);
    UIImageView *photImage = [[UIImageView alloc] initWithFrame:frame];
    [photImage removeFromSuperview];
    photImage = nil;
    [self.view addSubview:photImage];
    
    
    
        
       
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
