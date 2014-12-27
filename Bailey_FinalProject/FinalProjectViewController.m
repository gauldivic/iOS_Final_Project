//
//  FinalProjectViewController.m
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/21/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import "FinalProjectViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ConcertCell.h"
#import "Concert.h"
#import "Restaurant.h"
#import "ConcertCallout.h"
#import "RestaurantCallout.h"

@interface FinalProjectViewController ()

@end

@implementation FinalProjectViewController

@synthesize concertTable,concerts,restaurants,mapView,mapContainer,artistInput;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    [mapView setMapType: MKMapTypeStandard];
    UIColor* color = [UIColor colorWithRed:240/255.0f green:216/255.0f blue:139/255.0f alpha:1.0f];
    
    mapContainer.backgroundColor = color;
    [mapContainer.layer setCornerRadius:30.0f];
    [mapContainer.layer setBorderColor:[UIColor blackColor].CGColor];
    [mapContainer.layer setBorderWidth:1.5f];
    
    mapView.layer.masksToBounds = YES;
    [mapView.layer setCornerRadius:30.0f];
    [mapView.layer setBorderColor:[UIColor blackColor].CGColor];
    [mapView.layer setBorderWidth:1.5f];
    
    UIView* bview = [[UIView alloc] init];
    
    bview.backgroundColor = color;
    [concertTable setBackgroundView:bview];
    [concertTable.layer setCornerRadius:30.0f];
    [concertTable.layer setBorderColor:[UIColor blackColor].CGColor];
    [concertTable.layer setBorderWidth:1.5f];


    
	// Do any additional setup after loading the view, typically from a nib.
}





//Methods for the TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"size of concerts%d",[self.concerts count]);
    
    return [self.concerts count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Turn down for what?");
    static NSString *CellIdentifier = @"ConcertCellItem";
    ConcertCell *cell = (ConcertCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ConcertCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Concert *c1 = [self.concerts objectAtIndex:indexPath.section];
    
    UIColor *cellColor = [UIColor colorWithRed:230/255.0f green:226/255.0f blue:175/255.0f alpha:1.0f];
    UIView *cellBG = [[UIView alloc]init];
    cellBG.backgroundColor = cellColor;
    
    [cellBG.layer setCornerRadius:30.0f];
    [cellBG.layer setBorderColor:[UIColor blackColor].CGColor];
    [cellBG.layer setBorderWidth:1.5f];
    
    [cell setBackgroundView:cellBG];
    
    cell.venuNameLabel.text = [c1 venueName];
    cell.venueAddressLabel.text = [NSString stringWithFormat:@"%@,%@",[c1 venueCityName],[c1 venueStateName]];
    cell.concertDateLabel.text = [c1 concertDate];
    cell.venueLatLongLabel.text = [NSString stringWithFormat:@"%@,%@",[c1 venueLatitude],[c1 venueLongitude]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mapView removeAnnotations:[self.mapView annotations]];
    //NSLog(@"push description: %@",[[self.concerts objectAtIndex:indexPath.section]description]);
    [mapView addAnnotation:(id)[self.concerts objectAtIndex:indexPath.section]];
    
    
    NSString *venLat = [[self.concerts objectAtIndex:indexPath.section]venueLatitude];
    NSString *venLong = [[self.concerts objectAtIndex:indexPath.section]venueLongitude];
    
    NSString *restaurantURL = [NSString stringWithFormat:@"http://api.yelp.com/business_review_search?term=resturants&lat=%@&long=%@&radius=10&limit=10&ywsid=9C9QttLRL7AnhgaW7N_gmA",venLat,venLong];
    
    
    NSMutableDictionary *restaurantDictionary = nil;
    self.restaurants = [NSMutableArray array];
    NSData *restaurantData = [NSData dataWithContentsOfURL:[NSURL URLWithString:restaurantURL]];
    
    if(restaurantData)
    {
        restaurantDictionary = [NSJSONSerialization JSONObjectWithData:restaurantData options:kNilOptions error:nil];
        NSMutableDictionary *businesses =restaurantDictionary[@"businesses"];
        for(int i = 0;i < [businesses count];i++)
        {
            NSString *restaurantName = restaurantDictionary[@"businesses"][i][@"name"];
            NSString *restaurantAddress = restaurantDictionary[@"businesses"][i][@"address1"];
            NSString *restaurantCity = restaurantDictionary[@"businesses"][i][@"city"];
            NSString *restaurantState = restaurantDictionary[@"businesses"][i][@"state"];
            NSString *restaurantZipcode = restaurantDictionary[@"businesses"][i][@"zip"];
            NSString *restaurantPhoneNumber = restaurantDictionary[@"businesses"][i][@"phone"];
            NSMutableString *restaurantCategories = [NSMutableString stringWithString:@""];
            NSMutableArray *restaurantCategoriesArray = [NSMutableArray array];
            restaurantCategoriesArray = restaurantDictionary[@"businesses"][i][@"categories"];
            for(int i = 0; i < [restaurantCategoriesArray count];i++)
            {
                NSString *tempCategory = restaurantCategoriesArray[i][@"name"];
                [restaurantCategories appendString:[NSString stringWithFormat:@"%@, ",tempCategory]];
            }
            NSString *distanceFromVenueToRestaurant = restaurantDictionary[@"businesses"][i][@"distance"];
            NSString *restaurantLatitude = restaurantDictionary[@"businesses"][i][@"latitude"];
            NSString *restaurantLongitude = restaurantDictionary[@"businesses"][i][@"longitude"];
            
            Restaurant *r = [Restaurant Restaurant];
            r.restaurantName = restaurantName;
            r.restaurantAddress = restaurantAddress;
            r.restaurantCity = restaurantCity;
            r.restaurantState = restaurantState;
            r.restaurantZipcode = restaurantZipcode;
            r.restaurantCategories = restaurantCategories;
            r.restaurantPhoneNumber = restaurantPhoneNumber;
            r.distanceFromVenueToRestaurant = distanceFromVenueToRestaurant;
            r.restaurantLatitude = restaurantLatitude;
            r.restaurantLongitude = restaurantLongitude;
            
            double tempLat = [r.restaurantLatitude doubleValue];
            double tempLong = [r.restaurantLongitude doubleValue];
            
            CLLocation *restaurantLocation = [[CLLocation alloc]initWithLatitude:tempLat longitude:tempLong];
            r.restaurantLocation = restaurantLocation;
            [self.restaurants addObject:r];
            [mapView addAnnotation:(id)r];


        }//end business for
    }//end if restaurantData
    MKMapRect zoomRect = MKMapRectNull;
    for(id <MKAnnotation> annotation in self.mapView.annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
        zoomRect = MKMapRectUnion(zoomRect, pointRect);
    }
    [self.mapView setVisibleMapRect:zoomRect animated:YES];

    
   
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
//End TableView Delegate methods

-(IBAction)searchButton:(id)sender
{
    [artistInput resignFirstResponder];
    
    //clearing previous entry and clearing the map
    [concerts removeAllObjects];
    [concertTable reloadData];
    [self.mapView removeAnnotations:[self.mapView annotations]];
    //end reset
    
    
    NSMutableString *artistString = [NSMutableString stringWithFormat:@"%@",artistInput.text];//artistInput.text;
    NSLog(@"Text entered: %@",artistString);
    
    NSLog(@"Text entered white: %@",[artistString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]);

    if([[artistString stringByReplacingOccurrencesOfString:@" " withString:@""] length] != 0)
    {
        /*
         [original stringByReplacingOccurrencesOfString:@"[ ]+"
         withString:@" "
         options:NSRegularExpressionSearch
         range:NSMakeRange(0, original.length)];
         */
        NSString *compactArtist = [artistString stringByReplacingOccurrencesOfString:@"[ ]+" withString:@" " options:NSRegularExpressionSearch range:NSMakeRange(0, artistString.length)];
        
        NSString *trimmedArtist = [compactArtist stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSString *formattedArtist = [trimmedArtist stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
            NSLog(@"string test:%@",formattedArtist);
            
            NSMutableString *urlString = [NSMutableString stringWithFormat:@"http://api.bandsintown.com/artists/%@/events.json?app_id=ios",formattedArtist
                                          ];
             dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
                NSLog(@"URL :%@",urlString);
                    NSData *concertData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                    
                    NSMutableArray *concertJSON = nil;
                    concerts= [NSMutableArray array];
                    if(concertData)
                    {
                        concertJSON = [NSJSONSerialization JSONObjectWithData:concertData options:kNilOptions error:nil];
                    }
                    NSLog(@"%lu",(unsigned long)[concertJSON count]);
                    NSLog(@"Concert Json: %@",concertJSON);
                    if([concertJSON count] <= 0 || concertJSON == nil )
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            UIAlertView *zeroResultsMessage = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There are zero Results! A couple of things could be the problem.\n One you may have misspelled the artist name. \nTwo the artist may not be touring in the USA. \nThree the artist has not reported concert data to Bandisintown. " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [zeroResultsMessage show];

                        });
                        
                                            }
                    else if([concertJSON count] >0)
                    {
                        
                        NSString *america = [NSString stringWithFormat:@"United States"];
                        NSString *venueCountry;
                        for(int i = 0; i < [concertJSON count];i++)
                        {
                            //  NSLog(@"Inside for loop");
                            venueCountry = [[concertJSON[i] objectForKey:@"venue"] objectForKey:@"country"];
                            
                            if([america isEqualToString:venueCountry] == YES)
                            {
                                NSString *venueName = [[concertJSON[i] objectForKey:@"venue"] objectForKey:@"name"];
                                NSString *concertDate = [concertJSON[i] objectForKey:@"datetime"];
                                NSString *cityName = [[concertJSON[i] objectForKey:@"venue"]objectForKey:@"city"];
                                NSString *stateName = [[concertJSON[i] objectForKey:@"venue"]objectForKey:@"region"];
                                NSString *latitude = [[concertJSON[i] objectForKey:@"venue"]objectForKey:@"latitude"];
                                NSString *longitude = [[concertJSON[i] objectForKey:@"venue"]objectForKey:@"longitude"];
                                NSString *country = [[concertJSON[i] objectForKey:@"venue"]objectForKey:@"country"];
                                
                                Concert *c = [Concert concert];
                                c.venueName = venueName;
                                c.concertDate = concertDate;
                                c.venueCityName = cityName;
                                c.venueStateName = stateName;
                                c.venueLatitude = latitude;
                                c.venueLongitude = longitude;
                                c.venueCountry = country;
                                
                                double tempLat = [latitude doubleValue];
                                double tempLong = [longitude doubleValue];
                                
                                CLLocation *venueLocation = [[CLLocation alloc]initWithLatitude:tempLat longitude:tempLong];
                                c.venueLocation = venueLocation;
                                
                                [concerts addObject:c];
                            }//end america equals
                        }//end for
                    }
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
                   [concertTable reloadData];
                 });
               });
        
    }
    else
    {
        /*
         UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hello World!"
         message:@"This is your first UIAlertview message."
         delegate:nil
         cancelButtonTitle:@"OK"
         otherButtonTitles:nil];
         
         [message show];
         */
        UIAlertView *emptyMessage = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Search can not be blank! Please enter an artist!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [emptyMessage show];
    }
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mv viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *view = nil;
    if ([annotation isKindOfClass:[Concert class]])
    {
        Concert *concertAnnotation = (Concert*)annotation;
        view = [mv dequeueReusableAnnotationViewWithIdentifier:@"concertAnnotation"];
        if(view == nil)
        {
            view = [[MKPinAnnotationView alloc]initWithAnnotation:(id)concertAnnotation reuseIdentifier:@"concertAnnotation"];
        }
       
        view.image = [UIImage imageNamed:@"club.png"];
        view.annotation = annotation;
         view.canShowCallout = NO;
    }
    else if([annotation isKindOfClass:[Restaurant class]])
    {
        Restaurant *restaurantAnnotation = (Restaurant*)annotation;
        view = [mv dequeueReusableAnnotationViewWithIdentifier:@"restaurantAnnotation"];
        if(view == nil)
        {
             view = [[MKPinAnnotationView alloc]initWithAnnotation:(id)restaurantAnnotation reuseIdentifier:@"restaurantAnnotation"];
        }
        view.image = [UIImage imageNamed:@"restaurant.png"];
        view.annotation = annotation;
        view.canShowCallout = NO;
    }
    return view;
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    [self.mapView deselectAnnotation:view.annotation animated:YES];
    
    if([view.annotation isKindOfClass:[Concert class]])
    {
        
        Concert *concertObject = view.annotation;
        ConcertCallout *concertCallout = [[ConcertCallout alloc]init];
        concertCallout.c1 = concertObject;
        UIPopoverController *popOver = [[UIPopoverController alloc]initWithContentViewController:concertCallout];
        self.annotationPopoverController = popOver;
        popOver.popoverContentSize = CGSizeMake(300, 195);
        [popOver presentPopoverFromRect:view.bounds inView:view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
               
    }
    else if([view.annotation isKindOfClass:[Restaurant class]])
    {
        Restaurant *restaurantObject = view.annotation;
        NSLog(@"Restaurant info: %@",[restaurantObject description]);
        RestaurantCallout *restaurantCallout = [[RestaurantCallout alloc]init];
        restaurantCallout.r1 = restaurantObject;
        
        UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:restaurantCallout];
        self.annotationPopoverController = popOver;
        popOver.popoverContentSize = CGSizeMake(330, 300);
        [popOver presentPopoverFromRect:view.bounds inView:view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end










































