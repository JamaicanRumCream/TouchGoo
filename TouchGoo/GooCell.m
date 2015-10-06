//
//  GooCell.m
//  TouchGoo
//
//  Created by Chris Paveglio on 1/27/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "GooCell.h"

@implementation GooCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)goToSite:(id)sender
{
    //button to go to url, already done in cdna app
}
@end
