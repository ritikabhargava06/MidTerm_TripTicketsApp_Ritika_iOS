//
//  SelectedTickets.h
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import "Tickets.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectedTickets : Tickets
@property int ticketQuantity;
- (instancetype)initSelectedTicketsWithType:(NSString*) type andWithQuantity:(int) qnt;
@end

NS_ASSUME_NONNULL_END
