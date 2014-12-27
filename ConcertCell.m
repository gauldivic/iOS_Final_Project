//
//  ConcertCell.m
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/21/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import "ConcertCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ConcertCell
@synthesize venuNameLabel,venueAddressLabel,concertDateLabel,venueLatLongLabel;

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

@end
