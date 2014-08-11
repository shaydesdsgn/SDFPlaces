//
//  SDFPlaces.m
//
//  Created by Trent Milton on 26/12/2013.
//  Copyright (c) 2013 shaydes.dsgn. All rights reserved.
//

#define kSDFPlacesUrl @"https://maps.googleapis.com/maps/api/place/search/json?"

#import "SDFPlaces.h"
#import "SDFPlace.h"

@implementation SDFPlaces

- (NSArray *) searchForQuery:(SDFPlacesQuery *)query {
    NSAssert(self.apiKey != nil && self.apiKey.length > 0, @"SDFPlaces: No API key set!");


    NSString *queryString = [NSString stringWithFormat:@"key=%@&location=%f,%f&radius=%d&sensor=%@",
                             self.apiKey,
                             query.location.x, query.location.y,
                             query.radius,
                             query.sensor ? @"true" : @"false"];
    NSString *url = [kSDFPlacesUrl stringByAppendingString:queryString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10];
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSMutableArray *places = [NSMutableArray new];
    if (data) {
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        for (id place in [json valueForKeyPath:@"results"]) {
            SDFPlace *p = [SDFPlace new];
            p.name = [place valueForKeyPath:@"name"];
            p.vicinity = [place valueForKeyPath:@"vicinity"];
            p.types = [place valueForKeyPath:@"types"];
            p.location = CGPointMake([[place valueForKeyPath:@"geometry.location.lat"] floatValue], [[place valueForKeyPath:@"geometry.location.lng"] floatValue]);
            [places addObject:p];
        }
    }
    return places;
}

@end
