//
//  FinalProjectViewController.h
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/21/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ConcertCallout.h"

@interface FinalProjectViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate,UITableViewDelegate,UITableViewDataSource,MKAnnotation>
{
    IBOutlet UITableView *concertTable;
    IBOutlet MKMapView *mapView;
    IBOutlet UIView *mapContainer;
    IBOutlet UITextField *artistInput;
}

@property (strong,nonatomic) NSMutableArray *concerts;
@property (strong,nonatomic) NSMutableArray *restaurants;
@property (strong,nonatomic) UITextField *artistInput;

@property (nonatomic,strong) UITableView *concertTable;
@property (nonatomic,strong) UIView* mapContainer;
@property (nonatomic,strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) UIPopoverController *annotationPopoverController;

-(IBAction)searchButton:(id)sender;

@end
