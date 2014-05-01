//
//  addContactViewController.m
//  CompleteContactList
//
//  Created by Alan Koroma on 3/04/2014.
//  Copyright (c) 2014 Alan Koroma. All rights reserved.
//

#import "addContactViewController.h"
#import "Contacts.h"

@interface addContactViewController ()

//Text Fields
@property (weak, nonatomic) IBOutlet UITextField *fNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

//Buttons

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;


@end

@implementation addContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    if (self.contacts == nil)
    {
        self.contacts = [[Contacts alloc] init];
    }
    
}

- (void) viewWillAppear:(BOOL)animated
{
    //load data when detail view loaded
    self.fNameTextField.text = self.contacts.fName;
    self.lNameTextField.text = self.contacts.lName;
    self.pNumberTextField.text = self.contacts.phoneNumber;
    self.addressTextField.text = self.contacts.address;
    if (self.contacts.fName.length == 0){
        
    }
    else{
        self.navigationItem.title = self.contacts.fName;
    }
}

- (void) viewWillDisappear:(BOOL)animated
{
    //send data when it disappears
    self.contacts.fName = self.fNameTextField.text;
    self.contacts.lName = self.lNameTextField.text;
    self.contacts.phoneNumber = self.pNumberTextField.text;
    self.contacts.address = self.addressTextField.text;
    [self.delegate addContactWillFinishWithDoneButtonPressed:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(id)sender {
    [self.delegate cancelMe];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
