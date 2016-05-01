//
//  CalculatorTableViewController.m
//  HighVoltage
//
//  Created by Donny Davis on 5/1/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "CalculatorTableViewController.h"
#import "TypeSelectionViewController.h"

@interface CalculatorTableViewController () <UIPopoverPresentationControllerDelegate, TypeSelectionDelegate>

@end

@implementation CalculatorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VoltageCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddVoltagePopover"]) {
        TypeSelectionViewController *typeSelection = (TypeSelectionViewController *)[segue destinationViewController];
        typeSelection.delegate = self;
    }
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    NSLog(@"Did dismiss popover");
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationFullScreen;
}

#pragma mark - TypeSelectionDelegate

- (void)returnSelectedType:(NSInteger)type andValue:(NSString *)value {
    NSLog(@"Row: %ld", (long)type);
    NSLog(@"Value: %@", value);
}


@end
