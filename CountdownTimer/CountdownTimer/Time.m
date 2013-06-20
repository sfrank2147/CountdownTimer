//
//  Time.m
//  CountdownTimer
//
//  Created by Samuel Frank on 6/18/13.
//  Copyright (c) 2013 Samuel Frank. All rights reserved.
//

#import "Time.h"

@implementation Time
@synthesize hour, minute, second;

-(id) init {
    self = [super init];
    self.hour = 0;
    self.minute = 0;
    self.second = 0;
    return self;
}

-(void) setHour: (int) h Minute:(int) m Second:(int) s {
    if(h < 0) {
        self.hour = 0;
    } else if (h > 24) {
        self.hour = 24;
    } else {
        self.hour = h;
    }
    if(m < 0) {
        self.minute = 0;
    } else if (m > 60){
        self.minute = 60;
    } else {
        self.minute = m;
    }
    if(s < 0) {
        self.second = 0;
    } else if(s > 60) {
        self.second = 60;
    } else {
        self.second = s;
    }
}

-(id) initWithHour: (int) h Minute:(int) m Second:(int) s {
    self = [super init];
    [self setHour: h Minute: m Second: s];
    return self;
}

//changes the second.  Returns true if time is up, false otherwise.
-(bool) nextSecond {
    self.second--;
    if(self.second<=0 && self.minute<=0 && self.hour<=0) {
        self.second = 0;
        return true;
    }
    if(self.second < 0) {
        if(self.minute == 0) {
            self.hour--;
            self.minute = 59;
            self.second = 59;
        } else {
            self.minute--;
            self.second = 59;
        }
    }
    return false;
}
    /*
    if(self.second <= 0) {
        if(self.minute <= 0) {
            if(self.hour <= 0) {
                return true;
            }
            else {
                self.hour--;
                self.minute = 59;
                self.second = 59;
                return false;
            }
        } else {
            self.minute--;
            self.second = 59;
            return false;
        }
    }else {
        return false;
    }
     */


-(NSString*) display {
    return ([NSString stringWithFormat:@"%02d:%02d:%02d",self.hour,self.minute,self.second]);
}

@end
