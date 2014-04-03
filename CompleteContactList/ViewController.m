//
//  ViewController.m
//  CompleteContactList
//
//  Created by Alan Koroma on 3/04/2014.
//  Copyright (c) 2014 Alan Koroma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Buttons
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    // Change later
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath: indexPath];
    
    // Change Later
    cell.textLabel.text = @"Test";
    return cell;
}

@end
