//
//  Clock.h
//  CountdownTimer
//
//  Created by Samuel Frank on 6/18/13.
//  Copyright (c) 2013 Samuel Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@class Time;

@interface Clock : NSObject {
    @public Time *currentTime;
    NSString *currentAlarm;
}
-(void) startAlarm;
//-(void) runClock;

@end
