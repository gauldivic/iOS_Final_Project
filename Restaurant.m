//
//  Restaurant.m
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/22/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

@synthesize restaurantName,restaurantAddress,restaurantCity,restaurantState,restaurantZipcode,restaurantPhoneNumber,restaurantCategories,distanceFromVenueToRestaurant,restaurantLatitude,restaurantLongitude,restaurantLocation;

+(id)Restaurant
{
    Restaurant *restaurant = [[self alloc] init];
    return restaurant;
}

-(NSString *) title
{
    return restaurantName;
}

//default initializer
-(id)init
{
    return [self initWithName:@"unknown" address:@"unknown" city:@"unknown" state:@"unknown" zipcode:@"unknown" phoneNumber:@"unknown" categories:@"unknown" distance:@"unknown" latitude:@"unknown" longitude:@"unknown" location:nil];
}

//initializing with values
-(id)initWithName:(NSString *)r_name address:(NSString *)r_address city:(NSString *)r_city state:(NSString *)r_state zipcode:(NSString *)r_zipcode phoneNumber:(NSString *)r_phoneNumber categories:(NSString *)r_categories distance:(NSString *)r_distanceToVenue latitude:(NSString *)r_latitude longitude:(NSString *)r_longitude location:(CLLocation *)r_location
{
    self = [super init];
    if (self != nil)
    {
        self.restaurantName = r_name;
        self.restaurantAddress = r_address;
        self.restaurantCity = r_city;
        self.restaurantState = r_state;
        self.restaurantZipcode = r_zipcode;
        self.restaurantPhoneNumber = r_phoneNumber;
        self.restaurantCategories = r_categories;
        self.distanceFromVenueToRestaurant = r_distanceToVenue;
        self.restaurantLatitude = r_latitude;
        self.restaurantLongitude = r_longitude;
        self.restaurantLocation = r_location;
        
    }
    return self;
    
}

-(CLLocationCoordinate2D) coordinate
{
    return self.restaurantLocation.coordinate;
}

//description method
-(NSString *)description
{
    NSString *returnString = [NSString stringWithFormat:@"\rrestaurantName:%@ \rrestaurantAddress:%@ \rrestaurantCity: %@ \rrestaurantState: %@ \rrestaurantZipcode: %@ \rrestaurantPhoneNumber: %@ \rrestaurantCategories: %@ \rdistanceFromVenueToRestaurant: %@ \rrestaurantLatitude: %@ \rrestaurantLongitude: %@ \rrestaurantLocation: %@",restaurantName,restaurantAddress,restaurantCity,restaurantState,restaurantZipcode,restaurantPhoneNumber,restaurantCategories,distanceFromVenueToRestaurant,restaurantLatitude,restaurantLongitude,restaurantLocation];
    return returnString;
}

@end






























