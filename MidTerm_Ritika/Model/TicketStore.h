//
//  TicketStore.h
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketStore : NSObject
-(NSInteger) getTicketsListCount;
-(NSString*) getTicketTypeAtIndex:(NSInteger) index;
-(void) addToSelectedTicketListAtIndex:(NSInteger) index WithQuantity:(int) quant;
-(NSInteger) getSelectedTicketsListCount;
-(NSString*) getSelectedTicketTypeAtIndex:(NSInteger) index;
-(NSString*) getSelectedTicketQuantityAtIndex:(NSInteger) index;
-(void) removeSelectedTicketatIndex:(NSInteger) index;
-(void) clearSelectedTicketsList;
@end

NS_ASSUME_NONNULL_END
