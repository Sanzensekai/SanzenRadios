//
//  RadiosViewController.m
//  SanzenRadios
//
//  Created by Cours iPhone on 26/11/13.
//  Copyright (c) 2013 Cours iPhone. All rights reserved.
//

#import "RadiosViewController.h"
#import "AppDelegate.h"
#import "RadioViewController.h"

@interface RadiosViewController ()

@end

@implementation RadiosViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// récupère la liste de toutes les radios stockés en BDD
- (NSArray *)allRadios
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Radio" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if (objects == nil)
        NSLog(@"There was an error!");
    
    return objects;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self allRadios] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RadioCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject *radio = [[self allRadios] objectAtIndex:indexPath.row];
    cell.textLabel.text = [radio valueForKey:@"name"];
    cell.detailTextLabel.text = [radio valueForKey:@"category"];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if ([[self allRadios] count] >= 1)
        {
            [tableView beginUpdates];
            
            AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
            NSManagedObjectContext *context = [appDelegate managedObjectContext];
            [context deleteObject:[[self allRadios] objectAtIndex:indexPath.row]];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath]
                             withRowAnimation:UITableViewRowAnimationLeft];
            [context save:nil];

            
            //[self.tableView reloadData];
            
        }
        
        if ([[self allRadios] count] == 0)
        {
            //[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        [tableView endUpdates];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
 
}
*/

#pragma mark - Table view delegate

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}


- (IBAction)createRadio:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    // création de l'objet persistent dans le contexte
    NSManagedObject *radio = [NSEntityDescription insertNewObjectForEntityForName:@"Radio" inManagedObjectContext:context];
    
    [context save:nil];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RadioViewController *controller = segue.destinationViewController;
    controller.radio = [[self allRadios] objectAtIndex:[self.tableView indexPathForCell:sender].row];
}


@end
