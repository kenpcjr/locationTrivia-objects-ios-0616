//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames{
    NSMutableArray *locationNames = [@[]mutableCopy];
    for (FISLocation *location in self.locations) {
        [locationNames addObject:location.name];
    }
    return locationNames;
}

-(FISLocation *)locationNamed:(NSString *)name{
    NSPredicate *matchingLocationName = [NSPredicate predicateWithFormat:@"name LIKE %@",name ];
    NSArray *filteredForMatchingLocationName = [self.locations filteredArrayUsingPredicate:matchingLocationName];
    if (filteredForMatchingLocationName.count == 0) {
        return nil;
    }
    return filteredForMatchingLocationName[0];
}
//Define the locationsNearLatitude:longitude:margin: method to return an array of all the locations whose coordinates are within ±margin degrees from the given location.
-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin{
    
    NSMutableArray *locationsWithinMargin = [[NSMutableArray alloc]init];
    for (FISLocation *location in self.locations) {
        if (location.latitude <= (latitude + margin) && location.latitude >= (latitude - margin) && location.longitude <= (longitude + margin) && location.longitude >= (longitude - margin)) {
            [locationsWithinMargin addObject:location];
        }
    }
    return locationsWithinMargin;
}
@end
