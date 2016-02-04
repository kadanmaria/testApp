//
//  Cell.m
//  testApp
//
//  Created by Admin on 03.02.16.
//  Copyright © 2016 OrgName. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 10, 120, 50)];
        self.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 65, 120, 50)];
        self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];

        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.photo];
        
        [self autorelease];
        [self.titleLabel release];
        [self.subTitleLabel release];
        [self.photo release];
    }
    return self;
}

-(void)prepareForReuse {
    [super prepareForReuse];
    self.titleLabel.text = nil;
    self.subTitleLabel.text = nil;
    self.photo.image = nil;
}

//-(void)layoutSubviews {
//    [super layoutSubviews];
//    self.titleLabel.frame = CGRectMake(130, 10, 120, 50);
//    self.subTitleLabel.frame = CGRectMake(130, 65, 120, 50);
//    self.photo.frame = CGRectMake(0, 0, 120, 120);
//}

-(void)setCell:(Cell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
