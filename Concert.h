//
//  Concert.h
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/22/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Concert : NSObject <MKAnnotation>
{
    NSString *venueName;
    NSString *concertDate;
    NSString *venueCityName;
    NSString *venueStateName;
    NSString *venueLatitude;
    NSString *venueLongitude;
    NSString *venueCountry;
    CLLocation *venueLocation;
}

//Concert properties
@property (nonatomic,strong) NSString *venueName;
@property (nonatomic,strong) NSString *concertDate;
@property (nonatomic,strong) NSString *venueCityName;
@property (nonatomic,strong) NSString *venueStateName;
@property (nonatomic,strong) NSString *venueLatitude;
@property (nonatomic,strong) NSString *venueLongitude;
@property (nonatomic,strong) NSString *venueCountry;
@property (nonatomic,strong) CLLocation *venueLocation;


+(id)concert;

//initializing with values
-(id)initWithName:(NSString *)v_name
             date:(NSString *)c_date
             city:(NSString *)c_city
            state:(NSString *)c_state
         latitude:(NSString *)c_latitude
        longitude:(NSString *)c_longitude
          country:(NSString *)c_country
         location:(CLLocation *)c_location;


@end
