//
//  ViewController.m
//  CompleteContactList
//
//  Created by Alan Koroma on 3/04/2014.
//  Copyright (c) 2014 Alan Koroma. All rights reserved.
//

#import "ViewController.h"
#import "Contacts.h"

@interface ViewController ()

// Contact Array
@property NSMutableArray *contactsArray;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end


@implementation ViewController

- (IBAction)editButton:(id)sender {
    [super setEditing: !self.editing animated:YES];
}


- (IBAction)addButton:(id)sender {
    // Bar Add Button Action
    
    // Showing the next view
    Contacts *contact = [[Contacts alloc]init];
    [self performSegueWithIdentifier:@"showDetail" sender:contact];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.contactsArray = [NSMutableArray array].mutableCopy;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    // [self sortArray];
}


/*- (void) sortArray
{
    NSSortDescriptor *aSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    [self.contactsArray sortUsingDescriptors:[NSArray arrayWithObject:aSortDescriptor]];
}
 
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL) isDirectoryEntryEmpty: (Contacts *) entry
{
    // if the directory entry is empty, return YES
    if (entry.fName.length == 0 && entry.lName.length == 0 && entry.phoneNumber.length == 0 && entry.address.length == 0){
        return YES;
    }
    else{
        return NO;
    }
}



#pragma mark - Segue

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    addContactViewController *addContact = segue.destinationViewController;
    
    if ([sender isKindOfClass:[addContactViewController class]]) {
        addContact.contacts = sender;
    } else if([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell: sender];
        
        Contacts *contacts = [self.contactsArray objectAtIndex: indexPath.row];
        addContact.contacts = contacts;
    }
    
    addContact.delegate = self;
}

#pragma mark - Table View

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.contactsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //set text of the table cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:  @"Cell" forIndexPath: indexPath];
    Contacts *contacts= self.contactsArray[indexPath.row];
    cell.textLabel.text = contacts.description;
    cell.detailTextLabel.text = contacts.phoneNumber;
    return cell;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Delete row function
    [self.contactsArray removeObjectAtIndex:indexPath.row];
    //[self sortArray];
    [self.tableView reloadData];
}


#pragma mark - AddContact View Controller

- (void) addContactWillFinishWithDoneButtonPressed:(addContactViewController *)addContact{
    
    //delegate of detail view controller when Done button is pressed (Saving the contact)
    
    // adding and entry
    
    Contacts *addEntry = addContact.contacts;
    
    if ([self isDirectoryEntryEmpty: addEntry]){
        // dont add new contact
    } else{
        if ([self.contactsArray indexOfObject: addEntry] == NSNotFound) {
            //add new object to directoryEntries array
            [self.contactsArray addObject: addEntry];
            //  [self sortArray];
        }
        
        [self.tableView reloadData];
        [self dismissViewControllerAnimated: YES completion:nil];
    }
}

- (void) cancelMe
{
    //cancel this action in detail view controller
    [self.navigationController popViewControllerAnimated: YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

@end
