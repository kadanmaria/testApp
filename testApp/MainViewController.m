//
//  MainViewController.m
//  testApp
//
//  Created by Admin on 01.02.16.
//  Copyright © 2016 OrgName. All rights reserved.
//

#import "MainViewController.h"
#import "Cell.h"

@interface MainViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *plistArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame: self.view.bounds];
    self.tableView = tableView;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"]];
    [self.tableView registerClass:[Cell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
    [tableView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(Cell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dictionary = [self.plistArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = [dictionary objectForKey:@"title"];
    cell.subTitleLabel.text = [dictionary objectForKey:@"subtitle"];
    cell.photo.image = [UIImage imageNamed:[dictionary objectForKey:@"image_name"]];
    cell.photo.contentMode = UIViewContentModeScaleAspectFit;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 //   return [[UIImage imageNamed:[[self.plistArray objectAtIndex:indexPath.row] objectForKey:@"image_name"]] size].height;
    return 120;
}

#pragma mark - DataSourse Implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.plistArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    Cell *cell = (Cell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
          cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}



@end