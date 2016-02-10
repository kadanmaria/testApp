//
//  ViewController.m
//  App
//
//  Created by Admin on 07.02.16.
//  Copyright © 2016 OrgName. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *plistArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)refresh:(UIButton *)sender {
    self.tableView.estimatedRowHeight = 140.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"]];
    [self.tableView reloadData];
}

#pragma mark - TableViewDataSourse Implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.plistArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = [[NSString alloc] initWithFormat:@"Cell"];
    Cell *cell = (Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    NSDictionary *dictionary = [self.plistArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = [dictionary objectForKey:@"title"];
    cell.subTitleLabel.text = [dictionary objectForKey:@"subtitle"];
    cell.photo.image = [UIImage imageNamed:[dictionary objectForKey:@"image_name"]];

    return cell;
}

@end
