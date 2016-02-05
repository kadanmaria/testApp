//
//  Cell.m
//  testApp
//
//  Created by Admin on 03.02.16.
//  Copyright © 2016 OrgName. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc] init];
        UILabel *subTitleLabel = [[UILabel alloc] init];
        UIImageView *photo = [[UIImageView alloc] init];
        self.titleLabel = titleLabel;
        self.subTitleLabel = subTitleLabel;
        self.photo = photo;

        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.photo];
        
        [titleLabel release];
        [subTitleLabel release];
        [photo release];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.titleLabel.text = nil;
    self.subTitleLabel.text = nil;
    self.photo.image = nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    self.titleLabel.frame = CGRectMake(height + height/12, height/8, width - (height + height/12), height/4);
    self.subTitleLabel.frame = CGRectMake(height + height/12, 5*height/8, width - (height + height/12), height/4);
    self.photo.frame = CGRectMake(0, 0, height, height);
}

@end