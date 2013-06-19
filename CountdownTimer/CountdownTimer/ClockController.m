//
//  ClockController.m
//  CountdownTimer
//
//  Created by Samuel Frank on 6/18/13.
//  Copyright (c) 2013 Samuel Frank. All rights reserved.
//

#import "ClockController.h"
#import "Time.h"
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <dispatch/dispatch.h>

@implementation ClockController

-(id) init {
    self = [super init];
    startTimer = nil;
    return self;
}

-(IBAction) startTimer:(id) sender{
    //initialize starting times
    int startingHour = [hourField intValue];
    int startingMinute = [minuteField intValue];
    int startingSecond = [secondField intValue];
    
    //set the clock's starting time to the times it's given
    clock = [[Clock alloc] init];
    clock->currentTime = [[Time alloc]
                          initWithHour:startingHour Minute:startingMinute Second:startingSecond];
    
    //log the starting time
    NSLog(@"%d:%d:%d",clock->currentTime.hour,clock->currentTime.minute,clock->currentTime.second);
   
    //timer starts, calls clockTick every second passing itself as a parameter
    startTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                           target: self
                                                         selector:@selector(clockTick)
                                                         userInfo:nil
                                                          repeats:YES];
    [timeField setStringValue:[clock->currentTime display]];
    return;
}

-(IBAction) stopTimer:(id)sender {
    if(self->startTimer != nil) {
        [self->startTimer invalidate];
        self->startTimer = nil;
    }
}

-(void) clockTick {
    //gets the next second, checks if it's finished
    bool finished = [clock->currentTime nextSecond];
    
    //updates the time when method returns
    NSString *cTime = [clock->currentTime display];
    [timeField setStringValue:cTime];
    NSLog(@"%@",cTime);
    
    //if counted to 0, sound the alarm and deactivated the timer
    if(finished) {
        [self->clock startAlarm];
        [self->startTimer invalidate];
        self->startTimer = nil;
    }
    return;
}
@end
/*
-(IBAction) startTimer:(id)sender {
    int startingHour = [hourField intValue];
    int startingMinute = [minuteField intValue];
    int startingSecond = [secondField intValue];
    
    clock = [[Clock alloc] init];
    clock->currentTime = [[Time alloc]
                          initWithHour:startingHour Minute:startingMinute Second:startingSecond];
    
    NSLog(@"%d:%d:%d",clock->currentTime.hour,clock->currentTime.minute,clock->currentTime.second);
    
    self->ticking = false;
    while(!self->clockFinished) {
        [self performSelectorInBackground:@selector(clockTick) withObject: nil];
        while(!self->ticking) {
            
        }
        if(self->clockFinished == true) {
            [self->clock startAlarm];
            return;
        }*/
        /*
        finished = [clock->currentTime nextSecond]; //next second
        NSString *cTime = [clock->currentTime display];  //change display
        [timeField setStringValue:cTime];
        
        NSLog(@"%@",cTime);
        
        if(finished) {
            [clock startAlarm];
            return;
        }
        
        [NSThread sleepForTimeInterval:1.0f];
         */
//    }
//}
/*
-(void) clockTick {
    sleep(1);
    self->clockFinished = [clock->currentTime nextSecond];
    NSLog(@"Clock Finished: %i",self->clockFinished);
    NSString *cTime = [clock->currentTime display];
    [timeField setStringValue: cTime];
    NSLog(@"%@",cTime);
    self->ticking = true;
    return;
}
@end
*/
/*
 
 //the old clock countdown method belonged to Clock
 
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