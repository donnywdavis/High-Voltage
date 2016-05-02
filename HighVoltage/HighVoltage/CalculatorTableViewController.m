//
//  CalculatorTableViewController.m
//  HighVoltage
//
//  Created by Donny Davis on 5/1/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "CalculatorTableViewController.h"
#import "TypeSelectionViewController.h"
#import "Calculator.h"

@interface CalculatorTableViewController () <TypeSelectionDelegate, UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *wattsLabel;
@property (weak, nonatomic) IBOutlet UILabel *voltsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ampsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ohmsLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (strong, nonatomic) Calculator *calculator;
@property (strong ,nonatomic) TypeSelectionViewController *typeSelectionVC;

@property (strong, nonatomic) NSMutableArray *selectedTypesArray;
@property (strong, nonatomic) NSMutableDictionary *typesDictionary;
@property BOOL haveWatts, haveVolts, haveAmps, haveOhms;

- (void)setTextForLabels;
- (void)calculate;

@end

@implementation CalculatorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calculator = [[Calculator alloc] init];
    self.typesDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@0, @"watts", @0, @"volts", @0, @"amps", @0, @"ohms", nil];
    self.haveWatts = NO;
    self.haveVolts = NO;
    self.haveAmps = NO;
    self.haveOhms = NO;
    
    [self setTextForLabels];
    
    self.selectedTypesArray = [[NSMutableArray alloc] init];
    
    self.typesDictionary[@"watts"] = @52;
    self.typesDictionary[@"volts"] = @10;
    [self returnSelectedType:0 andValue:@"52"];
    [self returnSelectedType:1 andValue:@"10"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTextForLabels {
    self.wattsLabel.text = [NSString stringWithFormat:@"%@", self.typesDictionary[@"watts"]];
    self.voltsLabel.text = [NSString stringWithFormat:@"%@", self.typesDictionary[@"volts"]];
    self.ampsLabel.text = [NSString stringWithFormat:@"%@", self.typesDictionary[@"amps"]];
    self.ohmsLabel.text = [NSString stringWithFormat:@"%@", self.typesDictionary[@"ohms"]];
}

- (void)calculate {
    if (!self.haveWatts) {
        if (self.haveVolts && self.haveAmps) {
            self.typesDictionary[@"watts"] = [NSNumber numberWithInt:[self.calculator calculateWattsWithVolts:[self.typesDictionary[@"volts"] intValue] andAmps:[self.typesDictionary[@"amps"] intValue]]];
        } else if (self.haveVolts && self.haveOhms) {
            self.typesDictionary[@"watts"] = [NSNumber numberWithInt:[self.calculator calculateWattsWithVolts:[self.typesDictionary[@"volts"] intValue] andOhms:[self.typesDictionary[@"ohms"] intValue]]];
        } else if (self.haveAmps && self.haveOhms) {
            self.typesDictionary[@"watts"] = [NSNumber numberWithInt:[self.calculator calculateWattsWithAmps:[self.typesDictionary[@"amps"] intValue] andOhms:[self.typesDictionary[@"ohms"] intValue]]];
        }
    }
    
    if (!self.haveVolts) {
        if (self.haveAmps && self.haveOhms) {
            self.typesDictionary[@"volts"] = [NSNumber numberWithInt:[self.calculator calculateVoltsWithAmps:[self.typesDictionary[@"amps"] intValue] andOhms:[self.typesDictionary[@"ohms"] intValue]]];
        } else if (self.haveWatts && self.haveAmps) {
            self.typesDictionary[@"volts"] = [NSNumber numberWithInt:[self.calculator calculateVoltsWithWatts:[self.typesDictionary[@"watts"] intValue] andAmps:[self.typesDictionary[@"amps"] intValue]]];
        } else if (self.haveWatts && self.haveOhms) {
            self.typesDictionary[@"volts"] = [NSNumber numberWithInt:[self.calculator calculateVoltsWithWatts:[self.typesDictionary[@"watts"] intValue] andOhms:[self.typesDictionary[@"ohms"] intValue]]];
        }
    }
    
    if (!self.haveAmps) {
        if (self.haveVolts && self.haveOhms) {
            self.typesDictionary[@"amps"] = [NSNumber numberWithInt:[self.calculator calculateAmpsWithVolts:[self.typesDictionary[@"volts"] intValue] andOhms:[self.typesDictionary[@"ohms"] intValue]]];
        } else if (self.haveWatts && self.haveVolts) {
            self.typesDictionary[@"amps"] = [NSNumber numberWithInt:[self.calculator calculateAmpsWithWatts:[self.typesDictionary[@"watts"] intValue] andVolts:[self.typesDictionary[@"volts"] intValue]]];
        } else if (self.haveWatts && self.haveOhms) {
            self.typesDictionary[@"amps"] = [NSNumber numberWithInt:[self.calculator calculateAmpsWithWatts:[self.typesDictionary[@"watts"] intValue] andOhms:[self.typesDictionary[@"ohms"] intValue]]];
        }
    }
    
    if (!self.haveOhms) {
        if (self.haveVolts && self.haveAmps) {
            self.typesDictionary[@"ohms"] = [NSNumber numberWithInt:[self.calculator calculateOhmsWithVolts:[self.typesDictionary[@"volts"] intValue] andAmps:[self.typesDictionary[@"amps"] intValue]]];
        } else if (self.haveVolts && self.haveWatts) {
            self.typesDictionary[@"ohms"] = [NSNumber numberWithInt:[self.calculator calculateOhmsWithVolts:[self.typesDictionary[@"volts"] intValue] andWatts:[self.typesDictionary[@"watts"] intValue]]];
        } else if (self.haveWatts && self.haveAmps) {
            self.typesDictionary[@"ohms"] = [NSNumber numberWithInt:[self.calculator calculateOhmsWithWatts:[self.typesDictionary[@"watts"] intValue] andAmps:[self.typesDictionary[@"amps"] intValue]]];
        }
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddVoltagePopover"]) {
        self.typeSelectionVC = (TypeSelectionViewController *)segue.destinationViewController;
        self.typeSelectionVC.modalPresentationStyle = UIModalPresentationPopover;
        self.typeSelectionVC.popoverPresentationController.delegate = self;
    }
}

#pragma mark - Button Actions

- (IBAction)clearAction:(UIBarButtonItem *)sender {
    self.typesDictionary[@"watts"] = @0;
    self.typesDictionary[@"volts"] = @0;
    self.typesDictionary[@"amps"] = @0;
    self.typesDictionary[@"ohms"] = @0;
    [self setTextForLabels];
    self.addButton.enabled = YES;
    [self.selectedTypesArray removeAllObjects];
}


#pragma mark - UIPopoverPresentationControllerDelegate

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
//    TypeSelectionViewController *typesVC = (TypeSelectionViewController *)popoverPresentationController.presentingViewController;
//    [self returnSelectedType:[typesVC.pickerView selectedRowInComponent:0] andValue:typesVC.valueTextField.text];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

#pragma mark - TypeSelectionDelegate

- (void)returnSelectedType:(NSInteger)type andValue:(NSString *)value {
    switch (type) {
        case 0:
            self.wattsLabel.text = value;
            self.haveWatts = YES;
            self.typesDictionary[@"watts"] = (NSNumber *)value;
            break;
            
        case 1:
            self.voltsLabel.text = value;
            self.haveVolts = YES;
            self.typesDictionary[@"volts"] = (NSNumber *)value;
            break;
            
        case 2:
            self.ampsLabel.text = value;
            self.haveAmps = YES;
            self.typesDictionary[@"amps"] = (NSNumber *)value;
            break;
            
        case 3:
            self.ohmsLabel.text = value;
            self.haveOhms = YES;
            self.typesDictionary[@"ohms"] = (NSNumber *)value;
            break;
            
        default:
            break;
    }
    
    [self.selectedTypesArray addObject:value];
    if (self.selectedTypesArray.count == 2) {
        self.addButton.enabled = NO;
        [self calculate];
        [self setTextForLabels];
    }
    
//    [self.typeSelectionVC dismissViewControllerAnimated:YES completion:nil];

}


@end
