//
//  ViewController.m
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import "ViewController.h"
#import "TicketStore.h"
#import "CheckoutViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,cvcDelegate>
@property (weak, nonatomic) IBOutlet UITextField *ticketQuantityTxtF;
@property bool isFirstTicket;
@property (weak, nonatomic) IBOutlet UITextView *ticketTextView;
@property (nonatomic) TicketStore* myTicketStore;
@property (weak, nonatomic) IBOutlet UITextField *commentTextF;
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property (weak, nonatomic) IBOutlet UITextField *voucherCodeTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ticketTextView.text = @"";
    self.isFirstTicket = YES;
    // Do any additional setup after loading the view.
}

-(TicketStore*) myTicketStore{
    if(_myTicketStore==nil){
        _myTicketStore = [[TicketStore alloc]init];
    }
    return _myTicketStore;
}

- (IBAction)addButtonPressed {
    NSInteger selectedRow = [self.myPickerView selectedRowInComponent:0];
    if(![self.ticketQuantityTxtF.text isEqualToString:@""]){
        int quantity = [self.ticketQuantityTxtF.text intValue];
        [self.myTicketStore addToSelectedTicketListAtIndex:selectedRow WithQuantity:quantity];
        NSString* tType = [self.myTicketStore getTicketTypeAtIndex:selectedRow];
        if(self.isFirstTicket){
            self.ticketTextView.text = [NSString stringWithFormat:@"%@ quantity is %d\n",tType,quantity];
        }else{
            self.ticketTextView.text = [NSString stringWithFormat:@"%@ %@ quantity is %d\n",self.ticketTextView.text,tType,quantity];
        }
        self.isFirstTicket=NO;
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.myTicketStore getTicketsListCount];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.myTicketStore getTicketTypeAtIndex:row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CheckoutViewController* cvc = segue.destinationViewController;
    cvc.cvcTicketStore = self.myTicketStore;
    cvc.cvcComment = self.commentTextF.text;
    cvc.cvcVoucher = self.voucherCodeTF.text;
    cvc.delegate = self;
    
}

- (void)dismissCheckoutViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.ticketQuantityTxtF.text=@"";
    self.ticketTextView.text=@"";
    self.commentTextF.text=@"";
    self.voucherCodeTF.text=@"";
    [self.myTicketStore clearSelectedTicketsList];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank You!" message:@"Enjoy Your Trip" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
