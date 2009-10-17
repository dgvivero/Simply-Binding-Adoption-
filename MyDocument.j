/* original code from Apple at 
http://developer.apple.com/mac/library/samplecode/SimpleBindingsAdoption/index.html#//apple_ref/doc/uid/DTS10004326

Abstract: A document class to manage a single track object.
 
 Version: 2.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by  Apple Inc. ("Apple") in consideration of your agreement to the following terms, and your use, installation, modification or redistribution of this Apple software constitutes acceptance of these terms.  If you do not agree with these terms, please do not use, install, modify or redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and subject to these terms, Apple grants you a personal, non-exclusive license, under Apple's copyrights in this original Apple software (the "Apple Software"), to use, reproduce, modify and redistribute the Apple Software, with or without modifications, in source and/or binary forms; provided that if you redistribute the Apple Software in its entirety and without modifications, you must retain this notice and the following text and disclaimers in all such redistributions of the Apple Software.  Neither the name, trademarks, service marks or logos of Apple Inc.  may be used to endorse or promote products derived from the Apple Software without specific prior written permission from Apple.  Except as expressly stated in this notice, no other rights or licenses, express or implied, are granted by Apple herein, including but not limited to any patent rights that may be infringed by your derivative works or by other works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2007 Apple Inc. All Rights Reserved.
*/

@import <AppKit/CPObjectController.j>
@import <AppKit/CPDocument.j>
@import "Track.j"

CPLogRegister(CPLogConsole);
@implementation MyDocument : CPDocument
{
    IBOutlet CPSlider slider;
    IBOutlet CPTextField textField;
	
	Track track;
}

/*
 NSDocument method to initialize the user interface
 */
- (void)windowControllerDidLoadNib:(CPWindowController) aController
{
    //[super windowControllerDidLoadNib:aController]; if not coment do an infinite loop
	
	// establish bindings programmatically
	
	controller = [[CPObjectController alloc] init];
    [controller bind:@"contentObject" toObject:self withKeyPath:@"track" options:nil];
	
	[textField bind:@"value" toObject:controller withKeyPath:@"selection.volume" options:nil];
	[slider bind:@"value" toObject:controller withKeyPath:@"selection.volume" options:nil];
	
}


/*
 sets track's volumeto 0
 */
- (IBAction)muteTrack:(id)sender
{
	[track setVolume:0.0];
}



/*
 * These methods are the same for all implementations
 */

/*
 standard init method
 creates an instance of Track and sets its volume to 5.0
 */
- init
{
	if (self = [super init])
	{
		track = [[Track alloc] init];
		[track setVolume:5.0];
		mainBundle = [CPBundle mainBundle];
		[mainBundle loadCibFile:"MyDocument.cib" 
					externalNameTable:[CPDictionary dictionaryWithObject:self forKey:CPCibOwner]
        			loadDelegate:self];
        
		
	}
	return self;	
}

/*
 NSDocument method to return the name of the nib file for the document
 */
- (CPString)windowCibName
{
    return @"MyDocument";
}

- (void)cibDidFinishLoading:(CPCib)aCib
{
     [self makeWindowControllers];
     [self windowControllerDidLoadNib:[self windowControllers]];
     CPLog.info(@"ejecute cibDid");

     //[self performActions];
}
/*
 accessor methods for track
 */
- (Track)track
{
    return track;
}

- (void)setTrack:(Track)newTrack
{
    if (track != newTrack)
	{
        track = newTrack;
    }
}

 
@end