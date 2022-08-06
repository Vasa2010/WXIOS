//
//  Utilities.h
//  WXIOS
//
//  Created by iwaxT on 06/08/2022.
//


#ifndef Utilities_h
#define Utilities_h

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMIDI/CoreMIDI.h>

#if __has_feature(objc_arc)
  #define DLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
  #define DLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif


char *MIDIObjectRef_to_charPtr(MIDIObjectRef object);



NS_ASSUME_NONNULL_BEGIN

@interface Utilities : NSObject






@end

NS_ASSUME_NONNULL_END

#endif /* utis_h */
