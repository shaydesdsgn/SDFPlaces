//
//  SDFPlace.h
//
//  Created by Trent Milton on 26/12/2013.
//  Copyright (c) 2013 shaydes.dsgn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDFPlace : NSObject

// Contains the human-readable name for the returned result. For establishment results, this is usually the business name.
@property (nonatomic, strong) NSString *name;
// Contains a feature name of a nearby location. Often this feature refers to a street or neighborhood within the given results. The vicinity property is only returned for a Nearby Search.
@property (nonatomic, strong) NSString *vicinity;
// Restricts the results to Places matching at least one of the specified types. Types should be separated with a pipe symbol (type1|type2|etc). See the list of supported types https://developers.google.com/places/documentation/supported_types
@property (nonatomic, strong) NSArray *types;
@property (nonatomic) CGPoint location;
@property (nonatomic, readonly) UIImage *image;

@end
