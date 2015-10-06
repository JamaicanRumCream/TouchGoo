//
//  GooCell.h
//  TouchGoo
//
//  Created by Chris Paveglio on 1/27/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GooCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *visibleUrlLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleNoFormLabel;

@property (nonatomic, weak) NSString *actualURL; //use url not visUrl

- (IBAction)goToSite:(id)sender;
@end
