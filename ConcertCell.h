//
//  ConcertCell.h
//  Bailey_FinalProject
//
//  Created by Andrew Bailey on 6/21/14.
//  Copyright (c) 2014 Andrew Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConcertCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel *venuNameLabel;
@property (nonatomic,strong) IBOutlet UILabel *venueAddressLabel;
@property (nonatomic,strong) IBOutlet UILabel *concertDateLabel;
@property (nonatomic,strong) IBOutlet UILabel *venueLatLongLabel;

@end
