#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    NSInteger summ = 0;
    for (NSNumber* number in array) {
        summ += [number integerValue];
    }
    // NSNumber* summ = [array valueForKeyPath:@"@summ.self"];
    
    return @(summ);
}

@end
