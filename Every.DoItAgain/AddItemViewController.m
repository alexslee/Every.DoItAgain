//
//  AddItemViewController.m
//  Every.DoItAgain
//
//  Created by Alex Lee on 2017-06-21.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextField *descriptionField;

@property (weak, nonatomic) IBOutlet UITextField *priorityField;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addTodo:(UIButton *)sender {
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Todo" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *managedObject = [[NSManagedObject alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:self.managedObjectContext];
    [managedObject setValue:self.titleField.text forKey:@"title"];
    [managedObject setValue:self.descriptionField.text forKey:@"todoDescription"];
    [managedObject setValue:[NSNumber numberWithInt:[self.priorityField.text intValue]] forKey:@"priorityNumber"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
