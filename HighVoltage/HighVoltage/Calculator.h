//
//  Calculator.h
//  HighVoltage
//
//  Created by Donny Davis on 5/1/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

- (int)calculateWattsWithVolts:(int)volts andAmps:(int)amps;
- (int)calculateWattsWithVolts:(int)volts andOhms:(int)ohms;
- (int)calculateWattsWithAmps:(int)amps andOhms:(int)ohms;

- (int)calculateVoltsWithAmps:(int)amps andOhms:(int)ohms;
- (int)calculateVoltsWithWatts:(int)watts andAmps:(int)amps;
- (int)calculateVoltsWithWatts:(int)watts andOhms:(int)ohms;

- (int)calculateAmpsWithVolts:(int)volts andOhms:(int)ohms;
- (int)calculateAmpsWithWatts:(int)watts andVolts:(int)volts;
- (int)calculateAmpsWithWatts:(int)watts andOhms:(int)ohms;

- (int)calculateOhmsWithVolts:(int)volts andAmps:(int)amps;
- (int)calculateOhmsWithVolts:(int)volts andWatts:(int)watts;
- (int)calculateOhmsWithWatts:(int)watts andAmps:(int)amps;

@end
