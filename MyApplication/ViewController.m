//
//  ViewController.m
//  MyApplication
//
//  Created by 黄建芳 on 7/24/15.
//  Copyright (c) 2015 黄建芳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UIPickerView *myPickerView;
@property (nonatomic, strong) NSDictionary *books;
@property (nonatomic, strong) NSArray *authors;
@property (nonatomic, strong) NSString *selectedAuthor;
@property (nonatomic, strong) NSString *strongStr;
@property (nonatomic, copy)   NSString *myCopyStr;
@property (nonatomic, strong) UILabel *redPoint;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

//@synthesize authors;
//@synthesize books;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redPoint = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 20, 20)];
    self.redPoint.layer.backgroundColor = [[UIColor orangeColor] CGColor];
    self.redPoint.layer.cornerRadius = 10.0;
    self.redPoint.text = @"5";
    self.redPoint.textColor = [UIColor whiteColor];
    self.redPoint.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.redPoint];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(200, 200, 100, 30);
    [button setTitle:@"动画" forState:UIControlStateNormal];

    [self.view addSubview:button];
    [button addTarget:self action:@selector(beginCUstomAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *string = @"sfsadaggafa";
    NSString *string1 = @"sfsadaggafasfsadaggafasfsadaggafasfsadaggafasfsadaggafasfsadaggafa";
    CGRect rect = [string boundingRectWithSize:CGSizeMake(50, 20) options:NSStringDrawingUsesDeviceMetrics attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0], NSFontAttributeName, nil] context:nil];
    UILabel *testLabel = [[UILabel alloc] initWithFrame:rect];
    testLabel.text = string;
    [self.view addSubview:testLabel];
    
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(220, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    testLabel.frame = CGRectMake(100, 100, size.width + 10, size.height);
    
//    NSString *originString =@"China";
//    NSString *muString = [originString mutableCopy];
//    [(NSMutableString *)muString appendString:@"Love"];
//    NSLog(@"after append, muString=%@", muString);
//    NSString *str = [NSString stringWithFormat:@"a"];
//    NSString *str2 = @"a";
//    NSString *str3 = str;
//    self.myCopyStr = str2;
//    //self.strongStr = str2;
//    
//    
//    self.strongStr = [str2 mutableCopy];
//    NSLog(@"str2 : %p", str2);
//    NSLog(@"change2 %p", self.strongStr);
    
//    NSLog(@"str : %p", str);
//    NSLog(@"str2 : %p", str2);
//    NSLog(@"str3 : %p", str3);
//    NSLog(@"copy : %p", self.myCopyStr);
//    NSLog(@"strong : %p", self.strongStr);
//    NSString *copiedStr = [str copy];
//    str2 = [str2 stringByAppendingString:@"a"];
//    NSLog(@"after copy str : %p", copiedStr);
//    NSLog(@"change %@", self.myCopyStr);
//    NSLog(@"change1 %@", copiedStr);
//    NSLog(@"change2 %@", self.strongStr);
    
//    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"b"];
//    self.strongStr = mutableStr;
//    self.myCopyStr = mutableStr;
//    NSLog(@"%p", mutableStr);
//    NSLog(@"mutable string : %@", mutableStr);
//    NSLog(@"----------------");
//    NSLog(@"copy : %p", self.myCopyStr);
//    NSLog(@"strong : %p", self.strongStr);
//    
//    [mutableStr appendString:@"bbbb"];
//    NSLog(@"%p", mutableStr);
//    NSLog(@"change mutable string : %@", mutableStr);
//    NSLog(@"copy : %p", self.myCopyStr);
//    NSLog(@"strong : %p", self.strongStr);
//    NSLog(@"copy : %@", self.myCopyStr);
//    NSLog(@"strong : %@", self.strongStr);
    
    // Do any additional setup after loading the view, typically from a nib.
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSArray *array = [UIApplication sharedApplication].windows;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSArray *array = [UIApplication sharedApplication].windows;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    return YES;
}
- (void)beginCUstomAnimation
{
    //[UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    //[UIView setAnimationDuration:2];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //self.redPoint.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    
    [UIView animateWithDuration:2
                     animations:^{
        self.redPoint.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
                     }
                     completion:^(BOOL finish){
                         [UIView animateWithDuration:1
                                          animations:^{
                                              self.redPoint.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                                          }completion:^(BOOL finish){}];
                     }];
    
    [UIView commitAnimations];
}

- (void)click:(UIBarButtonItem *)item
{
    NSLog(@"click finish");
}

- (void)clickFinish:(id)item
{
    NSLog(@"%@", [item class]);
    //[item superview];
    NSLog(@"click cancel");
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    // 如果是第一列，返回authors中元素的个数
    // 即authors包含多少个元素，第一列包含多少个列表项
    if (component == 0) {
        return self.authors.count;
    }
    // 如果是其他列（只有第二列），
    // 返回books中selectedAuthor对应的NSArray中元素的个数
    return [[self.books objectForKey:self.selectedAuthor] count];
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为
// UIPickerView中指定列和列表项上显示的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component
{
    // 如果是第一列，返回authors中row索引处的元素
    // 即第一列的元素由authors集合元素决定
    if (component == 0) {
        return [self.authors objectAtIndex:row];
    }
    // 如果是其他列（只有第二列），
    // 返回books中selectedAuthor对应的NSArray中row索引处的元素
    return [[self.books objectForKey:self.selectedAuthor] objectAtIndex:row];
}
// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if(component == 0)
    {
        // 改变被选中的作者
        self.selectedAuthor = [self.authors objectAtIndex:row];
        // 控制重写加载第二个列表，根据选中的作者来加载第二个列表
        [self.myPickerView reloadComponent:1];
    }
    NSArray* tmp  = component == 0 ? self.authors:
    [self.books objectForKey:self.selectedAuthor];
    NSString* tip = component == 0 ? @"作者": @"图书";
    // 使用一个UIAlertView来显示用户选中的列表项
    UIAlertView* alert = [[UIAlertView alloc]
                          initWithTitle:@"提示"
                          message:[NSString stringWithFormat:@"你选中的%@是：%@，"
                                   , tip , [tmp objectAtIndex:row]]
                          delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为
// UIPickerView中指定列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:
(NSInteger)component
{
    // 如果是第一列，宽度为90
    if (component == 0) {
        return 90;
    }
    return 210;  // 如果是其他列（只有第二列），宽度为210
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
