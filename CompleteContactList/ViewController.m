//
//  ViewController.m
//  CompleteContactList
//
//  Created by Alan Koroma on 3/04/2014.
//  Copyright (c) 2014 Alan Koroma. All rights reserved.
//

#import "ViewController.h"
#import "Contacts.h"
#import "addContactViewController.h"


@interface ViewController ()

// Contact Array
@property NSMutableArray *contacts;



// Buttons
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;




@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.contacts = [[NSMutableArray alloc ]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)editButton:(id)sender {
    [super setEditing: !self.editing animated:YES];
}


- (IBAction)addButton:(id)sender {
    // Bar Add Button Action
    
    // Showing the next view
    Contacts *contact = [[Contacts alloc]init];
    [self performSegueWithIdentifier:@"showDetail" sender:(contact)];
}

#pragma mark - Segue

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    addContactViewController *addContact = segue.destinationViewController;
    
    if ([sender isKindOfClass:[Contacts class]]) {
        addContact.contact = sender;
    } else if([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        Contacts *contact = self.contacts [indexPath.row];
        addContact.contact = contact;
    }
    
    addContact.delegate = self;
}


#pragma mark - Table View

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.contacts.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath: indexPath];
    
    // Adding Text to the view
    cell.textLabel.text = [self.contacts[indexPath.row] description];
    cell.detailTextLabel.text = [self.contacts[indexPath.row]phoneNumber];
    
    return cell;
}

#pragma mark - AddContact View Controller

- (void) addContactWillFinishWithDoneButtonPressed:(addContactViewController *)addContact{
    
    Contacts *contact = addContact.contact;
    
    if ([self.contacts indexOfObject:contact] == NSNotFound) {
        [self.contacts addObject:contact];
    }
    
    [self.tableView reloadData];
 [self dismissViewControllerAnimated: YES completion:nil];
}

@end
