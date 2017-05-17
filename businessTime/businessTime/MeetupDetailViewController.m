//
//  MeetupDetailViewController.m
//  businessTime
//
//  Created by Eve Denison on 5/16/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "MeetupDetailViewController.h"

@interface MeetupDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)NSMutableArray *allMeetups;


@end

@implementation MeetupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.allMeetups = [[NSMutableArray alloc]init];
    
    
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.allMeetups count];
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    
//    
//}

@end
