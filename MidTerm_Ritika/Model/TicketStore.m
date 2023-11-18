//
//  TicketStore.m
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import "TicketStore.h"
#import "Tickets.h"
#import "SelectedTickets.h"

@interface TicketStore()
@property (nonatomic) NSMutableArray* ticketsList;
@property (nonatomic) NSMutableArray* selectedTicketsList;
@property (nonatomic) NSString* selectedTicketsString;
@end

@implementation TicketStore
-(NSMutableArray*) ticketsList{
    if(_ticketsList==nil){
        Tickets* vipTicket = [[Tickets alloc]initTicketsWithType:@"VIP"];
        Tickets* businessTicket = [[Tickets alloc]initTicketsWithType:@"Business"];
        Tickets* ecoAdultTicket = [[Tickets alloc]initTicketsWithType:@"Economy Adult"];
        Tickets* ecoKidTicket = [[Tickets alloc]initTicketsWithType:@"Economy Kid"];
        Tickets* infantTicket = [[Tickets alloc]initTicketsWithType:@"Infant"];
        
        _ticketsList = [[NSMutableArray alloc]initWithObjects:vipTicket,businessTicket,ecoAdultTicket,ecoKidTicket,infantTicket, nil];
        
    }
    return _ticketsList;
}

-(NSMutableArray*) selectedTicketsList{
    if(_selectedTicketsList==nil){
        _selectedTicketsList = [[NSMutableArray alloc]init];
    }
    
    return _selectedTicketsList;
}

-(NSInteger) getTicketsListCount{
    return self.ticketsList.count;
}

-(NSString*) getTicketTypeAtIndex:(NSInteger) index{
    Tickets* ticket = [self.ticketsList objectAtIndex:index];
    return ticket.ticketType;
}

-(void) addToSelectedTicketListAtIndex:(NSInteger) index WithQuantity:(int) quant{
    Tickets* ticket = [self.ticketsList objectAtIndex:index];
    SelectedTickets* selectedTicket = [[SelectedTickets alloc]initSelectedTicketsWithType:ticket.ticketType andWithQuantity:quant];
    [self.selectedTicketsList addObject:selectedTicket];
}

-(NSInteger) getSelectedTicketsListCount{
    return self.selectedTicketsList.count;
}

-(NSString*) getSelectedTicketTypeAtIndex:(NSInteger) index{
    SelectedTickets *st = [self.selectedTicketsList objectAtIndex:index];
    return st.ticketType;
}

-(NSString*) getSelectedTicketQuantityAtIndex:(NSInteger) index{
    SelectedTickets *st = [self.selectedTicketsList objectAtIndex:index];
    return [NSString stringWithFormat:@"%d",st.ticketQuantity];
}

-(void) removeSelectedTicketatIndex:(NSInteger) index{
    [self.selectedTicketsList removeObjectAtIndex:index];
}

-(void) clearSelectedTicketsList{
    [self.selectedTicketsList removeAllObjects];
}
@end
