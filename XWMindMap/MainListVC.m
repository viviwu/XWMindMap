//
//  MainListVC.m
//  XWMindMap
//
//  Created by qway on 16/5/20.
//  Copyright © 2016年 qway. All rights reserved.
//

#import "MainListVC.h"
#import "MindMapVC.h"

@interface MainListVC ()<UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MainListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [_tableView  registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView ==_tableView) {
        return 3;
    }
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView ==_tableView) {
        return 3;
    }
    return 7;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=nil;
    if (tableView ==_tableView) {
        cell=[tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    }else{
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"search"];
        }
    }
    cell.textLabel.text=[NSString stringWithFormat:@"Cell%ld, %ld", (long)indexPath.section, (long)indexPath.row];
    cell.detailTextLabel.text=@"MindMap";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"prepare segue :%@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"MindMap"]) {
        
        MindMapVC *vc = segue.destinationViewController; 
        vc.caseID = [NSString stringWithFormat:@"%d--%d", (int)_tableView.indexPathForSelectedRow.section, (int)_tableView.indexPathForSelectedRow.row];
        
    }
}


@end
