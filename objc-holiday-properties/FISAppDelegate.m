//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return [self.database[season] allKeys];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
  //  NSMutableDictionary *holidaysWithLists = self.database[season];
   // return holidaysWithLists[holiday];
    return self.database[season][holiday];
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    BOOL holidayisInSeason = self.database[season][holiday];
    return holidayisInSeason;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    BOOL supplyIsFound = NO;
    //NSArray *listofSuppliesInHolidayInSeason = [self suppliesInHoliday:holiday inSeason:season inDatabase:self.database];
    
    NSArray *listOfSupplies = [self suppliesInHoliday:holiday inSeason:season];
    
    for (NSString *item in listOfSupplies) {
        if ([item isEqualToString:supply]) {
            supplyIsFound = YES;
        }
    }
 
    return supplyIsFound;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
   // NSDictionary *newHoliday = [[NSDictionary alloc] initWithObjectsAndKeys:@[], holiday, nil];

    NSMutableArray *emptySupplyList = [[NSMutableArray alloc] init];
    self.database[season][holiday] = emptySupplyList;

 
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply];
    // no return
}

@end
