//
//  DetailViewController.m
//  TableViewFlicker
//
//  Created by Jorge Leandro Perez on 1/14/15.
//  Copyright (c) 2015 Lantean. All rights reserved.
//

#import "DetailViewController.h"



static const CGFloat EstimatedHeight    = 150;
static const CGFloat RealHeight         = 120;
static const NSInteger NumberOfRows     = 5;
static const NSInteger NumberOfSections = 1;


@implementation DetailViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSTimeInterval delay = 0.1;
    [self performSelector:@selector(refresh) withObject:nil afterDelay:delay];
}

- (void)refresh
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    [self.tableView beginUpdates];

    for (NSInteger i = 0; i < 5; ++i)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    [self.tableView endUpdates];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return NumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return NumberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return EstimatedHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RealHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text     = [NSString stringWithFormat:@"%ld.%ld", indexPath.section, indexPath.row];
    cell.backgroundColor    = indexPath.row % 2 ? [UIColor redColor] : [UIColor blueColor];
    
    return cell;
}

@end
