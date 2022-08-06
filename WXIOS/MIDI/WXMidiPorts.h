//
//  WXMidiPorts.h
//  WXIOS
//
//  Created by iwaxT on 06/08/2022.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMIDI/CoreMIDI.h>
#import "Utilities.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXMidiPorts : NSObject


@property(nonatomic,strong)     NSMutableArray      *ArrayOfSourceDevices;
@property(nonatomic,strong)     NSMutableArray      *ArrayOfDestinationMidiDevices;

-(void)refresh;
//-(void)listDevices;










+(instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END










