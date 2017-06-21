//
//  DetailViewController.h
//  Every.DoItAgain
//
//  Created by Alex Lee on 2017-06-21.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Every_DoItAgain+CoreDataModel.h"
#import "Global.h"
#import <SwiftTheme/SwiftTheme-Swift.h>
@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

