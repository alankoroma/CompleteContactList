//
//  addContactViewController.h
//  CompleteContactList
//
//  Created by Alan Koroma on 3/04/2014.
//  Copyright (c) 2014 Alan Koroma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"

@class addContactViewController;

@protocol addContactViewControllerDelegate <NSObject>

- (void) addContactWillFinishWithDoneButtonPressed: (addContactViewController *) addContact;


@end

@interface addContactViewController : UIViewController

@property id<addContactViewControllerDelegate> delegate;
@property Contacts *contact;

@end
