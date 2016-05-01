//
//  Calculator.m
//  HighVoltage
//
//  Created by Donny Davis on 5/1/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

//
// Watts calculations
//

- (int)calculateWattsWithVolts:(int)volts andAmps:(int)amps {
    return volts * amps;
}

- (int)calculateWattsWithVolts:(int)volts andOhms:(int)ohms {
    return (volts * volts) / ohms;
}

- (int)calculateWattsWithAmps:(int)amps andOhms:(int)ohms {
    return (amps * amps) * ohms;
}

//
// Volts calculations
//

- (int)calculateVoltsWithAmps:(int)amps andOhms:(int)ohms {
    return amps * ohms;
}

- (int)calculateVoltsWithWatts:(int)watts andAmps:(int)amps {
    return watts / amps;
}

- (int)calculateVoltsWithWatts:(int)watts andOhms:(int)ohms {
    return sqrt(watts * ohms);
}

//
// Amps calculations
//

- (int)calculateAmpsWithVolts:(int)volts andOhms:(int)ohms {
    return volts / ohms;
}

- (int)calculateAmpsWithWatts:(int)watts andVolts:(int)volts {
    return watts / volts;
}

- (int)calculateAmpsWithWatts:(int)watts andOhms:(int)ohms {
    return sqrt(watts / ohms);
}

//
// Ohms calculations
//

- (int)calculateOhmsWithVolts:(int)volts andAmps:(int)amps {
    return volts / amps;
}

- (int)calculateOhmsWithVolts:(int)volts andWatts:(int)watts {
    return (volts * volts) / watts;
}

- (int)calculateOhmsWithWatts:(int)watts andAmps:(int)amps {
    return watts / (amps * amps);
}

@end
