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

@interface CalculatorTableViewController () <TypeSelectionDelegate>

@property (weak, nonatomic) IBOutlet UILabel *wattsLabel;
@property (weak, nonatomic) IBOutlet UILabel *voltsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ampsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ohmsLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (strong, nonatomic) Calculator *calculator;

@property (strong, nonatomic) NSMutableArray *selectedTypesArray;
@property (strong, nonatomic) NSMutableDictionary *typesDictionary;
@property BOOL haveWatts, haveVolts, haveAmps, haveOhms;

- (void)setTextForLabels;
- (void)calculate;

@end

@implementation CalculatorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.typesDictionary = [[NSMutableDictionary alloc] initWithObjects:@[@0, @0 ,@0 ,@0] forKeys:@[@"watts", @"volts", @"amps", @"ohms"]];
    self.haveWatts = NO;
    self.haveVolts = NO;
    self.haveAmps = NO;
    self.haveOhms = NO;
    
    [self setTextForLabels];
    
    self.selectedTypesArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTextForLabels {
    self.wattsLabel.text = (NSString *)self.typesDictionary[@"watts"];
    self.voltsLabel.text = (NSString *)self.typesDictionary[@"volts"];
    self.ampsLabel.text = (NSString *)self.typesDictionary[@"amps"];
    self.ohmsLabel.text = (NSString *)self.typesDictionary[@"ohms"];
}

- (void)calculate {
    if (!self.haveWatts) {
        if (self.haveVolts && self.haveAmps) {
            self.typesDictionary[@"watts"] = [NSNumber numberWithInt:[self.calculator calculateWattsWithVolts:[self.typesDictionary[@"volts"] intValue] andAmps:[self.typesDictionary[@"amps"] intValue]]];
        }
    }
    
    if (!self.haveVolts) {
        
    }
    
    if (!self.haveAmps) {
        
    }
    
    if (!self.haveOhms) {
        
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddVoltagePopover"]) {
        TypeSelectionViewController *typeSelectionVC = (TypeSelectionViewController *)segue.destinationViewController;
        typeSelectionVC.delegate = self;
    }
}

#pragma mark - Button Actions

- (IBAction)clearAction:(UIBarButtonItem *)sender {
    [self.typesDictionary setValue:@0 forKey:@"watts"];
    [self.typesDictionary setValue:@0 forKey:@"volts"];
    [self.typesDictionary setValue:@0 forKey:@"amps"];
    [self.typesDictionary setValue:@0 forKey:@"ohms"];
    [self setTextForLabels];
    self.addButton.enabled = YES;
    [self.selectedTypesArray removeAllObjects];
}


#pragma mark - UIPopoverPresentationControllerDelegate

#pragma mark - TypeSelectionDelegate

- (void)returnSelectedType:(NSInteger)type andValue:(NSString *)value {
    NSLog(@"Row: %ld", (long)type);
    NSLog(@"Value: %@", value);
    switch (type) {
        case 0:
            self.wattsLabel.text = value;
            self.haveWatts = YES;
            [self.typesDictionary setValue:(NSNumber *)value forKey:@"watts"];
            break;
            
        case 1:
            self.voltsLabel.text = value;
            self.haveVolts = YES;
            [self.typesDictionary setValue:(NSNumber *)value forKey:@"volts"];
            break;
            
        case 2:
            self.ampsLabel.text = value;
            self.haveAmps = YES;
            [self.typesDictionary setValue:(NSNumber *)value forKey:@"amps"];
            break;
            
        case 3:
            self.ohmsLabel.text = value;
            self.haveOhms = YES;
            [self.typesDictionary setValue:(NSNumber *)value forKey:@"ohms"];
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
}


@end
