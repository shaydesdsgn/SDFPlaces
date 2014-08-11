SDFPlaces
=========
Designed to make it easier to plug into the [google places](https://developers.google.com/places/documentation/search) api.

# Usage

1. Add all the project files to your project
2. If you want to use the image property of places you will be required to source your own images. Refer to the images section below for the images your require.
3. You will need to fire off the query in the background as follows

  ```
  SDFPlace *currentPlace = ... create a new place based on your current coords (try Location Manager)
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // This will get us the places for the user to select
        SDFPlaces *p = [SDFPlaces new];
        p.apiKey = @"[google api key]";
        SDFPlacesQuery *q = [SDFPlacesQuery new];
        q.location = currentPlace;
        q.radius = 500; // Distance in meters for places
        q.sensor = YES;
        NSMutableArray *places; = [[p searchForQuery:q] mutableCopy];
        if (!places) places = [NSMutableArray new];
        
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES comparator:^NSComparisonResult(NSString *a, NSString *b) {
            return [a compare:b];
        }];
        places = [[places sortedArrayUsingDescriptors:@[sort]] mutableCopy];
        
        [places insertObject:currentPlace atIndex:0];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            // Return to main thread to use the places in some way
        });
    });
  ```

# Images

If you want images you will need to supply your own. You will need to have an image named exactly as per below. It is the first name you are after, e.g. you will need to have an image (preferably in the Images.xcassets) named "Baloon", see first entry below. This will cover all google places under the amusment_park tag. You can move these around how you see fit. This was just how I wanted them grouped.

```
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
```
