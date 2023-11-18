//
//  Tickets.m
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import "Tickets.h"


@implementation Tickets
- (instancetype)initTicketsWithType:(NSString*) type
{
    self = [super init];
    if (self) {
        self.ticketType = type;
    }
    return self;
}
@end
