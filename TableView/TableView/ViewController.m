//
//  ViewController.m
//  TableView
//
//  Created by Janum Trivedi on 2/26/15.
//  Copyright (c) 2015 Janum Trivedi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    
    // Initialize our items array
    self.items = [[NSMutableArray alloc] init];
    
}

- (IBAction)addNewItem:(id)sender
{
    NSString* itemName = [[self itemTextField] text];
    [[self items] addObject:itemName];
    
    NSLog(@"%@", self.items);
    
    [[self itemTextField] setText:@""];
    
    [[self tableView] reloadData];
    
    [[self itemTextField] resignFirstResponder];

    // Or you can use the dot syntax:
    // [self.items addObject:itemName];
}

// Returns a UITableViewCell for our tableView for row index indexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     This asks the table view if it has any cells that are not in use (i.e., created earlier 
     but are now offscreen). If there is, our table view will re-use that cell.
     Our cellIdentifier is some NSString that identifies which cells we can re-use.
     */
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    // If the cell is nil, then there wasn't a cell available for re-use.
    if (! cell) {
        
        /* 
         Initialize the UITableViewCell. We can initialize the cell with a default "style" and
         re-use identifier. If the re-use identifier is different than above, then we can't
         re-use any cells.
         */
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
        // UITableViewCells with the default style have a UILabel that we can set text to.
    }
    
//    NSInteger row = [indexPath row];
//    NSString* title = [NSString stringWithFormat:@"Row #%i", (int)row];
//    [[cell textLabel] setText:title];

    NSString* itemName = [[self items] objectAtIndex:indexPath.row];
    [[cell textLabel] setText:itemName];
    
    // Return our UITableViewCell to our table view.
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 5;
    return [[self items] count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
