//
//  WXMidiPorts.m
//  WXIOS
//
//  Created by iwaxT on 06/08/2022.
//

#import "WXMidiPorts.h"

#define WXMidiPortsDEBUG 0

@implementation WXMidiPorts

-(void)refresh{

#pragma mark ArrayOfSourceDevices
    self.ArrayOfSourceDevices=[[NSMutableArray alloc]init];
    int numOfSources=(int)MIDIGetNumberOfSources();
    
    if (numOfSources>0) {
        for (int i=0; i<numOfSources; i++){
            MIDIEndpointRef temp_in=MIDIGetSource(i);
            char *midiObjectName=MIDIObjectRef_to_charPtr(temp_in);
            NSString *_name=[NSString stringWithUTF8String:midiObjectName];
            free(midiObjectName);
           
#ifdef WXMidiPortsDEBUG
            DLog(@"[%d - %d] SOURCE DEVICE NAME : %s",i,numOfSources,midiObjectName);
#endif
            [self.ArrayOfSourceDevices insertObject:_name atIndex:i];
        }//END_FOR
        
    }//END_IF
    
    
    
#pragma mark ArrayOfDestinationMidiDevices
    self.ArrayOfDestinationMidiDevices=[[NSMutableArray alloc]init];
    int numOfDestinations=(int)MIDIGetNumberOfDestinations();
    if (numOfDestinations>0) {
        for (int i=0; i<numOfDestinations; i++) {
            MIDIEndpointRef temp_out=MIDIGetDestination(i);
            char *midiDestObjectName=MIDIObjectRef_to_charPtr(temp_out);
            NSString *_name=[NSString stringWithUTF8String:midiDestObjectName];
            free(midiDestObjectName);
            
#ifdef WXMidiPortsDEBUG
            DLog(@"[%d - %d] Destination DEVICE NAME : %s",i,numOfDestinations,midiDestObjectName);
#endif
            [self.ArrayOfDestinationMidiDevices insertObject:_name atIndex:i];
        }//END_FOR
    }//END_IF
}



#pragma mark - class instance

+(instancetype)sharedInstance{
    static WXMidiPorts *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WXMidiPorts alloc] init];
        // Do any other initialisation stuff here
    });
    
    [[WXMidiPorts sharedInstance] refresh];
    return sharedInstance;
}

-(instancetype)init{
    if (self = [super init]) { /* */  }
    [self refresh];
    return self;
}
@end



//-(void)listDevices{
//    ItemCount sourceCount = MIDIGetNumberOfSources();
//
//  //  NSLog(@"MIDIGetNumberOfSources = %lu",sourceCount);
//
//
//    for(ItemCount i = 0; i < sourceCount; ++i){
//        MIDIEndpointRef source = MIDIGetSource(i);
//        char *r = MIDIObjectRef_to_charPtr(source);
//      //  printf("SOURCE DEVICE NAME: %s \t- No.%lu \n", r, i);
//        free(r);
//    }
//
//
//
//
//    self.ArrayOf_inMidiDevices=[[NSMutableArray alloc]init];
//    int nIn= (int)MIDIGetNumberOfSources();
//
//    if (nIn>0)
//    {
//        for (int i=0; i<nIn; i++)
//        {
//            MIDIEndpointRef  temp_in=MIDIGetSource(i);
//            char *ss = MIDIObjectRef_to_charPtr(temp_in);
//            NSString *_name=[NSString stringWithUTF8String:ss];
//            free(ss);
//         //   NSLog(@"in list  :  %@   -- \n",_name);
//            [self.ArrayOf_inMidiDevices insertObject:_name atIndex:i];
//        }
//
//    }
//
//
//
//
//    self.ArrayOf_OutMidiDevices=[[NSMutableArray alloc]init];
//    int nOut= (int)MIDIGetNumberOfDestinations();
//    if (nOut>0)
//    {
//        for (int i=0; i<nOut; i++)
//        {
//            MIDIEndpointRef  temp_out=MIDIGetDestination(i);
//            char *ss=MIDIObjectRef_to_charPtr(temp_out);
//            NSString *_name=[NSString stringWithUTF8String:ss];
//            free(ss);
//          //  NSLog(@"out list :  %@   -- \n",_name);
//            [self.ArrayOf_OutMidiDevices insertObject:_name atIndex:i];
//        }
//    }
//
//}
