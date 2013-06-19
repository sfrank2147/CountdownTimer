//
//  ClockController.h
//  CountdownTimer
//
//  Created by Samuel Frank on 6/18/13.
//  Copyright (c) 2013 Samuel Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "Clock.h"


@interface ClockController : NSObject {
    IBOutlet NSTextField *hourField;
    IBOutlet NSTextField *minuteField;
    IBOutlet NSTextField *secondField;
    
    IBOutlet NSTextField *timeField;
    
    NSTimer *startTimer;
    
    bool ticking;
    
    Clock *clock;
    //bool clockFinished;
}

-(IBAction) startTimer: (id) sender;
-(IBAction) stopTimer: (id) sender;
-(void) clockTick;

@end
