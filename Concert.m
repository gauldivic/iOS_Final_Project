//
//  Concert.m
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/22/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import "Concert.h"

@implementation Concert

@synthesize venueName,concertDate,venueCityName,venueStateName,venueLatitude,venueLongitude,venueCountry,venueLocation;



+(id)concert
{
    Concert *concert = [[self alloc] init];
    return concert;
}

//default initializer
-(id)init
{
    return [self initWithName:@"unknown" date:@"unknown" city:@"unknown" state:@"unknown" latitude:@"unknown" longitude:@"unknown" country:@"unknown" location:nil];
}


//initializing with values
-(id)initWithName:(NSString *)v_name date:(NSString *)c_date city:(NSString *)c_city state:(NSString *)c_state latitude:(NSString *)c_latitude longitude:(NSString *)c_longitude country:(NSString *)c_country location:(CLLocation *)c_location
{
    self = [super init];
    if(self != nil)
    {
        self.venueName = v_name;
        self.concertDate = c_date;
        self.venueCityName = c_city;
        self.venueStateName = c_state;
        self.venueLatitude = c_latitude;
        self.venueLongitude = c_longitude;
        self.venueCountry = c_country;
        self.venueLocation = c_location;
    }
    return self;
}

-(CLLocationCoordinate2D) coordinate
{
    //NSLog(@"coordinate called for %@",parkName);
    return self.venueLocation.coordinate;
}


//description method
-(NSString *)description
{
    NSString *returnString = [NSString stringWithFormat:@"\rvenueName: %@\rconcertDate:%@\rcity,state:%@,%@\rlatitude and longitude:%@,%@\rcountry: %@ \rvenueLocation: %@", venueName,concertDate,venueCityName,venueStateName,venueLatitude,venueLongitude,venueCountry,venueLocation];
    
    return returnString;
}


@end


















