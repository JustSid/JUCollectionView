//
//  JUCollectionViewAppDelegate.m
//  JUCollectionView
//
//  Copyright (c) 2011 by Sidney Just
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
//  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
//  and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
//  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
//  FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (NSUInteger)numberOfCellsInCollectionView:(JUCollectionView *)view
{
    return [content count];
}

- (JUCollectionViewCell *)collectionView:(JUCollectionView *)view cellForIndex:(NSUInteger)index
{
    JUCollectionViewCell *cell = [view dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell)
        cell = [[[JUCollectionViewCell alloc] initWithReuseIdentifier:@"cell"] autorelease];
    
    [cell setImage:[content objectAtIndex:index]];
    
    return cell;
}

- (void)collectionView:(JUCollectionView *)_collectionView didSelectCellAtIndex:(NSUInteger)index
{
    NSLog(@"Selected cell at index: %ui", (unsigned int)index);
    NSLog(@"Position: %@", NSStringFromPoint([_collectionView positionOfCellAtIndex:index]));
}




- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    content = [[NSMutableArray alloc] init];
    
    for(int i=0; i<1000; i++) // This creates 59000 elements!
    {
        [content addObject:[NSImage imageNamed:NSImageNameQuickLookTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameBluetoothTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameIChatTheaterTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameSlideshowTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameActionTemplate]]; 
        [content addObject:[NSImage imageNamed:NSImageNameSmartBadgeTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameIconViewTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameListViewTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameColumnViewTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameFlowViewTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNamePathTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameInvalidDataFreestandingTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameLockLockedTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameLockUnlockedTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameGoRightTemplate]]; 
        [content addObject:[NSImage imageNamed:NSImageNameGoLeftTemplate]]; 
        [content addObject:[NSImage imageNamed:NSImageNameRightFacingTriangleTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameLeftFacingTriangleTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameAddTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameRemoveTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameRevealFreestandingTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameFollowLinkFreestandingTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameEnterFullScreenTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameExitFullScreenTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameStopProgressTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameStopProgressFreestandingTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameRefreshTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameRefreshFreestandingTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameBonjour]];
        [content addObject:[NSImage imageNamed:NSImageNameComputer]];
        [content addObject:[NSImage imageNamed:NSImageNameFolderBurnable]];
        [content addObject:[NSImage imageNamed:NSImageNameFolderSmart]];
        [content addObject:[NSImage imageNamed:NSImageNameFolder]];
        [content addObject:[NSImage imageNamed:NSImageNameNetwork]];
        [content addObject:[NSImage imageNamed:NSImageNameDotMac]];
        [content addObject:[NSImage imageNamed:NSImageNameMobileMe]];
        [content addObject:[NSImage imageNamed:NSImageNameMultipleDocuments]];
        [content addObject:[NSImage imageNamed:NSImageNameUserAccounts]];
        [content addObject:[NSImage imageNamed:NSImageNamePreferencesGeneral]];
        [content addObject:[NSImage imageNamed:NSImageNameAdvanced]];
        [content addObject:[NSImage imageNamed:NSImageNameInfo]];
        [content addObject:[NSImage imageNamed:NSImageNameFontPanel]];
        [content addObject:[NSImage imageNamed:NSImageNameColorPanel]];
        [content addObject:[NSImage imageNamed:NSImageNameUser]];
        [content addObject:[NSImage imageNamed:NSImageNameUserGroup]];
        [content addObject:[NSImage imageNamed:NSImageNameEveryone]];  
        [content addObject:[NSImage imageNamed:NSImageNameUserGuest]];
        [content addObject:[NSImage imageNamed:NSImageNameMenuOnStateTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameMenuMixedStateTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameApplicationIcon]];
        [content addObject:[NSImage imageNamed:NSImageNameTrashEmpty]];
        [content addObject:[NSImage imageNamed:NSImageNameTrashFull]];
        [content addObject:[NSImage imageNamed:NSImageNameHomeTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameBookmarksTemplate]];
        [content addObject:[NSImage imageNamed:NSImageNameCaution]];
        [content addObject:[NSImage imageNamed:NSImageNameStatusAvailable]];
        [content addObject:[NSImage imageNamed:NSImageNameStatusPartiallyAvailable]];
        [content addObject:[NSImage imageNamed:NSImageNameStatusUnavailable]];
        [content addObject:[NSImage imageNamed:NSImageNameStatusNone]];
    }
    
    [collectionView reloadData];
    [collectionView setCellSize:NSMakeSize(64.0, 64.0)];
}

@end
