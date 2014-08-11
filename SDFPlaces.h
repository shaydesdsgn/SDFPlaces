//
//  SDFPlaces.h
//
//  Created by Trent Milton on 26/12/2013.
//  Copyright (c) 2013 shaydes.dsgn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDFPlacesQuery.h"

// Documentation found at https://developers.google.com/places/documentation/search

@interface SDFPlaces : NSObject

// Your application's API key. This key identifies your application for purposes of quota management and so that Places added from your application are made immediately available to your app. Visit the APIs Console to create an API Project and obtain your key.
@property (nonatomic, strong) NSString *apiKey;

- (NSArray *) searchForQuery:(SDFPlacesQuery *)query;

@end
