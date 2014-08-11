//
//  SDFPlacesQuery.h
//
//  Created by Trent Milton on 26/12/2013.
//  Copyright (c) 2013 shaydes.dsgn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDFPlacesQuery : NSObject

// The latitude/longitude around which to retrieve Place information. This must be specified as latitude,longitude.
@property (nonatomic) CGPoint location; // x = lat, y = long
// Defines the distance (in meters) within which to return Place results. The maximum allowed radius is 50 000 meters. Note that radius must not be included if rankby=distance (described under Optional parameters below) is specified.
@property (nonatomic) int radius;
// Indicates whether or not the Place request came from a device using a location sensor (e.g. a GPS) to determine the location sent in this request. This value must be either true or false.
@property (nonatomic) BOOL sensor;

@end
