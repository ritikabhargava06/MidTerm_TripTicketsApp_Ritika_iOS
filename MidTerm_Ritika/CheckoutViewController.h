//
//  CheckoutViewController.h
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import <UIKit/UIKit.h>
#import "TicketStore.h"

NS_ASSUME_NONNULL_BEGIN

@protocol cvcDelegate
-(void) dismissCheckoutViewController;
@end

@interface CheckoutViewController : UIViewController
@property (nonatomic) TicketStore* cvcTicketStore;
@property (nonatomic,weak) id<cvcDelegate> delegate;
@property (nonatomic) NSString* cvcComment;
@property (nonatomic) NSString* cvcVoucher;
@end

NS_ASSUME_NONNULL_END
