//
//  RestaurantCallout.m
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/27/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import "RestaurantCallout.h"

@interface RestaurantCallout ()

@end

@implementation RestaurantCallout

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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UIFont *restaurantLabelFont = [UIFont boldSystemFontOfSize:12.0f];
    UIFont *restaurantFont = [UIFont systemFontOfSize:12.0f];

    // Configure the cell...
    
    /*
     NSMutableString *dateString = [NSMutableString stringWithFormat:@"Concert Date: %@",[self.c1 concertDate]];
     NSInteger wordLength = dateString.length;
     NSMutableAttributedString *formattedDate = [[NSMutableAttributedString alloc] initWithString:dateString];
     
     [formattedDate addAttribute:NSFontAttributeName value:concertFont range:NSMakeRange(0, wordLength)];
     [formattedDate addAttribute:NSFontAttributeName value:concertLabelFont range:NSMakeRange(0, 13)];
     cell.textLabel.attributedText = formattedDate;
     */
    switch (indexPath.row) {
        case 0:
            {
                NSMutableString *restaurantName = [NSMutableString stringWithFormat:@"Restaurant Name: %@",[self.r1 restaurantName]];
                NSInteger stringLength = restaurantName.length;
                NSMutableAttributedString *formattedName = [[NSMutableAttributedString alloc] initWithString:restaurantName];
                
                [formattedName addAttribute:NSFontAttributeName value:restaurantFont range:NSMakeRange(0, stringLength)];
                [formattedName addAttribute:NSFontAttributeName value:restaurantLabelFont range:NSMakeRange(0, 16)];
                
                cell.textLabel.attributedText = formattedName;
            }
            break;
            
        case 1:
            {
                cell.textLabel.numberOfLines = 0;
                cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
                NSMutableString *restaurantAddress = [NSMutableString stringWithFormat:@"Restaurant Address: %@\n\t\t\t\t   %@,%@ %@",[self.r1 restaurantAddress],[self.r1 restaurantCity],[self.r1 restaurantState],[self.r1 restaurantZipcode]];
                NSInteger stringLength = restaurantAddress.length;
                NSMutableAttributedString *formattedAddress = [[NSMutableAttributedString alloc] initWithString:restaurantAddress];
                
                [formattedAddress addAttribute:NSFontAttributeName value:restaurantFont range:NSMakeRange(0, stringLength)];
                [formattedAddress addAttribute:NSFontAttributeName value:restaurantLabelFont range:NSMakeRange(0, 19)];
                
                cell.textLabel.attributedText = formattedAddress;
                
            }
            break;
            
        case 2:
            {
                NSMutableString *restaurantPhoneNum = [NSMutableString stringWithFormat:@"Restaurant Phone#: %@",[self.r1 restaurantPhoneNumber]];
                NSInteger stringLength = restaurantPhoneNum.length;
                NSMutableAttributedString *formattedPhoneNum = [[NSMutableAttributedString alloc]initWithString:restaurantPhoneNum];
                
                [formattedPhoneNum addAttribute:NSFontAttributeName value:restaurantFont range:NSMakeRange(0, stringLength)];
                [formattedPhoneNum addAttribute:NSFontAttributeName value:restaurantLabelFont range:NSMakeRange(0, 18)];
                
                cell.textLabel.attributedText = formattedPhoneNum;
            }
            break;
            
        case 3:
            {
                cell.textLabel.numberOfLines = 0;
                cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
                NSMutableString *restaurantFoodType = [NSMutableString stringWithFormat:@"Restaurant Style: %@",[self.r1 restaurantCategories]];
                NSInteger stringLength = restaurantFoodType.length;
                NSMutableAttributedString *formattedFoodType = [[NSMutableAttributedString alloc] initWithString:restaurantFoodType];
                
                [formattedFoodType addAttribute:NSFontAttributeName value:restaurantFont range:NSMakeRange(0, stringLength)];
                [formattedFoodType addAttribute:NSFontAttributeName value:restaurantLabelFont range:NSMakeRange(0, 17)];
                
                cell.textLabel.attributedText = formattedFoodType;
            }
            break;
            
        case 4:
            {
                NSMutableString *distanceToVenue = [NSMutableString stringWithFormat:@"Distance to Concert(mi.): %@",[self.r1 distanceFromVenueToRestaurant]];
                NSInteger stringLength = distanceToVenue.length;
                NSMutableAttributedString *formattedDistance = [[NSMutableAttributedString alloc]initWithString:distanceToVenue];
                
                [formattedDistance addAttribute:NSFontAttributeName value:restaurantFont range:NSMakeRange(0, stringLength)];
                [formattedDistance addAttribute:NSFontAttributeName value:restaurantLabelFont range:NSMakeRange(0, 25)];
                
                cell.textLabel.attributedText = formattedDistance;
            }
            break;
        
        case 5:
            {
                NSMutableString *restaurantLatLong = [NSMutableString stringWithFormat:@"Restaurant Lat,Long: %@,%@",[self.r1 restaurantLatitude],[self.r1 restaurantLongitude]];
                NSInteger stringLength = restaurantLatLong.length;
                NSMutableAttributedString *formattedLatLong = [[NSMutableAttributedString alloc] initWithString:restaurantLatLong];
                
                [formattedLatLong addAttribute:NSFontAttributeName value:restaurantFont range:NSMakeRange(0, stringLength)];
                [formattedLatLong addAttribute:NSFontAttributeName value:restaurantLabelFont range:NSMakeRange(0, 20)];
                
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
    NSString *testTitle = @"Restaurant Info:";
    
    return testTitle;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 150;
//}
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




















