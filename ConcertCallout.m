//
//  ConcertCallout.m
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/23/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import "ConcertCallout.h"
#define CONCERT_DATE 0
#define VENUE_NAME 1
#define VENUE_CITYSTATE 2
#define VENUE_LATLONG 3

@interface ConcertCallout ()

@end

@implementation ConcertCallout

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIFont *concertLabelFont = [UIFont boldSystemFontOfSize:12.0f];
    UIFont *concertFont = [UIFont systemFontOfSize:12.0f];
    //Configure Concert cells
    switch (indexPath.row)
    {
        case CONCERT_DATE:
            {
                NSMutableString *dateString = [NSMutableString stringWithFormat:@"Concert Date: %@",[self.c1 concertDate]];
                NSInteger wordLength = dateString.length;
                NSMutableAttributedString *formattedDate = [[NSMutableAttributedString alloc] initWithString:dateString];
                
                [formattedDate addAttribute:NSFontAttributeName value:concertFont range:NSMakeRange(0, wordLength)];
                [formattedDate addAttribute:NSFontAttributeName value:concertLabelFont range:NSMakeRange(0, 13)];
                cell.textLabel.attributedText = formattedDate;
            }
            break;
            
        case VENUE_NAME:
            {
                NSMutableString *nameString = [NSMutableString stringWithFormat:@"Venue Name: %@",[self.c1 venueName]];
                NSInteger wordLength = nameString.length;
                NSMutableAttributedString *formattedName = [[NSMutableAttributedString alloc]initWithString:nameString];
                [formattedName addAttribute:NSFontAttributeName value:concertFont range:NSMakeRange(0, wordLength)];
                [formattedName addAttribute:NSFontAttributeName value:concertLabelFont range:NSMakeRange(0, 11)];
                
                cell.textLabel.attributedText = formattedName;
            }
            break;
        
        case VENUE_CITYSTATE:
            {
                NSMutableString *cityStateString = [NSMutableString stringWithFormat:@"Venue Location: %@,%@",[self.c1 venueCityName],[self.c1 venueStateName]];
                NSInteger wordLength = cityStateString.length;
                NSMutableAttributedString *formattedCityState = [[NSMutableAttributedString alloc] initWithString:cityStateString];
                [formattedCityState addAttribute:NSFontAttributeName value:concertFont range:NSMakeRange(0, wordLength)];
                [formattedCityState addAttribute:NSFontAttributeName value:concertLabelFont range:NSMakeRange(0, 15)];
                
                cell.textLabel.attributedText = formattedCityState;
            }
            break;
        
        case VENUE_LATLONG:
            {
                NSMutableString *latLongString = [NSMutableString stringWithFormat:@"Venue Lat,Long: %@,%@",[self.c1 venueLatitude],[self.c1 venueLongitude]];
                NSInteger wordLength = latLongString.length;
                NSMutableAttributedString *formattedLatLong = [[NSMutableAttributedString alloc] initWithString:latLongString];
                [formattedLatLong addAttribute:NSFontAttributeName value:concertFont range:NSMakeRange(0, wordLength)];
                [formattedLatLong addAttribute:NSFontAttributeName value:concertLabelFont range:NSMakeRange(0, 15   )];
                
                cell.textLabel.attributedText = formattedLatLong;
            }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *testTitle = @"Concert Info:";
    
    return testTitle;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
