//
//  CheckoutViewController.m
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import "CheckoutViewController.h"

@interface CheckoutViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *checkoutTableView;
@property bool commentAdded;
@property bool voucherAdded;
@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commentAdded=NO;
    self.voucherAdded=NO;
    // Do any additional setup after loading the view.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowNumber =[self.cvcTicketStore getSelectedTicketsListCount];
    if(![self.cvcComment isEqualToString:@""]){
        self.commentAdded=YES;
        rowNumber++;
    }
    if(![self.cvcVoucher isEqualToString:@""]){
        self.voucherAdded =YES;
        rowNumber++;
    }
    return rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkoutCell" forIndexPath:indexPath];
    if(indexPath.row<[self.cvcTicketStore getSelectedTicketsListCount]){
        cell.textLabel.text = [self.cvcTicketStore getSelectedTicketTypeAtIndex:indexPath.row];
        cell.detailTextLabel.text = [self.cvcTicketStore getSelectedTicketQuantityAtIndex:indexPath.row];
    }else if(self.commentAdded && indexPath.row==[self.cvcTicketStore getSelectedTicketsListCount]){
        cell.textLabel.text = @"Comment:";
        cell.detailTextLabel.text = self.cvcComment;
    }else if(self.voucherAdded){
        cell.textLabel.text = @"Voucher Code:";
        cell.detailTextLabel.text = self.cvcVoucher;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle==UITableViewCellEditingStyleDelete){
        [self.cvcTicketStore removeSelectedTicketatIndex:indexPath.row];
    }
    [tableView reloadData];
}
- (IBAction)doneButtonPressed {
    [self.delegate dismissCheckoutViewController];
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
