//
//  ViewController.m
//
//  Created by Kamil Powałowski on 10.01.2015.
//  Copyright (c) 2015 Hydra Softworks.
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "ViewController.h"
#import "HSDatePickerViewController.h"

@interface ViewController () <HSDatePickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) NSDate *selectedDate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDatePicker:(id)sender {
    HSDatePickerViewController *hsdpvc = [[HSDatePickerViewController alloc] init];
    hsdpvc.numOfComponent = 1;
    hsdpvc.delegate = self;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocalizedDateFormatFromTemplate:@"yyyy MM dd"];
    hsdpvc.dateFormatter = df;
    hsdpvc.numOfComponent = 1;
//    hsdpvc.view.backgroundColor = [UIColor whiteColor];
    hsdpvc.dismissOnCancelTouch = NO;
    hsdpvc.tintColor = [UIColor whiteColor];
    
    if (self.selectedDate) {
        hsdpvc.date = self.selectedDate;
    }
    [self presentViewController:hsdpvc animated:YES completion:nil];
}

#pragma mark - HSDatePickerViewControllerDelegate
- (void)hsDatePickerPickedDate:(NSDate *)date {
    NSLog(@"Date picked %@", date);
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    [dateFormater setLocalizedDateFormatFromTemplate:@"yyyy.MM.dd HH:mm:ss"];
    self.dateLabel.text = [dateFormater stringFromDate:date];
    
    self.selectedDate = date;
}

//optional
- (void)hsDatePickerDidDismissWithQuitMethod:(HSDatePickerQuitMethod)method {
    NSLog(@"Picker did dismiss with %lu", method);
}

//optional
- (void)hsDatePickerWillDismissWithQuitMethod:(HSDatePickerQuitMethod)method {
    NSLog(@"Picker will dismiss with %lu", method);
}
@end
