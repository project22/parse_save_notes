//
//  ViewController.m
//  ParseTest
//
//  Created by Jon Paul Berti on 12/9/13.
//  Copyright (c) 2013 Spark Networks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userInput;

- (IBAction)button:(id)sender;
- (IBAction)logRecords:(id)sender;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    [testObject setObject:@"Monkey" forKey:@"Jones"];
//    [testObject save];
    
//    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 200)];
//    myLabel.text = @"Hello World";
//    [self.view addSubview:myLabel];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button:(id)sender {
    NSLog(@"Button pressed");
    NSLog(@"%@", _userInput.text);
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    [testObject setObject:_userInput.text forKey:@"myCOl"];
    testObject[@"playerName"] = _userInput.text;
    [testObject save];
    [self.userInput resignFirstResponder];
}

- (IBAction)logRecords:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    [query whereKey:@"myCOL" notEqualTo:@"Dan Stemkoski"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
//                NSString *playerName = object[@"myCOL"];
//                NSLog(@"%@", playerName);
                NSLog(@"%@", object[@"playerName"]);
//                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}


@end
