//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Kenneth Cooke on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)init{
    self = [self initWithName:@"" latitude:0 longitude:0];
    
    return self;
}

-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    NSString *truncatedName;
    if (self.name.length >= length) {
        truncatedName = [self.name substringToIndex:length];
    } else {
        truncatedName = self.name;
    }
    return truncatedName;
}

-(BOOL)hasValidData{
    if (self.name.length == 0) {
        return NO;
    }
    if (self.latitude < -90.0 || self.latitude > 90.0 ) {
        return NO;
    }
    if (self.longitude <= -180.0 || self.longitude >= 180.0) {
        return NO;
    }
    return YES;
}

-(FISTrivium *)triviumWithMostLikes{
    if (self.trivia.count == 0) {
        return nil;
    }
    NSSortDescriptor *sortTriviumDesc = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    [self.trivia sortUsingDescriptors:@[sortTriviumDesc]];
    return self.trivia[0];
}


@end
