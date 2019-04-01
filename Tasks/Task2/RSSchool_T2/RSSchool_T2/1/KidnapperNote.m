#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    [magaine retain];
    [note retain];
    //[magaine autorelease];
    //[note autorelease];
    NSMutableString* str = [NSMutableString stringWithCapacity:magaine.length];
    [str appendString:magaine.lowercaseString];
    
    NSArray* noteArray = [note.lowercaseString componentsSeparatedByString:@" "];
    //[noteArray autorelease];
    
    for (NSString* word in noteArray) {
        if (![str containsString:word.lowercaseString]) {
            return NO;
        }
        [str setString:[str stringByReplacingOccurrencesOfString:word withString:@""]];
    }
    
    return YES;
}
@end
