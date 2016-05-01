//
//  TypeSelectionViewController.h
//  HighVoltage
//
//  Created by Donny Davis on 5/1/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TypeSelectionDelegate <NSObject>
@required
- (void)returnSelectedType:(NSInteger)type andValue:(NSString *)value;

@end

@interface TypeSelectionViewController : UIViewController

@property (strong, nonatomic) id<TypeSelectionDelegate> delegate;

@end
