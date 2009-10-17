/*
 * AppController.j
 * track
 *
 * Created by You on October 16, 2009.
 * Copyright 2009, Your Company All rights reserved.
 * original code from Apple at 
 * http://developer.apple.com/mac/library/samplecode/SimpleBindingsAdoption/index.html#//apple_ref/doc/uid/DTS10004326
 */

@import <Foundation/CPObject.j>
@import "MyDocument.j"
@import "Track.j"


@implementation AppController : CPObject
{
  CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 
    
    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullBridge:YES];
    myDocument = [[MyDocument alloc] init];
    
    
   
    
        
 }

@end
