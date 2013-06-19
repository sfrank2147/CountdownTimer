//
//  Time.h
//  CountdownTimer
//
//  Created by Samuel Frank on 6/18/13.
//  Copyright (c) 2013 Samuel Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "Clock.h"

@interface Time : NSObject {
    int hour, minute, second;
}

@property(readwrite) int hour, minute, second;

-(id) initWithHour: (int) h Minute:(int) m Second:(int) s;

-(bool) nextSecond; //changes hour, minute, and second and deals with case when time runs out.

-(NSString*) display;
@end
