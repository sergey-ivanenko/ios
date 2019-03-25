#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    NSArray* matrix = [self parseStringArray:array];
    
    NSInteger sumPrimaryDiagonal = 0;
    NSInteger sumSecondaryDiagonal = 0;
    
    for (int i = 0; i < [matrix count]; i++) {
        for (int j = 0; j < [matrix count]; j++) {
            if (i == j) {
                sumPrimaryDiagonal += [[[matrix objectAtIndex:i] objectAtIndex:j] integerValue];
            }
            if (i + j == ([matrix count] - 1)) {
                sumSecondaryDiagonal += [[[matrix objectAtIndex:i] objectAtIndex:j] integerValue];
            }
        }
    }
    
    return @(ABS(sumPrimaryDiagonal - sumSecondaryDiagonal));
}

-(NSArray*) parseStringArray:(NSArray*)array {
    NSMutableArray* matrix = [NSMutableArray array];
    
    for (NSString* internalArray in array) {
        @autoreleasepool {
            NSArray* stringNumbers = [internalArray componentsSeparatedByString:@" "];
            NSMutableArray* numberArray = [NSMutableArray new];
            for (NSString* str in stringNumbers) {
                NSNumber* number = [NSNumber numberWithInteger:[str integerValue]];
                if ([number integerValue] < -100 || [number integerValue] > 100) {
                    return nil;
                }
                [numberArray addObject:number];
            }
            [matrix addObject:numberArray];
        }
    }
    
    return matrix;
}

@end
