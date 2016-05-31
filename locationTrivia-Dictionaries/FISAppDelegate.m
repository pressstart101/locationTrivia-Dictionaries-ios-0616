//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}







- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length{
    NSString *name = location[@"name"];
    
    if (name.length > length) {
        return [name substringToIndex:length];
    } else {
        return name;
    }
}
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                     longitude:(CGFloat)longitude{
    
    NSNumber *latitudeNumber = @(latitude);
    NSNumber *longitudeNumber = @(longitude);
    
    NSMutableDictionary *resultDictionary = [@{@"name" : name,
                                               @"latitude" : latitudeNumber,
                                               @"longitude" : longitudeNumber}
                                             mutableCopy];
    return resultDictionary;
}
- (NSArray *)namesOfLocations:(NSArray *)locations{
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i< [locations count]; i++){
        
        if ([[locations[i]allKeys]containsObject:@"name"]){
            NSString *str = locations[i][@"name"];
            [resultArray addObject:str];

            NSLog(@"\n\n\n\n%@\n\n\n\n", str);
        }else{
            return resultArray;
        }
    }
    return resultArray;
}
- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    NSMutableSet *resultSet = [[NSMutableSet alloc]init];
    NSSet *compareTo = [NSSet setWithObjects:@"name", @"latitude", @"longitude", nil];
    for(NSString *key in dictionary){
        [resultSet addObject:key];
    }
    if ([resultSet isEqual:compareTo]){
        return YES;
    }else{
        return NO;
    }
}
- (NSDictionary *)locationNamed:(NSString *)name
                    inLocations:(NSArray *)locations{
    for (NSDictionary *element in locations){
        if ([element[@"name"] isEqualToString: name]){
            return element;
        }
    
    }
return nil;
}

/**
 
 *  Write your method implementations here.
 
 */

@end
