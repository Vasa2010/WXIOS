//
//  WXChordRecognizer.m
//  WXIOS
//
//  Created by iwaxT on 06/08/2022.
//



#import "WXChordRecognizer.h"

@implementation WXChordRecognizer


-(void)addNote:(int)noteNumber{
    self.bitMap = self.bitMap | (1 << (noteNumber%EXTENSION));
    UInt64 codiceAccordo= [self mapChordTrim:self.bitMap];
   // [self DecodeChord:(int)codiceAccordo];
   // self.preChordCodeNumber=(int)codiceAccordo;
   // DLog(@"__codiceAccordo=%i   preChordCodeNumber:%i",(int)codiceAccordo,self.preChordCodeNumber);
    
}

-(void)removeNote:(int)noteNumber{
    self.bitMap = self.bitMap & ~(1 << (noteNumber%EXTENSION));
  //  UInt64 cc= [self mapChordTrim:self.bitMap];
    
    }



-(UInt64)mapChordTrim:(UInt64)chordNumber{
    self.trimSteps = 0;
    while(!(chordNumber & 1) && chordNumber){
        chordNumber >>= 1;
        (self.trimSteps)++;
    }
    return chordNumber;
}





#pragma mark - class instance

+(instancetype)sharedInstance{
    static WXChordRecognizer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WXChordRecognizer alloc] init];
        // Do any other initialisation stuff here
    });
    
   [WXChordRecognizer sharedInstance].chordInfo = [NSMutableDictionary new];
    [[WXChordRecognizer sharedInstance].chordInfo setValue:@"test" forKey:@"testKey"];
    return sharedInstance;
}

-(instancetype)init{
    if (self = [super init]) { /* */  }
    self.chordInfo = [NSMutableDictionary new];
    return self;
}
@end
