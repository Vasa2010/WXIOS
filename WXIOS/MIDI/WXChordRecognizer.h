//
//  WXChordRecognizer.h
//  WXIOS
//
//  Created by iwaxT on 06/08/2022.
//

#import <Foundation/Foundation.h>
#define EXTENSION 36
NS_ASSUME_NONNULL_BEGIN

@interface WXChordRecognizer : NSObject

@property(nonatomic,readwrite) UInt64   bitMap;
@property(nonatomic,readwrite) int      trimSteps;

-(void)addNote:(int)noteNumber;
-(void)removeNote:(int)noteNumber;
-(UInt64)mapChordTrim:(UInt64)chordNumber;

@property(nonatomic,readwrite) NSMutableDictionary *chordInfo;


#pragma mark - class instance
+(instancetype)sharedInstance;
-(instancetype)init;
@end

NS_ASSUME_NONNULL_END
/*
 WXChordRecognizer information Keys
 
 trimSteps          trimStepsKey
 chordUniqueCode    chordUniqueCodeKey
 chordCode          chordCodeKey
 rootName           rootNameKey
 rootNumber         rootNumberKey
 
 lowestName         lowestNameKey
 lowestNumber       lowestNumberKey
 
 chordFamily        chordFamilyKey
 
 
 */
