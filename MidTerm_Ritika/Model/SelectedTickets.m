//
//  SelectedTickets.m
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import "SelectedTickets.h"

@implementation SelectedTickets
- (instancetype)initSelectedTicketsWithType:(NSString*) type andWithQuantity:(int) qnt
{
    self = [super initTicketsWithType:type];
    if (self) {
        self.ticketQuantity = qnt;
    }
    return self;
}
@end
