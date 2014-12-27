//
//  Restaurant.h
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/22/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Restaurant : NSObject <MKAnnotation>
{
    NSString *restaurantName;
    NSString *restaurantAddress;
    NSString *restaurantCity;
    NSString *restaurantState;
    NSString *restaurantZipcode;
    NSString *restaurantPhoneNumber;
    NSString *restaurantCategories;
    NSString *distanceFromVenueToRestaurant;
    NSString *restaurantLatitude;
    NSString *restaurantLongitude;
    CLLocation *restaurantLocation;
}

//properties
@property (nonatomic,strong)NSString *restaurantName;
@property (nonatomic,strong)NSString *restaurantAddress;
@property (nonatomic,strong)NSString *restaurantCity;
@property (nonatomic,strong)NSString *restaurantState;
@property (nonatomic,strong)NSString *restaurantZipcode;
@property (nonatomic,strong)NSString *restaurantPhoneNumber;
@property (nonatomic,strong)NSString *restaurantCategories;
@property (nonatomic,strong)NSString *distanceFromVenueToRestaurant;
@property (nonatomic,strong)NSString *restaurantLatitude;
@property (nonatomic,strong)NSString *restaurantLongitude;
@property (nonatomic,strong)CLLocation *restaurantLocation;



+(id)Restaurant;

-(id)initWithName:(NSString *)r_name
          address:(NSString *)r_address
             city:(NSString *)r_city
            state:(NSString *)r_state
          zipcode:(NSString *)r_zipcode
      phoneNumber:(NSString *)r_phoneNumber
       categories:(NSString *)r_categories
         distance:(NSString *)r_distanceToVenue
         latitude:(NSString *)r_latitude
        longitude:(NSString *)r_longitude
         location:(CLLocation *)r_location;

@end











































