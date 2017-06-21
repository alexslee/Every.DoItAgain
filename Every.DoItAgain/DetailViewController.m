//
//  DetailViewController.m
//  Every.DoItAgain
//
//  Created by Alex Lee on 2017-06-21.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "DetailViewController.h"
#import "MyThemes.h"
@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *priorityField;

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.titleLabel.text = self.detailItem.title;
        self.detailDescriptionLabel.text = self.detailItem.todoDescription;
        self.priorityField.text = [NSString stringWithFormat:@"%d",self.detailItem.priorityNumber];
        self.titleLabel.theme_textColor = globalTextColorPicker;
        self.detailDescriptionLabel.theme_textColor = globalTextColorPicker;
        self.priorityField.theme_textColor = globalTextColorPicker;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.theme_backgroundColor = globalBackgroundColorPicker;
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(Todo *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
