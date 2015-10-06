//
//  ViewController.h
//  TouchGoo
//
//  Created by Chris Paveglio on 1/27/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooCell.h"


@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, UITableViewDataSource, UITabBarDelegate>
{
    NSMutableData *googleData;
    
    NSMutableArray *resultsArray;
}

@property (weak, nonatomic) IBOutlet UITableView *resultTable;
@property (weak, nonatomic) IBOutlet UITextField *searchTermTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

- (IBAction)performSearch:(id)sender;

@end
