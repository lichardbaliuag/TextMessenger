//
//  selectDateViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 14/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "selectDateViewController.h"
#import "AddMessViewController.h"

#define kDatePickerTag 100

@interface selectDateViewController ()

@end

@implementation selectDateViewController
@synthesize datePicker = _datePicker;
@synthesize dailyButton = _dailyButton;
@synthesize weeklyButton = _weeklyButton;
@synthesize monthlyButton = _monthlyButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Initialize UIPickerView
    _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 180, 300, 160)];
    [_datePicker addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventValueChanged];

    [_datePicker setMinuteInterval:1];
    [_datePicker setTag: kDatePickerTag];
    
    
    //NSDateFormatter *formatter = [[[NSDateFormatter alloc]init]autorelease];
    //[formatter setDateFormat:@"dd-MMM-YYY h:mm a"];
    
    [self.view addSubview:_datePicker];
    //[_datePicker release];

	//-- The DAILY Button --//
    _dailyButton = [UIButton buttonWithType:UIButtonTypeCustom];
	_dailyButton.frame = CGRectMake(10, 130, 90.0f, 30.0f);                                 // 10, 130, 80.0f, 30.0f
	_dailyButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;                    // Send button misalign here
    [_dailyButton setTitle:@"Daily" forState:UIControlStateNormal];                         // UIControlStateHighlighted
    //[_dailyButton setTitle:@"Daily" forState:UIControlStateHighlighted];
    [_dailyButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _dailyButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
	//_sendButton.titleLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    _dailyButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _dailyButton.layer.borderWidth = 0.5f;
    _dailyButton.layer.cornerRadius = 10;
    [_dailyButton addTarget:self action:@selector(dailyButtPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_dailyButton];
 
    //-- The WEEKLY Button --//
    _weeklyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _weeklyButton.frame = CGRectMake(115, 130, 90.0f, 30.0f);
    _weeklyButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [_weeklyButton   setTitle:@"Weekly" forState:UIControlStateNormal];
    [_weeklyButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _weeklyButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    _weeklyButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _weeklyButton.layer.borderWidth = 0.5f;
    _weeklyButton.layer.cornerRadius = 10;
    [_weeklyButton addTarget:self action:@selector(weeklyButtPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_weeklyButton];
    
    //-- The WEEKLY Button --//
    _monthlyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _monthlyButton.frame = CGRectMake(220, 130, 90.0f, 30.0f);
    _monthlyButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [_monthlyButton   setTitle:@"Monthly" forState:UIControlStateNormal];
    [_monthlyButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _monthlyButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    _monthlyButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _monthlyButton.layer.borderWidth = 0.5f;
    _monthlyButton.layer.cornerRadius = 10;
    [_monthlyButton addTarget:self action:@selector(monthlyButtPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_monthlyButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
- (IBAction)cancelButton:(id)sender
{
    [super cancelAndDismiss];
}
*/

- (void) pickDate:(id)sender
{
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"dd-MMM-YYY h:mm a "];
    // Gets our picker
    _chosenDate = [_datePicker date];
    //NSDate *chosenDate = [NSDate date];
    _dateString = [NSString stringWithFormat:@"%@", [_formatter stringFromDate:_chosenDate]];
    
}


- (IBAction)doneButton:(id)sender
{

    AddMessViewController *amv = [self.storyboard instantiateViewControllerWithIdentifier:@"AddMessViewController"];
    //amv.sendDate.titleLabel.text = [NSString stringWithFormat:@"%@",[_formatter stringFromDate:_chosenDate]];
    [amv.sendDate setTitle:_dateString forState:UIControlEventValueChanged];
    
    [self.delegate passDateString:self didPassDateString:_dateString];
    
    if  ([_chosenDate isEqual:nil])
    {
        _chosenDate = [_datePicker date];
        NSLog(@"%@",[NSString stringWithFormat:@"%@", _chosenDate]);
    }
    //[_formatter release];
    
    NSLog(@"%@",[NSString stringWithFormat:@"%@", _chosenDate]);
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dailyButtPressed:(id)sender {
}


- (IBAction)weeklyButtPressed:(id)sender {
    
}


- (IBAction)monthlyButtPressed:(id)sender {
    
}


- (void)dealloc {
    //[super dealloc];
    
}
@end
