//
//  Tickets.h
//  MidTerm_Ritika
//
//  Created by user248634 on 10/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tickets : NSObject
@property (nonatomic) NSString* ticketType;
- (instancetype)initTicketsWithType:(NSString*) type;
@end

NS_ASSUME_NONNULL_END
