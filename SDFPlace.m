//
//  SDFPlace.m
//
//  Created by Trent Milton on 26/12/2013.
//  Copyright (c) 2013 shaydes.dsgn. All rights reserved.
//

#import "SDFPlace.h"

@implementation SDFPlace

static NSArray *_imageNameToTypeMappings;

- (UIImage *) image {
    if (!_imageNameToTypeMappings) {
        _imageNameToTypeMappings = @[
                               @[@"Baloon",             @[@"amusement_park"]],
                               @[@"Barbell",            @[@"gym"]],
                               @[@"Beer",               @[@"bar", @"liquor_store", @"night_club"]],
                               @[@"Bike",               @[@"bicycle_store"]],
                               @[@"Book",               @[@"book_store", @"library", @"school"]],
                               @[@"Bowling",            @[@"bowling_alley"]],
                               @[@"Box",                @[@"storage"]],
                               @[@"Brush",              @[@"painter"]],
                               @[@"Building",           @[@"city_hall", @"embassy", @"fire_station", @"local_government_office", @"museum", @"police", @"real_estate_agency"]],
                               @[@"Bus",                @[@"bus_station"]],
                               @[@"Cross_Religion",     @[@"church", @"hindu_temple", @"mosque", @"place_of_worship", @"synagogue"]],
                               @[@"Default_Tag",        @[@"furniture_store", @"general_contractor", @"hair_care", @"lodging", @"spa"]],
                               @[@"Dice",               @[@"casino"]],
                               @[@"Electricity",        @[@"electrician", @"electronics_store"]],
                               @[@"Envelope",           @[@"post_office"]],
                               @[@"Film",               @[@"movie_rental", @"movie_theater", @"moving_company"]],
                               @[@"Fish",               @[@"aquarium", @"pet_store", @"veterinary_care", @"zoo"]],
                               @[@"Flower",             @[@"florist", @"park"]],
                               @[@"Food",               @[@"food", @"bakery", @"cafe", @"grocery_or_supermarket", @"meal_delivery", @"meal_takeaway", @"restaurant"]],
                               @[@"Football",           @[@"stadium"]],
                               @[@"Gavel",              @[@"courthouse", @"lawyer"]],
                               @[@"Lock",               @[@"locksmith"]],
                               @[@"Medical",            @[@"doctor", @"dentist", @"health", @"hospital", @"pharmacy", @"physiotherapist"]],
                               @[@"Money",              @[@"atm", @"bank", @"finance", @"accounting", @"insurance_agency"]],
                               @[@"Picture",            @[@"art_gallery"]],
                               @[@"Plane",              @[@"airport", @"travel_agency"]],
                               @[@"Railroad",           @[@"subway_station", @"train_station"]],
                               @[@"Ring",               @[@"jewelry_store"]],
                               @[@"Shop",               @[@"beauty_salon", @"convenience_store", @"department_store", @"establishment", @"shopping_mall", @"store"]],
                               @[@"Skull",              @[@"cemetery", @"funeral_home"]],
                               @[@"Taxi",               @[@"taxi_stand"]],
                               @[@"Tent",               @[@"campground"]],
                               @[@"Tools",              @[@"hardware_store", @"home_goods_store", @"plumber", @"roofing_contractor"]],
                               @[@"University",         @[@"university"]],
                               @[@"Wheel",              @[@"car_dealer", @"car_rental", @"car_repair", @"car_wash", @"gas_station", @"parking", @"rv_park"]]
                               ];
    }

    NSString *name = @"Default_Tag";
    if ([self.name isEqualToString:self.vicinity]) {
        name = @"Earth";
    } else if (self.types.count > 0) {
        NSString *type = [self.types objectAtIndex:0];
        for (NSArray *imageNameToTypeMapping in _imageNameToTypeMappings) {
            // Search through the mapped types to see if the first type of the place matches
            if ([[imageNameToTypeMapping objectAtIndex:1] containsObject:type]) {
                name = [imageNameToTypeMapping objectAtIndex:0];
            }        }
    }
    return [UIImage imageNamed:name];
}

@end
