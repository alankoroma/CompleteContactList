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

- (IBAction)doneButton:(id)sender;


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
   
    self.fNameTextField.text = self.contact.fName;
    self.lNameTextField.text = self.contact.lName;
    self.pNumberTextField.text = self.contact.phoneNumber;
    self.addressTextField.text = self.contact.address;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



- (IBAction)addContact:(UIBarButtonItem *)sender {
    
}



- (IBAction)doneButton:(id)sender {
    self.contact.fName = self.fNameTextField.text;
    self.contact.lName = self.lNameTextField.text;
    self.contact.phoneNumber = self.pNumberTextField.text;
    self.contact.address = self.addressTextField.text;
    [self.delegate addContactWillFinishWithDoneButtonPressed:self];
    
    NSLog(@"%@", self.contact.fName);
}
@end
