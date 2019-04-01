#import "RomanTranslator.h"

@implementation RomanTranslator

- (NSString *)romanFromArabic:(NSString *)arabicString {
    [arabicString retain];
    
    NSDictionary* arabicRoman = [NSDictionary dictionaryWithObjectsAndKeys:
                                               @"M", [NSNumber numberWithInteger:1000],
                                               @"CM", [NSNumber numberWithInteger:900],
                                               @"D", [NSNumber numberWithInteger:500],
                                               @"CD", [NSNumber numberWithInteger:400],
                                               @"C", [NSNumber numberWithInteger:100],
                                               @"XC", [NSNumber numberWithInteger:90],
                                               @"L", [NSNumber numberWithInteger:50],
                                               @"XL", [NSNumber numberWithInteger:40],
                                               @"X", [NSNumber numberWithInteger:10],
                                               @"IX", [NSNumber numberWithInteger:9],
                                               @"V", [NSNumber numberWithInteger:5],
                                               @"IV", [NSNumber numberWithInteger:4],
                                               @"I", [NSNumber numberWithInteger:1], nil];
    
    NSMutableString *romanString = [NSMutableString string];
    NSInteger arabic = arabicString.integerValue;
    NSArray* keys = [[[[arabicRoman allKeys]
                       sortedArrayUsingSelector:@selector(compare:)]
                       reverseObjectEnumerator] allObjects];
    
    for (int i = 0; i < arabicRoman.count; i++) {
        if (arabic > 0) {
            for (NSNumber* key in keys) {
                if (arabic >= key.integerValue) {
                    arabic -= key.integerValue;
                    [romanString appendString:[arabicRoman objectForKey:key]];
                }
            }
        }
    }
    
    //[arabicString release];
    //[romanString autorelease];
    return romanString;
}

- (NSString *)arabicFromRoman:(NSString *)romanString {
    [romanString retain];
    
    NSInteger result = [self toArabic:romanString];
    
    return [NSString stringWithFormat:@"%ld", result];
}

-(NSInteger)toArabic:(NSString*)romanString {
    [romanString retain];
    
    NSArray* arabicValues = @[@(1000), @(900), @(500), @(400),
                             @(100), @(90), @(50), @(40),
                             @(10), @(9), @(5), @(4), @(1)];
    NSArray* romanValues = @[@"M", @"CM", @"D", @"CD",
                            @"C", @"XC", @"L", @"XL",
                            @"X", @"IX", @"V", @"IV", @"I"];
    
    NSMutableString* roman = [NSMutableString stringWithFormat:@"%@", romanString];
    
    for (int i = 0; i < romanValues.count; i++) {
        if([roman hasPrefix:[romanValues objectAtIndex:i]]) {
            return [[arabicValues objectAtIndex:i] integerValue] + [self toArabic:[roman stringByReplacingCharactersInRange:NSMakeRange(0, [[romanValues objectAtIndex:i] length]) withString:@""]];
        }
    }
    
    return 0;
}

@end
