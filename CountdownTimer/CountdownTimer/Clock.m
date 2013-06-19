//
//  Clock.m
//  CountdownTimer
//
//  Created by Samuel Frank on 6/18/13.
//  Copyright (c) 2013 Samuel Frank. All rights reserved.
//

#import "Time.h"
#import "Clock.h"

@implementation Clock
-(id) init {
    self = [super init];
    self->currentAlarm = @"Ping";
    return self;
}
-(void) startAlarm {
    [[NSSound soundNamed: currentAlarm] play];
}
/*
-(void) runClock {
    bool finished = false;
    while(!finished) {
        finished = [self->currentTime nextSecond];
        if(finished) {
            [self startAlarm];
            return;
        }
        [NSThread sleepForTimeInterval:1.0f];
    }
}
 */
@end
