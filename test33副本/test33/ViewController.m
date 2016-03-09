//
//  ViewController.m
//  test33
//
//  Created by lanou on 16/3/4.
//  Copyright © 2016年 蓝欧. All rights reserved.
//

#import "ViewController.h"
#import "FristPage.h"
#import "FristPageTableViewCell.h"


#define  FirstoneURL @"http://api.v.lengxiaohua.cn:8080/?srv=3001&cid=641230&uid=0&tms=20160304145326&sig=dffc5871b03f04b2&wssig=9a5a0b868766864b&os_type=1&version=36&page_size=20&since_id=34167"

#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define ScreenH  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView ;
@property(nonatomic,strong)NSMutableArray *ModleArr ;
@property(nonatomic,strong)NSMutableDictionary *dic3;

@end

@implementation ViewController



//懒加载 解析tableview数据
-(NSMutableArray *)ModleArr{
    if (!_ModleArr) {
        _ModleArr = [NSMutableArray array];
        NSURLSession *session = [NSURLSession sharedSession];
        //    NSURL *url = [NSURL URLWithString:Frist];
        //    NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:FirstoneURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dic2 = [dic valueForKey: @"data"];
            
            NSArray *arr1 = [dic2 valueForKey: @"items"];
            
            for (NSDictionary *Datadic in arr1) {
                self.dic3 = [Datadic valueForKey:@"video"];
                FristPage *model = [[FristPage alloc]init];
                
                [model setValuesForKeysWithDictionary:self.dic3 ];
                [self.ModleArr addObject:model];
                NSLog(@"-----%@",self.ModleArr);
                
            }
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        }];
        [task resume];
    }
    return _ModleArr;
    
}


//-(NSMutableDictionary *)dic2{
//    if (!_dic2) {
//        _dic2 = [[NSMutableDictionary alloc]init];
//    }
//    return _dic2 ;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO ;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"妹妹确认为eververy";
    [self gettableView];
    
    
    
    
}


#pragma mark - Table view data source

-(void)gettableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self ;
    self.tableView.delegate = self ;
    self.tableView.separatorColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FristPageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"reuseId"];
    
}





//tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.ModleArr.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return @"❤️猜你喜欢" ;
}

//设置分区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor brownColor];

    
    return view ;
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FristPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseId" forIndexPath:indexPath];
    
//    
//    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
 
    
    FristPage *model = self.ModleArr[indexPath.row];
    cell.frist  = model ;
    
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
