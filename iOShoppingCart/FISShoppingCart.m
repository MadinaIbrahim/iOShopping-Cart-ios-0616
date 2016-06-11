//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Madina Ibrahim on 6/10/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h" //header file has been imported into this new implementation (.m) file 

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents { // calculate the sum of the priceInCents property of all the items in the items array. Naturally, this should return 0 if the items array is empty.
    
    NSInteger itemTotalPriceInCents = 0;
    for(FISItem *item in self.items) {
        itemTotalPriceInCents += item.priceInCents;
    }
    
    return itemTotalPriceInCents;
    
}

- (void) addItem: (FISItem*) item {  // add the submitted item to the items array, even if the item is already in the items array.
    
    [self.items addObject:item];
    
}

- (void) removeItem: (FISItem*) item {  // remove a single occurrence of an item in the items array.
    
    NSUInteger itemToRemove = [self.items indexOfObject:item];
    
    [self.items removeObjectAtIndex:itemToRemove];
    
}

- (void) removeAllItemsLikeItem: (FISItem*) item {  // remove all occurrences of an item in the items array.
    [self.items removeObject:item];
    
}

- (void) sortItemsByNameAsc {  // sort the contents of the items array by their name property in ascending order (alphabetical).
    
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
        [self.items sortUsingDescriptors:@[sortByNameAsc]];
}

- (void) sortItemsByNameDesc {  // sort the contents of the items array by their name property in descending order.
    
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    
        [self.items sortUsingDescriptors:@[sortByNameDesc]];
}

- (void) sortItemsByPriceInCentsAsc {  // sort the contents of the items array by the priceInCents property in ascending order.
    
    NSSortDescriptor *sortByPriceInCentsAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    
        [self.items sortUsingDescriptors:@[sortByPriceInCentsAsc]];
}

- (void) sortItemsByPriceInCentsDesc {  // sort the the contents of the items array by the priceInCents property in descending order.
    
    NSSortDescriptor *sortByPriceInCentsDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    
        [self.items sortUsingDescriptors:@[sortByPriceInCentsDesc]];
}

- (NSArray*) allItemsWithName: (NSString*) name {  // return an array containing only the items whose name property matches the argument string.
    
    NSMutableArray *onlyMatchName = [[NSMutableArray alloc]init];
    
        for (FISItem *item in self.items) {
        
                if ([item.name isEqualToString:name]) {
                        [onlyMatchName addObject:item];
                    }
        }
    return onlyMatchName;
    
        }


- (NSArray*) allItemsWithMinimumPriceInCents: (NSUInteger) minimumPriceInCents {  // return an array containing only the items whose priceInCents property is greater than or equal to the argument integer.
    
    NSPredicate *priceGreaterThanMinimumPredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", minimumPriceInCents];
    
        NSArray *priceGreaterThanMinimum = [self.items filteredArrayUsingPredicate:priceGreaterThanMinimumPredicate];

    
        return priceGreaterThanMinimum;

    
}

- (NSArray*) allItemsWithMaximumPriceInCents: (NSUInteger) maximumPriceInCents {  // return an array containing only those items whose priceInCents property is less than or equal to the argument integer.
    
    NSPredicate *priceLessThanMaximumPredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", maximumPriceInCents];
    
        NSArray *priceLessThanMaximum = [self.items filteredArrayUsingPredicate:priceLessThanMaximumPredicate];
    
    
        return priceLessThanMaximum;
    
}



@end
