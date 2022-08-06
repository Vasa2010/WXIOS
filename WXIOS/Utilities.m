//
//  Utilities.m
//  WXIOS
//
//  Created by iwaxT on 06/08/2022.
//

#import "Utilities.h"

@implementation Utilities



char *MIDIObjectRef_to_charPtr(MIDIObjectRef object){
    if(object){
        CFStringRef name = nil;
        MIDIObjectGetStringProperty(object, kMIDIPropertyName, &name);
        CFIndex length = CFStringGetLength(name);
        CFIndex maxSize = CFStringGetMaximumSizeForEncoding(length, kCFStringEncodingUTF8) + 1;
        char *buffer = (char *)malloc(maxSize);
        if(!CFStringGetCString(name, buffer, maxSize, kCFStringEncodingUTF8)){
            buffer[0] = 0;
        }
        CFRelease(name);
        
        return buffer;
    }else{
        char *buffer = (char *)malloc(1);
        buffer[0] = 0;
        return buffer;
    }
    
}

@end
