//
//  MainViewController.m
//  testApp
//
//  Created by Admin on 01.02.16.
//  Copyright © 2016 OrgName. All rights reserved.
//

#import "MainViewController.h"
#import "Data.m"

@interface MainViewController()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, retain) NSArray *plistArray;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain]; ///QUESTION STATUS BAR
    self.tableView = tableView;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    self.tableView.rowHeight = 60;
    
    self.view = self.tableView;
    
    [tableView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

#pragma mark - DataSourse Implementation
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.plistArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UIImageView *imageView;
    
    NSDictionary *dictionary = [self.plistArray objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) // cell is nil
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15+cell.frame.size.height, 10, cell.frame.size.width - 15-cell.frame.size.height, cell.frame.size.height/2-10)]; //????????????????????? как быть с размерами
        subTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15+cell.frame.size.height, 34, cell.frame.size.width - 15 - cell.frame.size.height, cell.frame.size.height/2-10)];
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.height-10, cell.frame.size.height-10)];
        NSLog(@"%f %f",cell.frame.size.height,cell.frame.size.width );
        NSLog(@"%f %f",cell.frame.size.width - 15-cell.frame.size.height, cell.frame.size.height/2-10);
        titleLabel.tag = 1;
        subTitleLabel.tag = 2;
        imageView.tag = 3;
    
        [cell.contentView addSubview:titleLabel];
        [cell.contentView addSubview:subTitleLabel];
        [cell.contentView addSubview:imageView];
  
        [cell autorelease];
        [titleLabel release];
        [subTitleLabel release];
        [imageView release];
    }
    else
    {
        titleLabel = (UILabel *)[cell.contentView viewWithTag:1];
        subTitleLabel = (UILabel *)[cell.contentView viewWithTag:2];
        imageView = (UIImageView *)[cell.contentView viewWithTag:3];
    }
    
//    titleLabel.backgroundColor = [UIColor redColor];
    titleLabel.text = [dictionary objectForKey:@"title"];
    
//    subTitleLabel.backgroundColor = [UIColor blueColor];
    subTitleLabel.text = [dictionary objectForKey:@"subtitle"];
    
    imageView.image = [UIImage imageNamed:[dictionary objectForKey:@"image_name"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    return cell;
}

#pragma mark - Override

-(id)init
{
    self = [super init];
    if(self)
    {
        NSError *errorDescription;
        NSPropertyListFormat format;
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        self.plistArray = (NSArray *)[NSPropertyListSerialization propertyListWithData:plistXML options:NSPropertyListImmutable format:&format error:&errorDescription];
        if(!self.plistArray)
            NSLog(@"ERROR reading the plist %@, format - %lu", errorDescription, (unsigned long)format);
        else {
            NSLog(@"Successed and count is %lu", (unsigned long)[self.plistArray count]);
            for (NSDictionary *d in self.plistArray)
                NSLog(@"%@", d);
        }
    
    }
    return self;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end